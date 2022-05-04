import 'package:doctors_de_peshawar/core/models/appuser.dart';
import 'package:doctors_de_peshawar/core/models/custom_auth_result.dart';
import 'package:doctors_de_peshawar/core/services/auth_exception.dart';
import 'package:doctors_de_peshawar/core/services/database_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final _auth = FirebaseAuth.instance;
  final _databaseServices = DatabaseServices();
  CustomAuthResult customAuthResult = CustomAuthResult();
  User? user;
  bool? isLogin;
  AppUser appUser = AppUser();
  // GoogleSignIn googleSignIn = GoogleSignIn();
  AppUser signUpUser = AppUser();
  String? _verificationId;

  AuthServices() {
    init();
  }

  init() async {
    user = _auth.currentUser;
    if (user != null) {
      isLogin = true;
      appUser = await _databaseServices.getUser(user!.uid);
    } else {
      isLogin = false;
    }
  }

  ///
  /// create new account
  ///
  Future<CustomAuthResult> signUpUserWithEmail(AppUser appUser) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
          email: appUser.email!.trim(), password: appUser.password!.trim());
      if (credential.user != null) {
        print('user registered');
        this.appUser = appUser;
        this.appUser.userId = credential.user!.uid;
        this.isLogin = true;
        print("SignUpUserId=> ${this.appUser.userId}");
        await _databaseServices.registerUser(appUser);
        this.appUser = await _databaseServices.getUser(credential.user!.uid);
        customAuthResult.user = credential.user;
      }
    } catch (e) {
      print('Exception@signUpUser $e');
      customAuthResult.errorMessage =
          AuthExceptionsService.generateExceptionMessage(e);
    }
    return customAuthResult;
  }

  ///
  /// Login user
  ///
  Future<CustomAuthResult> loginUser(AppUser appUser) async {
    try {
      final credentials = await _auth.signInWithEmailAndPassword(
          email: appUser.email!.trim(), password: appUser.password!.trim());
      print("User logined successfully");
      if (credentials.user != null) {
        customAuthResult.user = credentials.user;
        this.appUser = appUser;
        this.appUser.userId = credentials.user!.uid;
        this.isLogin = true;

        ///
        /// Get user
        ///
        this.appUser = await _databaseServices.getUser(credentials.user!.uid);
      }
    } catch (e) {
      print('Exception@LoginUser ==> $e');
      customAuthResult.errorMessage =
          AuthExceptionsService.generateExceptionMessage(e);
    }
    return customAuthResult;
  }

  ///
  /// Reset user password
  ///
  Future<bool> resetUserPassword(String email) async {
    try {
      print('Reset User password Email=>$email');
      await _auth.sendPasswordResetEmail(email: email);
      print('Link sent to Email=>$email');
      return true;
    } catch (e) {
      print("Exception@resetPassword ==> $e");
      return false;
    }
  }

  ///
  /// verify phone number
  ///
  Future<bool> verifyPhoneNumber(String phoneNumber) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber.trim(),
        timeout: Duration(seconds: 120),
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
          await _auth.signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (FirebaseAuthException e) {
          print("Verification failed");
          if (e.code == 'invalid-phone-number') {
            print('The provided phone number is not valid.');
          }
        },
        codeSent: (String verificationId, int? resendToken) {
          _verificationId = verificationId;
          print("codeSent verificationId ===> $verificationId");
          print("codeSent ==> verificationId ===> $_verificationId");
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // showSnackbar("verification code: " + verificationId);
          _verificationId = verificationId;
          print("verificationId ===> $verificationId");
          print("verificationId ===> $_verificationId");
        },
      );

      return true;
    } catch (e) {
      print("Exception@verifyPhoneNumber ===> $e");

      return false;
    }
  }

  ///
  /// SignIn with phone
  ///
  Future<CustomAuthResult> signInWithPhoneNumber(
      String smsCode, String phoneNumber) async {
    try {
      print("User phone number ===> $phoneNumber");
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: smsCode.trim(),
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      user = userCredential.user;
      this.appUser.userId = user!.uid;
      if (userCredential.user != null) {
        signUpUser = await _databaseServices.getUser(user!.uid);
        if (signUpUser.userId != null) {
          this.appUser = signUpUser;
        } else if (signUpUser.userId == null) {
          this.appUser.createdAt = DateTime.now();
          this.appUser.userName = "";
          this.appUser.phoneNumber = phoneNumber;
          await _databaseServices.registerUser(appUser);
        }
      }
      customAuthResult.user = user!;
      // customAuthResult.status = true;

      print("User phone number ====> ${user!.phoneNumber}");
      print("Successfully signed in UID: ${userCredential.user!.uid}");
    } catch (e) {
      print('Exception@siginInWithPhone ===> $e');
      customAuthResult.errorMessage =
          AuthExceptionsService.generateExceptionMessage(e);
    }
    return customAuthResult;
  }

  ///
  /// logout user
  ///
  logout() async {
    try {
      await _auth.signOut();
      appUser = AppUser();
      user = null;
      return true;
    } catch (e) {
      print("Exception@logoutUser ==> $e");
      return false;
    }
  }
}

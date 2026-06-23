import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static bool _googleInitialized = false;
  static bool _facebookInitialized = false;

  User? get currentUser => _auth.currentUser;
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<void> _ensureInitialized() async {
    if (!_googleInitialized) {
      _googleInitialized = true;
      try {
        await GoogleSignIn.instance.initialize(
          clientId: const String.fromEnvironment('GOOGLE_CLIENT_ID'),
        );
      } catch (e) {
        print('GoogleSignIn init error: $e');
      }
    }
    if (!_facebookInitialized && kIsWeb) {
      _facebookInitialized = true;
      await FacebookAuth.instance.webAndDesktopInitialize(
        appId: const String.fromEnvironment('FACEBOOK_APP_ID'),
        cookie: const bool.fromEnvironment('FACEBOOK_COOKIE', defaultValue: true),
        xfbml: const bool.fromEnvironment('FACEBOOK_XFBML', defaultValue: true),
        version: const String.fromEnvironment('FACEBOOK_APP_VERSION', defaultValue: 'v15.0'),
      );
    }
  }

  Future<UserCredential?> signInWithEmail(String email, String password) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential?> registerWithEmail(String email, String password) async {
    return await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  Future<UserCredential?> signInWithGoogle() async {
    await _ensureInitialized();

    try {
      final GoogleSignInAccount? account =
          await GoogleSignIn.instance.authenticate();

      if (account == null) return null;

      final GoogleSignInAuthentication googleAuth = await account.authentication;
      final String? idToken = googleAuth.idToken;

      String? accessToken;
      try {
        final authClient = account.authorizationClient;
        if (authClient != null) {
          final authz = await authClient.authorizationForScopes(['email', 'profile']);
          accessToken = authz?.accessToken;
        }
      } catch (_) {}

      final OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: idToken,
        accessToken: accessToken,
      );

      return await _auth.signInWithCredential(credential);
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) return null;
      rethrow;
    }
  }

  Future<UserCredential?> signInWithFacebook() async {
    await _ensureInitialized();
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.cancelled) return null;
    if (result.status != LoginStatus.success) {
      throw Exception(result.message ?? 'Facebook sign-in failed');
    }
    final OAuthCredential credential =
        FacebookAuthProvider.credential(result.accessToken!.tokenString);
    return await _auth.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    await GoogleSignIn.instance.signOut();
    await FacebookAuth.instance.logOut();
    await _auth.signOut();
  }
}

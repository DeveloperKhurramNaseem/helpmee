import 'dart:convert';
import 'dart:math';
import 'dart:developer' as dev;

import 'package:crypto/crypto.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:help_mee/data/models/social_signin.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

// 576560526503-lamq5bhht2645bdcg4dg71acb708rjev.apps.googleusercontent.com

class SocialSigninService {
  static const _scopes = <String>['email', 'profile'];
  String _generateNonce([int length = 32]) {
    final rnd = Random.secure();
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    return List.generate(
      length,
      (_) => charset[rnd.nextInt(charset.length)],
    ).join();
  }

  String _sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<SocialSignin?> signInWithApple() async {
    final rawNonce = _generateNonce();
    final hashedNonce = _sha256ofString(rawNonce);

    // This works for iOS native — no Android, no Web
    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: hashedNonce,
    );

    // identityToken is the JWT you send to your backend
    final identifier = credential.userIdentifier;
    if (identifier == null) return null;
    return SocialSignin(
      email: credential.email ?? '',
      provider: 'apple',
      providerId: credential.userIdentifier!,
    );
  }

  Future<SocialSignin?> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn.instance;

    // Important: initialize once before using
    await googleSignIn.initialize(
      // clientId is usually for iOS / web
      clientId: null, // or your platform-specific clientId
      serverClientId:
          '576560526503-tq8q2rprpn0cn3rhoc0sqeisii4jdojl.apps.googleusercontent.com', // your web client ID if you need server auth
    );

    try {
      // This replaces signIn()
      final account = await googleSignIn.authenticate(scopeHint: _scopes);            
      return SocialSignin(
        email: account.email,
        provider: 'google',
        providerId: account.id,
      );
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) {
        dev.log('User cancelled Google sign-in');
        return null;
      }
      dev.log('GoogleSignInException: code=${e.code}, desc=${e.description}');
      rethrow;
    } catch (e) {
      dev.log('Unexpected error: $e');
      rethrow;
    }
  }
}

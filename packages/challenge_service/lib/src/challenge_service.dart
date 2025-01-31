import 'package:challenge_service/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:google_sign_in/google_sign_in.dart';

class ChallengeService {
  const ChallengeService({
    required this.firebaseAuth,
    required this.googleSignIn,
  });
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;

  Future<User> loginWithGoogle() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        throw Exception('User cancelled the sign-in process');
      }
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await firebaseAuth.signInWithCredential(credential);
      if (firebaseAuth.currentUser == null) {
        throw Exception('Failed to sign in with Google');
      }
      final currentUser = firebaseAuth.currentUser!;
      return User(
        id: currentUser.uid,
        email: currentUser.email!,
        name: currentUser.displayName ?? '',
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<User> loginWithCredentials(String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (firebaseAuth.currentUser == null) {
        throw Exception('Failed to sign in with email and password');
      }
      final currentUser = firebaseAuth.currentUser!;
      return User(
        id: currentUser.uid,
        email: currentUser.email!,
        name: currentUser.displayName ?? '',
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> logout() async {
    await firebaseAuth.signOut();
  }

  User? get currentUser {
    final currentUser = firebaseAuth.currentUser;
    if (currentUser == null) {
      return null;
    }
    return User(
      id: currentUser.uid,
      email: currentUser.email!,
      name: currentUser.displayName ?? '',
    );
  }
}

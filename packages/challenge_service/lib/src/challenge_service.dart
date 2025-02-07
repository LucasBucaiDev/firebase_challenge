import 'package:challenge_service/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ChallengeService {
  const ChallengeService({
    required this.firebaseAuth,
    required this.googleSignIn,
  });
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;

  Future<Either<Exception, User>> loginWithGoogle() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        return left(Exception('User cancelled the sign-in process'));
      }

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await firebaseAuth.signInWithCredential(credential);
      final currentUser = firebaseAuth.currentUser;

      if (currentUser == null) {
        return left(Exception('Failed to sign in with Google'));
      }

      return right(
        User(
          id: currentUser.uid,
          email: currentUser.email!,
          name: currentUser.displayName ?? '',
        ),
      );
    } catch (e) {
      return left(Exception(e.toString()));
    }
  }

  Future<Either<Exception, User>> loginWithCredentials(
    String email,
    String password,
  ) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final currentUser = firebaseAuth.currentUser;
      if (currentUser == null) {
        return left(Exception('Failed to sign in with email and password'));
      }

      return right(
        User(
          id: currentUser.uid,
          email: currentUser.email!,
          name: currentUser.displayName ?? '',
        ),
      );
    } catch (e) {
      return left(Exception(e.toString()));
    }
  }

  Future<Either<Exception, void>> logout() async {
    try {
      await firebaseAuth.signOut();
      return right(null);
    } catch (e) {
      return left(Exception(e.toString()));
    }
  }

  Option<User> get currentUser {
    final currentUser = firebaseAuth.currentUser;
    if (currentUser == null) {
      return none();
    }
    return some(
      User(
        id: currentUser.uid,
        email: currentUser.email!,
        name: currentUser.displayName ?? '',
      ),
    );
  }
}

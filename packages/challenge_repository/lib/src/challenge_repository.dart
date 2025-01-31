import 'package:challenge_service/challenge_service.dart';

class ChallengeRepository {
  const ChallengeRepository({
    required this.challengeService,
  });

  final ChallengeService challengeService;

  Future<void> loginWithGoogle() async {
    try {
      await challengeService.loginWithGoogle();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> loginWithCredentials(String email, String password) async {
    try {
      await challengeService.loginWithCredentials(email, password);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> logout() async {
    try {
      await challengeService.logout();
    } catch (e) {
      throw Exception(e);
    }
  }

  User? get currentUser => challengeService.currentUser;
}

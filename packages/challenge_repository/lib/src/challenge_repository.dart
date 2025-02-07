import 'package:challenge_service/challenge_service.dart';
import 'package:fpdart/fpdart.dart';

class ChallengeRepository {
  const ChallengeRepository({
    required this.challengeService,
  });

  final ChallengeService challengeService;

  Future<Either<Exception, User>> loginWithGoogle() {
    return challengeService.loginWithGoogle();
  }

  Future<Either<Exception, User>> loginWithCredentials(
    String email,
    String password,
  ) {
    return challengeService.loginWithCredentials(email, password);
  }

  Future<Either<Exception, void>> logout() {
    return TaskEither.tryCatch(
      () async => challengeService.logout(),
      (error, _) => Exception(error.toString()),
    ).run();
  }

  Option<User> get currentUser => challengeService.currentUser;
}

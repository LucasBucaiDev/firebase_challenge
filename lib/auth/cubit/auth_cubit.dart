import 'package:bloc/bloc.dart';
import 'package:challenge_repository/challenge_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._challengeRepository) : super(AuthState.initial());

  final ChallengeRepository _challengeRepository;

  void checkCurrentUser() {
    _challengeRepository.currentUser.fold(
      () => emit(AuthState.unauthenticated()),
      (user) => emit(AuthState.authenticated(user: user)),
    );
  }

  Future<void> loginWithGoogle() async {
    final result = await _challengeRepository.loginWithGoogle();
    result.fold(
      (failure) => emit(AuthState.unauthenticated(failure: failure.toString())),
      (user) => emit(AuthState.authenticated(user: user)),
    );
  }

  Future<void> loginWithCredentials(String email, String password) async {
    final result =
        await _challengeRepository.loginWithCredentials(email, password);
    result.fold(
      (failure) => emit(AuthState.unauthenticated(failure: failure.toString())),
      (user) => emit(AuthState.authenticated(user: user)),
    );
  }

  Future<void> logout() async {
    try {
      await _challengeRepository.logout();
      emit(AuthState.unauthenticated());
    } catch (e) {
      emit(AuthState.unauthenticated(failure: e.toString()));
    }
  }
}

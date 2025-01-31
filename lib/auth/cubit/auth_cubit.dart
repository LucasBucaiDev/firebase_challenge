import 'package:bloc/bloc.dart';
import 'package:challenge_repository/challenge_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._challengeRepository) : super(AuthState.initial());

  final ChallengeRepository _challengeRepository;

  void checkCurrentUser() {
    if (_challengeRepository.currentUser != null) {
      emit(AuthState.authenticated(user: _challengeRepository.currentUser!));
    } else {
      emit(AuthState.unauthenticated());
    }
  }

  Future<void> loginWithGoogle() async {
    try {
      await _challengeRepository.loginWithGoogle();
      emit(AuthState.authenticated(user: _challengeRepository.currentUser!));
    } catch (e) {
      emit(AuthState.unauthenticated(failure: e.toString()));
    }
  }

  Future<void> loginWithCredentials(String email, String password) async {
    try {
      await _challengeRepository.loginWithCredentials(email, password);
      emit(AuthState.authenticated(user: _challengeRepository.currentUser!));
    } catch (e) {
      emit(AuthState.unauthenticated(failure: e.toString()));
    }
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

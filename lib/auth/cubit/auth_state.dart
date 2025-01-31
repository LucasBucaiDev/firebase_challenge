part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthStateInitial;
  const factory AuthState.authenticated({required User user}) =
      AuthStateAuthenticated;
  const factory AuthState.unauthenticated({String? failure}) =
      AuthStateUnauthenticated;
}

part of 'user_cubit.dart';

@immutable
sealed class UserState {
  final User? currentUser;

  const UserState({this.currentUser});
}

final class UserInitial extends UserState {}

final class GetUserLoading extends UserState {}

final class GetUserSuccess extends UserState {
  const GetUserSuccess({super.currentUser});
}

final class GetUserFailed extends UserState {}

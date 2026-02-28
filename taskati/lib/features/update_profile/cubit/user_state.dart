part of 'user_cubit.dart';

@immutable
sealed class UserState {
  final User? currentUser;

 const UserState({this.currentUser});
}

final class UserInitial extends UserState {}

final class UserLoadingState extends UserState {
  const UserLoadingState({super.currentUser});
}
final class UserUpdateState extends UserState {
  const UserUpdateState(User user):super(currentUser: user );
}

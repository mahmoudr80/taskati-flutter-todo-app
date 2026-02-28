part of 'user_cubit.dart';

@immutable
sealed class UserState {
  final User? currentUser;

  const UserState({this.currentUser});
}

final class UserInitial  extends UserState {}

final class UserUpdate extends UserState {
  const UserUpdate({super.currentUser});
}
final class UserLoad extends UserState {
  const UserLoad({super.currentUser});
}


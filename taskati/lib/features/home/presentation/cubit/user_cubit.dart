import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taskati/features/auth/data/models/user_class.dart';
import 'package:taskati/main.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> update() async {
    final user = await userService.getUser();
    emit(UserUpdate(currentUser: user));
  }

  Future<void> userLoading() async {
    final user = await userService.getUser();
    emit(UserLoad(currentUser: user));
  }
}

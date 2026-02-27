import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taskati/features/auth/data/models/user_class.dart';
import 'package:taskati/main.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

 Future<void> userLoading() async {
   final user =await userService.getUser();
   emit(UserLoadingState(currentUser: user));
  }

  Future<void> userUpdate(User user) async {
    emit(UserUpdateState(user));
    return await userService.updateUser(user);
  }
}

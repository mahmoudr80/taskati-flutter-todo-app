import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taskati/core/service/user_services.dart';
import '../../../core/service/user_class.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> loading() async {
    emit(GetUserLoading());
    final user = await UserServices.getUser();
    emit(GetUserSuccess(currentUser: user));
  }

  Future<void> userUpdate(User user) async {
    emit(GetUserLoading());
    await UserServices.updateUser(user);
    emit(GetUserSuccess(currentUser: user));
  }
}

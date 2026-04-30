part of 'home_cubit.dart';

@immutable
sealed class HomeState {
  final EnType ?type;

  const HomeState({this.type = EnType.task});
}
final class HomeLoading extends HomeState {}
final class HomeSuccess extends HomeState {
  final DataModel data;
  const HomeSuccess({required this.data,super.type });
}
final class HomeFailed extends HomeState {

  const HomeFailed({super.type });
}


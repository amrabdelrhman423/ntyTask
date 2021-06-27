abstract class HomeState {}

class Homeinitialstate extends HomeState {}

class Homeloadingstate extends HomeState {}

class HomeGetListsucessState extends HomeState {}

class HomeGetListerrorState extends HomeState {
  final String error;

  HomeGetListerrorState(this.error);
}

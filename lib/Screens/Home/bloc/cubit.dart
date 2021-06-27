import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nyt/Model/results_model.dart';
import 'package:nyt/Screen/Home/bloc/states.dart';
import 'package:nyt/core/dio_util.dart';
import 'package:nyt/repository/home_repository.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(Homeinitialstate());

  static HomeCubit get(context) => BlocProvider.of(context);
  HomeRepository homeRepository = HomeRepository();

  List<Results>? listAcrticls = [];
  getstories() async {
    emit(Homeloadingstate());
    try {
      listAcrticls = await homeRepository.getstories();
      emit(HomeGetListsucessState());
    } catch (e) {
      String error = DioUtil.handleDioError(e);
      emit(HomeGetListerrorState(error));
    }
  }
}

import 'package:nyt/Model/nty_model.dart';
import 'package:nyt/Model/results_model.dart';
import 'package:nyt/core/dio_util.dart';

class StoriesServices {
  // ignore: missing_return
  Future<List<Results>?> getstories() async {
    final dio = DioUtil.dio;
    final response = await dio.get(
        "svc/topstories/v2/home.json?api-key=3mh2JkNo6RqrYZxAnNmdyvLdFnKBMfh9");
    DioUtil.setDioAgain();
    if (response == null) {
      print("null response");
    } else {
      print(response.data);
      Nty data = Nty.fromJson(response.data);
      return data.results!;
    }
  }
}

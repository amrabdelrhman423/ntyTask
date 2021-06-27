import 'package:nyt/Model/results_model.dart';
import 'package:nyt/Services/stories_service.dart';

class HomeRepository {
  StoriesServices storiesServices = StoriesServices();

  Future<List<Results>?> getstories() async {
    return await storiesServices.getstories();
  }
}

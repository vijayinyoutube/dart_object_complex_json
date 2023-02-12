import '../Models/homepage_model.dart';
import '../Models/json_val.dart';

abstract class HomepageRepository {
  Future<HomePageModel> getData();
}

class HomePageRepo extends HomepageRepository {
  @override
  Future<HomePageModel> getData() async {
    await Future.delayed(const Duration(milliseconds: 100), () {});
    return HomePageModel.fromMap(jsonVal);
  }
}

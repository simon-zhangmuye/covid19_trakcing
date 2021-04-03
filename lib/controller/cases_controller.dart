import 'package:covid19_trakcing/model/case.dart';
import 'package:covid19_trakcing/services/services.dart';
import 'package:get/get.dart';

class CasesController extends GetxController with StateMixin {
  var getPosts = List<Case>().obs;
  var globalCase = Case().obs;
  var loading = true.obs;

  Services services = Services();

  @override
  void onInit() {
    // TODO: implement onInit
    callAPI();
    super.onInit();
  }

  void callAPI() async {
    try {
      loading.value = true;
      var result = await services.getAllPosts();
      if (result != null) {
        result.forEach((value) {
          if (value.country == 'All') {
            globalCase.value = Case(
              continent: value.continent,
              country: value.country,
              population: value.population,
              cases: value.cases,
              deaths: value.deaths,
              tests: value.tests,
              day: value.day,
              time: value.time,
            );
          } else {
            getPosts.add(value);
          }
        });
      } else {
        print('null');
      }
    } finally {
      loading.value = false;
    }
  }
}

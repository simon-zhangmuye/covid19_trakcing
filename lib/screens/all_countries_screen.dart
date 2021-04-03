import 'package:covid19_trakcing/controller/cases_controller.dart';
import 'package:covid19_trakcing/widgets/country_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllCountriesScreen extends StatelessWidget {
  CasesController casesController = Get.find<CasesController>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
          padding: EdgeInsets.all(15),
          itemCount: casesController.getPosts.value.length,
          itemBuilder: (context, index) {
            return CountryCard(casesController.getPosts.value[index]);
          }),
    );
  }
}

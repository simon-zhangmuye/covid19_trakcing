import 'package:covid19_trakcing/controller/cases_controller.dart';
import 'package:covid19_trakcing/widgets/splash_screen.dart';
import 'package:covid19_trakcing/widgets/status_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class GlobalScreen extends StatelessWidget {
  CasesController casesController = Get.find<CasesController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (casesController.loading.value == true) {
        return SplashScreen();
      } else {
        return GridView(
          padding: EdgeInsets.all(20),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1 / 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          children: [
            StatusCard(
              icon: 'assets/images/icons/total.png',
              status: NumberFormat.compact()
                  .format(casesController.globalCase.value.cases.total),
              color: Colors.pink,
              label: 'Total',
            ),
            StatusCard(
              icon: 'assets/images/icons/new.png',
              status: casesController.globalCase.value.cases.casesNew,
              color: Colors.blue,
              label: 'New',
            ),
            StatusCard(
              icon: 'assets/images/icons/active.png',
              status: NumberFormat.compact()
                  .format(casesController.globalCase.value.cases.active),
              color: Colors.teal,
              label: 'Active',
            ),
            StatusCard(
              icon: 'assets/images/icons/critical.png',
              status: NumberFormat.compact()
                  .format(casesController.globalCase.value.cases.critical),
              color: Colors.orange,
              label: 'Critical',
            ),
            StatusCard(
              icon: 'assets/images/icons/recovered.png',
              status: NumberFormat.compact()
                  .format(casesController.globalCase.value.cases.recovered),
              color: Colors.green,
              label: 'Recovered',
            ),
            StatusCard(
              icon: 'assets/images/icons/death.png',
              status: NumberFormat.compact()
                  .format(casesController.globalCase.value.deaths.total),
              color: Colors.red,
              label: 'Death',
            ),
          ],
        );
      }
    });
  }
}

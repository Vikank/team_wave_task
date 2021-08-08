import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team_wave_task/controller/home_controller.dart';

class Home extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(child: Text('The Sports DB')),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () {
                return homeController.countryLoading.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: homeController.getCountry.length,
                        itemBuilder: (context, index) {
                          var item = homeController.getCountry[index];
                          return GestureDetector(
                            onTap: () =>
                                Get.toNamed('/leagues', arguments: item.nameEn),
                            child: Card(
                              color: Colors.grey[200],
                              child: ListTile(
                                title: Text(item.nameEn),
                                trailing: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          );
                        });
              },
            ),
          ),
        ],
      ),
    );
  }
}

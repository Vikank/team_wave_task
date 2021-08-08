import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team_wave_task/controller/league_controller.dart';
import 'package:team_wave_task/model/leagues_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/avd.dart';
import 'package:flutter/rendering.dart';

class Leagues extends StatelessWidget {
  String countryName = Get.arguments.toString();
  final LeagueController leagueController = Get.put(LeagueController());

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = new TextEditingController();
    leagueController.countryName = countryName;
    leagueController.callLeagueMethod();
    print(leagueController.getLeague);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(leagueController.countryName),
        ),
        body: Column(
          children: [
            new Container(
              child: new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Card(
                  color: Colors.grey[200],
                  child: new ListTile(
                    leading: new Icon(Icons.search),
                    title: new TextField(
                      controller: controller,
                      decoration: new InputDecoration(
                          hintText: 'Search', border: InputBorder.none),
                      onChanged: (value){
                        value.isNotEmpty?leagueController.searchData(value):leagueController.callLeagueMethod();
                      }
                    ),
                    trailing: new IconButton(icon: new Icon(Icons.cancel), onPressed: () {
                      controller.clear();
                      leagueController.searchData('');
                      leagueController.callLeagueMethod();
                    },),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Obx(
                () {
                  return leagueController.leagueLoading.value
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : leagueController.getLeague.length == 0 ? Expanded(
                        child: Container(decoration: BoxDecoration(
                        image: DecorationImage(
                           image: NetworkImage('https://i.pinimg.com/originals/c9/22/68/c92268d92cf2dbf96e3195683d9e14fb.png'),
                            fit: BoxFit.cover
                        ),
                  ),),
                      ) :ListView.builder(
                          itemCount: leagueController.getLeague.length,
                          itemBuilder: (context, index) {
                            var item = leagueController.getLeague[index];
                            return Card(
                              child: Container(
                                height: 200,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: item.strBanner == '' ? NetworkImage('https://upload.wikimedia.org/wikipedia/commons/7/75/No_image_available.png') : NetworkImage(item.strBanner),
                                        fit: BoxFit.cover,
                                        colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop)
                                    )
                                ),
                                child: Column(
                                  children: [
                                    Text(item.strLeague, style: TextStyle(fontSize: 20,),),
                                    Row(
                                      children: [
                                        Spacer(),
                                        item.strLogo==''? Image.network('https://upload.wikimedia.org/wikipedia/commons/7/75/No_image_available.png', width: 100, height: 100,) :
                                        Image.network(
                                          item. strLogo, width: 100, height: 100,),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        item.strFacebook == '' ? Text('') : SvgPicture.asset('assets/images/facebook.svg', height: 50, width: 50,),
                                        item.strTwitter == '' ? Text('') : SvgPicture.asset('assets/images/twitter.svg', height: 50, width: 50,),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                },
              ),
            ),
          ],
        ));
  }


}

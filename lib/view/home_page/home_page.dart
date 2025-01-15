import 'package:app/utilz/menu1.dart';
import 'package:app/utilz/menu2.dart';
import 'package:app/utilz/menu3.dart';
import 'package:app/utilz/menu4.dart';
import 'package:app/utilz/name_banner.dart';
import 'package:app/utilz/temperature_banner.dart';
import 'package:app/view/load1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("asset/wall.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                  child: Padding(
                padding: EdgeInsets.all(8.0),
                child: NameBanner(
                  systemName: "BITA ROOM MANAGEMENT SYSTEM",
                ),
              )),
              SizedBox(
                height: Get.height * 0.05,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TemperatureBanner(temperature: 12),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Row(
                children: [
                  Menu1(
                    onTextTap: () => Get.to(() => Load1(), arguments: {
                      'image': "asset/bulb.png",
                      'title': "LOAD 1 CONTROL"
                    }),
                    image: "asset/bulb.png",
                    text: "LOAD 1",
                  ),
                  Menu2(
                    onTextTap: () => Get.to(() => Load1(), arguments: {
                      'image': "asset/fan.png",
                      'title': "LOAD 2 CONTROL"
                    }),
                    image: "asset/fan.png",
                    text: "LOAD 2",
                  ),
                ],
              ),
              Row(
                children: [
                  Menu3(
                    onTextTap: () {},
                    image: "asset/led.png",
                    text: "LED TV",
                  ),
                  Menu4(
                    onTextTap: () => Get.to(() => Load1(), arguments: {
                      'image': "asset/damper.png",
                      'title': "LOAD 3 CONTROL"
                    }),
                    image: "asset/damper.png",
                    text: "DAMPER",
                  ),
                ],
              ),
            ],
          ),
        )
      ])),
    );
  }
}

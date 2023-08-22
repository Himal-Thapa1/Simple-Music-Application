import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_dhun/constants/colors.dart';
import 'package:project_dhun/constants/text_style.dart';
import 'package:project_dhun/controllers/player_controller.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var controller = Get.put(PlayerController());

    return Scaffold(
      backgroundColor: bgDarkColor,
      appBar: AppBar(
        backgroundColor: bgDarkColor,
        actions: [
          IconButton(
            onPressed: () {
              //LEFT BLANK FOR NOW
            },
            icon: Icon(
              Icons.search,
              color: bgColor,
            ),
          ),
        ],
        title: Text(
          "Dhun",
          style: myTextStyle(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 100,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 4),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
                ),
                tileColor: bgColor,
                title: Text(
                  "Song Name here",
                  style: myTextStyle(
                    size: 14,
                  ),
                ),
                subtitle: Text(
                  "Artist name here",
                  style: myTextStyle(
                    size: 12,
                  ),
                ),
                leading: const Icon(
                  Icons.music_note,
                  color: whiteColor,
                  size: 32,
                ),
                trailing: const Icon(
                  Icons.play_arrow,
                  color: whiteColor,
                  size: 26,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

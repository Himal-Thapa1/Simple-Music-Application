import 'package:flutter/material.dart';
import 'package:project_dhun/constants/colors.dart';
import 'package:project_dhun/constants/text_style.dart';

class Player extends StatelessWidget {
  const Player({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgDarkColor,
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: const Icon(Icons.music_note),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      "Music Name",
                      style: myTextStyle(
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                    
                    Text(
                      "Artist Name",
                      style: myTextStyle(
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

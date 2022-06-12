// import 'dart:io';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:qrcodescanner/src/screens/generate_qr_screen.dart';
import 'package:qrcodescanner/src/screens/scan_qr_screen.dart';
import 'package:qrcodescanner/src/utils/constant.dart';

import 'about_us_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  List listOfScreens = [
    const ScanQrCodeScreen(),
    const GenerateQrScreen(),
    const AboutUs(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Qr code Scanner'),
        backgroundColor: MyColors.primary,
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        backgroundColor: MyColors.primary,
        onItemSelected: (index){
          setState(() {
            currentIndex = index;
          });
        },
        items: <BottomNavyBarItem>[
          // BottomNavyBarItem(
          //   icon: const Icon(Icons.home),
          //   title: const Text("home"),
          //   activeColor: MyColors.primary,
          // ),
          BottomNavyBarItem(
            icon: const Icon(Icons.document_scanner),
            title: const Text("Scan QR"),
            activeColor: MyColors.text,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.create_rounded),
            title: const Text("Generate QR"),
            activeColor: MyColors.text,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.person),
            title: const Text("About Us"),
            activeColor: MyColors.text,
          ),
        ],
      ),
      body: listOfScreens[currentIndex],
    );
  }
}

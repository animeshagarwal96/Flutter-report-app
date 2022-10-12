import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:firebase_database/firebase_database.dart';

class MyReport extends StatefulWidget {
  const MyReport({Key? key}) : super(key: key);

  @override
  State<MyReport> createState() => _MyReportState();
}

class _MyReportState extends State<MyReport> with TickerProviderStateMixin {
  late TabController _controller;
  FirebaseDatabase database = FirebaseDatabase.instance;
  int selectedIndex = 0;

  void getData() {
    database.ref().child("1/cbse/english/").once().then((value) => {
          print(value.snapshot.value),
        });
  }

  @override
  void initState() {
    getData();
    _controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: PopupMenuButton(
          itemBuilder: (context) {
            return List.generate(5, (index) {
              return PopupMenuItem(
                child: Text('button no $index'),
              );
            });
          },
          child: TextButton.icon(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue[100]),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)))),
              onPressed: null,
              label: const Icon(Icons.keyboard_arrow_down,
                  color: Colors.blueAccent),
              icon: "Class 01"
                  .text
                  .letterSpacing(1)
                  .color(Colors.blueAccent)
                  .make()),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [const Icon(FontAwesomeIcons.bell).px12()],
        bottom: TabBar(
          controller: _controller,
          isScrollable: false,
          indicatorColor: Colors.blueAccent,
          indicatorWeight: 5,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: [
            Tab(
              child: "Week".text.letterSpacing(1).black.make(),
            ),
            Tab(
              child: "Month".text.letterSpacing(1).black.make(),
            ),
            Tab(
              child: "Year".text.letterSpacing(1).black.make(),
            ),
          ],
        ),
      ),
      drawer: const Drawer(),
      body: TabBarView(controller: _controller, children: [
        Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.heightBox,
                "Time Spent on learning"
                    .text
                    .letterSpacing(1)
                    .xl
                    .gray500
                    .make()
                    .p16()
                    .centered(),
                "3m 51s".text.xl3.letterSpacing(1).make().centered(),
                for (int i = 0; i < 7; i++)
                  ListTile(
                      leading: const Icon(FontAwesomeIcons.computer),
                      title: "Computer".text.letterSpacing(1).make(),
                      subtitle: const LinearProgressIndicator(
                        value: 0.6,
                        color: Colors.blue,
                        minHeight: 5,
                        backgroundColor: Colors.black12,
                      ),
                      trailing: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          "0.0%".text.letterSpacing(1).make(),
                          "Master".text.letterSpacing(1).make(),
                        ],
                      )),
                20.heightBox,
                "Categories".text.xl2.bold.letterSpacing(1).make().p16(),
                for (int i = 0; i < 7; i++)
                  ListTile(
                    leading: const Icon(FontAwesomeIcons.camera),
                    title: "Video Watched".text.letterSpacing(1).make(),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                  ),
              ],
            ),
          ),
        ),
        Scaffold(),
        Scaffold(),
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_report_app/utils/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          height: (MediaQuery.of(context).size.height),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                10.heightBox,
                "I am in Class".text.bold.xl2.letterSpacing(1).make(),
                10.heightBox,
                GridView.count(
                  primary: false,
                  shrinkWrap: true,
                  childAspectRatio: 1,
                  crossAxisCount: 4,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  padding: const EdgeInsets.all(12),
                  children: <Widget>[
                    for (int i = 0; i < 12; i++)
                      TextButton(
                        style: ButtonStyle(
                          side: MaterialStateProperty.all(
                              const BorderSide(color: Colors.grey, width: 0)),
                        ),
                        onPressed: () {},
                        child: "1st"
                            .text
                            .xl
                            .bold
                            .color(Colors.black26)
                            .center
                            .make(),
                      ).p12(),
                  ],
                ),
                BottomAppBar(
                  elevation: 0.0,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.grey[300])),
                    onPressed: () {},
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 25, right: 25, bottom: 20, top: 20),
                      child: "Confirm"
                          .text
                          .xl2
                          .white
                          .bold
                          .center
                          .letterSpacing(1)
                          .make(),
                    ),
                  ).w(MediaQuery.of(context).size.width),
                ).p16()
              ],
            ),
          )),
    );
  }
}

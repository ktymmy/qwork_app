import 'package:flutter/material.dart';
import '././../../const/color.dart'; //color
import '../home/radar/radar.dart'; //radar
import 'battery.dart'; //battery
import './menber_button.dart'; //member
import './help_button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CostomAppBar.bk,
        title: Center(
          child: costomAppbar(),
        ),
        toolbarHeight: 100.0,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/homeBk.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'images/help.png',
                  // height: 200,
                ),
              ),
              Center(child: Radar()),
              Column(
                children: [
                  Spacer(flex: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 50),
                      MenberBT(),
                      SizedBox(width: 50),
                      Battery(),
                    ],
                  ),
                  Spacer(flex: 1),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget? costomAppbar() {
  return Container(
    child: Center(
      child: Row(
        children: [
          // SizedBox(width: 50),
          Column(
            children: [
              Text("筐体番号"),
              Text("0000"),
            ],
          ),
          Container(
            height: 40,
            child: VerticalDivider(
              color: Colors.white,
            ),
          ),
          Column(
            children: [
              Text("移動距離"),
              Text("1.5km"),
            ],
          ),
          Container(
            height: 40,
            child: VerticalDivider(
              color: Colors.white,
            ),
          ),
          Column(
            children: [
              Text("仕様時間"),
              Text("1:10:10"),
            ],
          ),
        ],
      ),
    ),
  );
}

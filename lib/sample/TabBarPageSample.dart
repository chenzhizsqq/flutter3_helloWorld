import 'package:flutter/material.dart';

class TabBarPageSample extends StatelessWidget {
  const TabBarPageSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Row(children: [
                  Icon(Icons.directions_car),
                  SizedBox(width: 5),
                  Text("Car")
                ]),
                Row(children: [
                  Icon(Icons.directions_transit),
                  SizedBox(width: 5),
                  Text("Transit")
                ]),
                Row(children: [
                  Icon(Icons.directions_bike),
                  SizedBox(width: 5),
                  Text("Bike")
                ]),
                Row(children: [
                  Icon(Icons.directions_boat),
                  SizedBox(width: 5),
                  Text("Boat")
                ]),
                Row(children: [
                  Icon(Icons.directions_railway),
                  SizedBox(width: 5),
                  Text("Railway")
                ]),
                Row(children: [
                  Icon(Icons.directions_bus),
                  SizedBox(width: 5),
                  Text("Bus")
                ]),
              ],
              isScrollable: true,
            ),
            //背景色
            title: const Text('导航栏 TabBarView'),
            automaticallyImplyLeading: true,
          ),
          body: const TabBarView(
            children: [
              Center(child: Text("Transit")),
              Center(child: Text("Transit")),
              Center(child: Text("Bike")),
              Center(child: Text("Boat")),
              Center(child: Text("Railway")),
              Center(child: Text("Bus"))
            ],
          )),
    );
  }
}

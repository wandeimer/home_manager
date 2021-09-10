import 'package:flutter/material.dart';

class Rooms {
  late String name;
  late int countNeedToBuy;
  late List<Items> listItems;
  late int countItems = listItems.length;
  late var icon;

  Rooms(this.name, this.countNeedToBuy, this.listItems, this.icon);
}
class Items {
  late String name;
  late double fullPoint;
  late double triggerPoint;
  late double currentPoint;
  late bool isNeedToBuy = currentPoint < triggerPoint;

  Items(this.name, this.fullPoint, this.triggerPoint, this.currentPoint);
}

var rooms = [
  Rooms("Kitchen", 1, [Items("Soap", 100, 30, 10), Items("Rice", 100, 20, 50)], Icons.kitchen),
  Rooms("Bathroom", 2, [Items("Soap", 100, 20, 10), Items("Shower Gel", 100, 50, 40), Items("Toilet Paper", 100, 60, 70)], Icons.bathroom),
  Rooms("Laundry", 1, [Items("Laundry Soap", 100, 20, 10), Items("Conditioner", 100, 50, 40)], Icons.local_laundry_service)];
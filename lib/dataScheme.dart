import 'package:flutter/material.dart';

class Room {
  late String name;
  late int countNeedToBuy;
  late List<Item> listItems;
  late int countItems = listItems.length;
  late var icon;

  Room(this.name, this.countNeedToBuy, this.listItems, this.icon);
}
class Item {
  late String name;
  late double fullPoint;
  late double triggerPoint;
  late double currentPoint;
  late bool isNeedToBuy = currentPoint < triggerPoint;

  Item(this.name, this.fullPoint, this.triggerPoint, this.currentPoint);
}

var rooms = [
  Room("Kitchen", 1, [Item("Soap", 100, 30, 10), Item("Rice", 100, 20, 50)], Icons.kitchen),
  Room("Bathroom", 2, [Item("Soap", 100, 20, 10), Item("Shower Gel", 100, 50, 40), Item("Toilet Paper", 100, 60, 70)], Icons.bathroom),
  Room("Laundry", 1, [Item("Laundry Soap", 100, 20, 10), Item("Conditioner", 100, 50, 40)], Icons.local_laundry_service)];
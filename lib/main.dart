import 'package:flutter/material.dart';
import 'package:home_manager/dataScheme.dart';
import 'package:home_manager/itemList.dart';

import 'addRoom.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Home Checklist'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> countItemsNeedToBuy = [];
  List<int> countItems = [];
  var localRooms = rooms;

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < localRooms.length; i++) {
      countItems.add(localRooms[i].listItems.length);
      countItemsNeedToBuy.add(countNeedToBuyItem(localRooms[i].listItems));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(localRooms.length, (index) {
            return TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ItemList(title: localRooms[index].name, index: index);
                  }));
                },
                child: Center(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      localRooms[index].icon,
                      size: 100,
                    ),
                    Text(localRooms[index].name),
                    Text("${countItemsNeedToBuy[index]} / ${countItems[index]}")
                  ],
                )));
          })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return AddRoom();
          }));
          // localRooms.add(Room("test", 0, [Item("Soap", 100, 30, 10)], Icons.baby_changing_station));
          // setState(() {
          // });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
        elevation: 2.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}

int countNeedToBuyItem(List<Item> listItems) {
  var count = 0;
  for (var i = 0; i < listItems.length; i++) {
    if (listItems[i].isNeedToBuy) {
      count += 1;
    }
  }
  return count;
}

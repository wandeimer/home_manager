import 'package:flutter/material.dart';
import 'package:home_manager/dataScheme.dart';
import 'package:home_manager/itemList.dart';

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

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < rooms.length; i++) {
      countItems.add(rooms[i].listItems.length);
      countItemsNeedToBuy.add(countNeedToBuyItem(rooms[i].listItems));
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: GridView.count(
            crossAxisCount: 2,
            children: List.generate(rooms.length, (index) {
              return TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ItemList(title: rooms[index].name, index: index);
                    }));
                  },
                  child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            rooms[index].icon,
                            size: 100,
                          ),
                          Text(rooms[index].name),
                          Text("${countItemsNeedToBuy[index]} / ${countItems[index]}")
                        ],
                      )));
            })));
  }
}

int countNeedToBuyItem(List<Items> listItems) {
  var count = 0;
  for (var i = 0; i < listItems.length; i++) {
    if (listItems[i].isNeedToBuy) {
      count += 1;
    }
  }
  return count;
}

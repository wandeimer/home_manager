import 'package:flutter/material.dart';
import 'package:home_manager/dataScheme.dart';

class ItemList extends StatefulWidget {
  ItemList({Key? key, required this.title, required this.index}) : super(key: key);

  final String title;
  final int index;

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: GridView.count(
            crossAxisCount: 2,
            children: List.generate(rooms[widget.index].listItems.length, (index) {
              return TextButton(onPressed: () {}, child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(rooms[widget.index].listItems[index].name),
                      Text("${rooms[widget.index].listItems[index].currentPoint}/${rooms[widget.index].listItems[index].fullPoint}")
                    ],
                  )
              ));
            })
        ));
  }
}

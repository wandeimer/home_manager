import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';

class AddRoom extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddRoomState();
}

class _AddRoomState extends State<AddRoom> {
  Icon? _icon;

  _pickIcon() async {
    IconData? icon = await FlutterIconPicker.showIconPicker(context,
        iconPackMode: IconPack.cupertino);

    _icon = Icon(icon);
    setState(() {});

    debugPrint('Picked Icon:  $icon');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add new room"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter name of room',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _pickIcon,
              child: Text('Select room icon'),
            ),
            SizedBox(height: 10),
            // RaisedButton.icon(onPressed: (){},
            //   label: Padding(
            //     padding: EdgeInsets.only(left: 10),
            //     child: Text(
            //       "title",
            //       style: TextStyle(
            //         fontSize: 12,
            //         height: 1,
            //       ),
            //     ),
            //   ),
            // icon: _icon == null ? Container() : _icon!,
            // )

            AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: _icon != null ? Icon(_icon!.icon, size: 100, color: Colors.blue,) : Container()
            )
          ],
        ));
  }
}

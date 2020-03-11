import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wasteagram/screens/waste_new_entry_screen.dart';

class WasteListViewScreen extends StatelessWidget {
  static const route = '/';

  void _getImage(context) async {
    final File image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image == null) return;

    Navigator.pushNamed(
      context,
      WasteNewEntryScreen.route,
      arguments: WasteNewEntryScreenArguments(image),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wasteagram'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('posts').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data.documents[0]['imageURL']);
            return ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Center(
                    child: Text(snapshot.data.documents[index]['date']),
                  ),
                  trailing: Text(snapshot.data.documents[index]['quantity']),
                );
              },
              separatorBuilder: (context, index) => Divider(),
              itemCount: snapshot.data.documents.length,
            );
          }
          return Text('hi');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getImage(context);
        },
        tooltip: 'Take Picture',
        child: Icon(Icons.add),
      ),
    );
  }
}

/*
        child: ListView(
          children: ListTile.divideTiles(
            context: context,
            tiles: [
              ListTile(
                title: Center(
                  child: Text('TestTile'),
                ),
                trailing: Text('Hey'),
              ),
            ],
          ).toList(),
        ),
        */

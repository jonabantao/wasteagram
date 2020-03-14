import 'package:flutter/material.dart';
import 'package:wasteagram/widgets/floating_camera_button.dart';
import 'package:wasteagram/widgets/wasteagram_app_bar.dart';

class LoadingScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WasteagramAppBar(),
      body: Center(
        child: CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingCameraButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

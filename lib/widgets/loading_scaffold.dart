import 'package:flutter/material.dart';
import 'package:wasteagram/widgets/floating_camera_button.dart';
import 'package:wasteagram/widgets/wasteagram_app_bar.dart';

class LoadingScaffold extends StatelessWidget {
  const LoadingScaffold();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WasteagramAppBar(),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
      floatingActionButton: const FloatingCameraButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

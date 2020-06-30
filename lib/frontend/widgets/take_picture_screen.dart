import 'dart:async';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:bubble/core/util/utils.dart';
import 'package:bubble/router.gr.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

// A screen that allows users to take a picture using a given camera.
class TakePictureScreen extends StatefulWidget {
  final void Function(String) onSave;

  const TakePictureScreen({
    Key key,
    this.onSave,
  }) : super(key: key);

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  int cameraInd = 0;
  CameraController _controller;

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner
      // until the controller has finished initializing.
      body: Stack(
        children: <Widget>[
          FutureBuilder<CameraController>(
            future: initializeCamera(cameraInd),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // If the Future is complete, display the preview.
                return snapshot.hasError
                    ? const Center(
                        child: Text("Camera pemission was not granted"),
                      )
                    : CameraPreview(snapshot.data);
              } else {
                // Otherwise, display a loading indicator.
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          Positioned(
            right: 25,
            top: 25,
            child: IconButton(
              icon: Icon(Icons.swap_horizontal_circle),
              iconSize: 36,
              color: Colors.white,
              onPressed: () {
                setState(() {
                  cameraInd = cameraInd == 0 ? 1 : 0;
                });
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        // Provide an onPressed callback.
        onPressed: () async {
          // Take the Picture in a try / catch block. If anything goes wrong,
          // catch the error.
          try {
            // Ensure that the camera is initialized.
            // Construct the path where the image should be saved using the
            // pattern package.
            final path = join(
              // Store the picture in the temp directory.
              // Find the temp directory using the `path_provider` plugin.
              (await getTemporaryDirectory()).path,
              '${generateRandomNumString()}.png',
            );

            // Attempt to take a picture and log where it's been saved.
            await _controller.takePicture(path);

            // If the picture was taken, display it on a new screen.
            ExtendedNavigator.of(context).pushNamed(Routes.displayPictureScreen,
                arguments: DisplayPictureScreenArguments(
                    imagePath: path, onSave: widget.onSave));
          } catch (e) {
            // If an error occurs, log the error to the console.
            Fluttertoast.showToast(msg: "Could not capture the photo");
          }
        },
        child: Container(
          width: 70,
          height: 70,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future<CameraController> initializeCamera(int cameraInd) async {
    final cameras = await availableCameras();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      cameras[cameraInd],
      // Define the resolution to use.
      ResolutionPreset.medium,
    );
    await _controller.initialize();
    return _controller;
  }
}

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  final void Function(String) onSave;

  const DisplayPictureScreen({Key key, this.imagePath, this.onSave})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Image.file(
          File(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          onSave(imagePath);
        },
        child: Icon(
          Icons.send,
          color: Colors.blue,
          size: 32,
        ),
      ),
    );
  }
}

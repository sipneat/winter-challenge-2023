import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Name of App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Name of App'),
      ),
      backgroundColor: Colors.cyan.shade50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 80.0,
              backgroundImage: NetworkImage(
                  'https://t4.ftcdn.net/jpg/01/41/72/83/360_F_141728316_rqGLy0W6NJ4KuG0s3bRsNFO5Ot6M6Kuo.jpg'),
            ),
            SizedBox(height: 20.0),
            Text(
              'User Name?',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Other Stuff',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.cyan.shade900,
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.cyan.shade900,
                onPrimary: Colors.white,
              ),
              child: Text('Continue', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

// second page
class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<File?> _images = [];
  final TextEditingController _textEditingController = TextEditingController();

  Future<void> _getImages() async {
    final imagePicker = ImagePicker();
    List<XFile>? pickedFile = await imagePicker.pickMultiImage();

    setState(() {
      if (pickedFile != null) {
        _images = pickedFile.map((file) => File(file.path)).toList();
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      backgroundColor: Colors.cyan.shade50,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Please insert photos of top',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              for (var image in _images)
                image == null ? Text('No image selected.') : Image.file(image),
              ElevatedButton(
                onPressed: _getImages,
                child: Text('Pick Images'),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  hintText: 'Type here...',
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  String userInput = _textEditingController.text;
                  print('User Input: $userInput');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ThirdPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyan.shade900,
                  onPrimary: Colors.white,
                ),
                child: Text('Submit', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//third page

// second page
class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  List<File?> _images = [];
  final TextEditingController _textEditingController = TextEditingController();

  Future<void> _getImages() async {
    final imagePicker = ImagePicker();
    List<XFile>? pickedFiles = await imagePicker.pickMultiImage();

    setState(() {
      if (pickedFiles != null) {
        _images = pickedFiles.map((file) => File(file.path)).toList();
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Page'),
      ),
      backgroundColor: Colors.cyan.shade50,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Please insert photos of bottom',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              for (var image in _images)
                image == null ? Text('No image selected.') : Image.file(image),
              ElevatedButton(
                onPressed: _getImages,
                child: Text('Pick Images'),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  hintText: 'Type here...',
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FourthPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyan.shade900,
                  onPrimary: Colors.white,
                ),
                child: Text('Submit', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//fourth page
class FourthPage extends StatefulWidget {
  @override
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  List<File?> _images = [];
  final TextEditingController _textEditingController = TextEditingController();

  Future<void> _getImages() async {
    final imagePicker = ImagePicker();
    List<XFile>? pickedFile = await imagePicker.pickMultiImage();

    setState(() {
      if (pickedFile != null) {
        _images = pickedFile.map((file) => File(file.path)).toList();
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fourth Page'),
      ),
      backgroundColor: Colors.cyan.shade50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20.0),
            Text(
              'You could pair your clothes like this: ',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: 200,
              height: 200,
              child: Image.network(
                  'https://t4.ftcdn.net/jpg/01/41/72/83/360_F_141728316_rqGLy0W6NJ4KuG0s3bRsNFO5Ot6M6Kuo.jpg'),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

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
class SecondPage extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      backgroundColor: Colors.cyan.shade50,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // Access the user input using _textEditingController.text
                    String userInput = _textEditingController.text;
                    print('User Input: $userInput');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.cyan.shade900,
                    onPrimary: Colors.white,
                  ),
                  child: Text('Female', style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () {
                // Access the user input using _textEditingController.text
                    String userInput = _textEditingController.text;
                    print('User Input: $userInput');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.cyan.shade900,
                    onPrimary: Colors.white,
                  ),
                  child: Text('Male', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            Text(
              '''If Male Please Enter Chest, Wasit, Arms, and Leg Sizes
If Female Please Enter Bust, Waist, Hips, Arms, and Leg Sizes''',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: 'Type here...',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Access the user input using _textEditingController.text
                String userInput = _textEditingController.text;
                print('User Input: $userInput');
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
    );
  }
}
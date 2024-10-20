import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData( 
        brightness: Brightness.light,
        primaryColor: CupertinoColors.systemBlue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('StudyFinder'),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CupertinoButton(
              color: CupertinoColors.systemBlue,
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => FirstPage(),
                  ),
                );
              },
              child: Text('Finder'),
            ),
            SizedBox(height: 20), // Space between buttons
            CupertinoButton(
              color: CupertinoColors.systemGreen,
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => SecondPage(),
                  ),
                );
              },
              child: Text('Hoster'),
            ),
          ],
        ),
      ),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  TextEditingController _textController = TextEditingController();
  bool _toggleValue = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Finder'),
        previousPageTitle: 'Back',
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoTextField(
              controller: _textController,
              placeholder: 'Enter a brief blurb about yourself: ',
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Would you like to talk while studying?'),
                CupertinoSwitch(
                  value: _toggleValue,
                  onChanged: (bool value) {
                    setState(() {
                      _toggleValue = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            CupertinoButton.filled(
              onPressed: () {
                showCupertinoDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: Text('Review Input'),
                      content: Text('Text: ${_textController.text}\nToggle: ${_toggleValue ? "On" : "Off"}'),
                      actions: <Widget>[
                        CupertinoDialogAction(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Review Input'),
            ),
            SizedBox(height: 20),
            CupertinoButton(
              color: CupertinoColors.systemRed,
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => ThirdPage(),
                  ),
                );
              },
              child: Text('Proceed to waiting...'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController _textController = TextEditingController();
  bool _toggleValue = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Hosting Interface'),
        previousPageTitle: 'Back',
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoTextField(
              controller: _textController,
              placeholder: "Enter whatever's on your mind!",
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Enable Notifications'),
                CupertinoSwitch(
                  value: _toggleValue,
                  onChanged: (bool value) {
                    setState(() {
                      _toggleValue = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Are you locked in today?'),
                CupertinoSwitch(
                  value: _toggleValue,
                  onChanged: (bool value) {
                    setState(() {
                      _toggleValue = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            CupertinoButton.filled(
              onPressed: () {
                showCupertinoDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: Text('Input Details'),
                      content: Text('Name: ${_textController.text}\nNotifications: ${_toggleValue ? "Enabled" : "Disabled"}'),
                      actions: <Widget>[
                        CupertinoDialogAction(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Submit'),
            ),
           SizedBox(height: 20),
            CupertinoButton(
              color: CupertinoColors.systemPurple,
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => FourthPage(),
                  ),
                );
              },
              child: Text('Go to Fourth Page'),
            ),
          ],
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Waiting...'),
        previousPageTitle: 'Back',
      ),
      child: Center(
        child: Text("You're in! Now, just wait until you recieve a notice about a match.", style: TextStyle(fontSize: 18)),
      ),
    );
  }
}

class FourthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Recieve your Match!'),
        previousPageTitle: 'Back',
      ),
      child: Center(
        child: Text('Your match is <xyz>', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}

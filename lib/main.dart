import 'package:flutter/material.dart';
import 'story_brain.dart';

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

StoryBrain mybrain = new StoryBrain();

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/background.png'), fit: BoxFit.cover),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 25.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    mybrain.getStory(),
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),

              //Choice 1 made by user.
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      mybrain.nextStory(1);
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  child: Text(
                    mybrain.getChoice1(),
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),

              //Choice 2 made by user.
              Expanded(
                flex: 2,
                //the Visibilty widget can enable widgets to be hidden accompanied by a true/false visible property
                child: Visibility(
                  visible: mybrain.buttonShouldBeVisible(),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        mybrain.nextStory(2);
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    child: Text(
                      mybrain.getChoice2(),
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


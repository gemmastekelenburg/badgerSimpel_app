import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';

class Page extends StatefulWidget {
  final String title;

  Page({this.title, Key key}) : super(key: key);

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> with SingleTickerProviderStateMixin {
  int _moves;
  final FlareControls _flareControls = FlareControls();
  /// you can choose between three animations
  final List _choice = ['krimp', 'draai', 'groei'];

  @override
  void initState() {
    super.initState();
     _moves = 0;
     ///show one animation after build
    _getThingsOnStartup().then((value) {
      _flareControls.play('krimp');
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
              child: Stack(fit: StackFit.expand, children: [
                ///the flare file in the assets map
                FlareActor("assets/animations/das_badger.flr",
                  ///the controller is required to play the animations
                  controller: _flareControls,
                  fit: BoxFit.contain,
                ),
                Container(
                    margin: const EdgeInsets.only(left: 40, right: 40, bottom: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Slider(
                            min: 0.0,
                            max: 2.0,
                            divisions: 2,
                            /// Get the move-number value and adjust it for the slider's min/max value.
                            value: _moves.toDouble() ,
                            onChanged: (double value) {
                              /// [setState()] triggers a visual refresh with the updated parameters.
                              setState(() {
                                /// When the value of the slider changes, the moves-number changes
                                _moves = value.toInt() ;
                              });
                              _flareControls.play(_choice[_moves]);
                            }),
                        Text("Schuif om de beweging te veranderen",
                            style: TextStyle(
                                color: Colors.blue,
                                fontFamily: "Arial",
                                fontSize: 15,
                                fontWeight: FontWeight.w500))
                      ],
                    ))
              ]),
            ));
  }
  /// wait until the build widget is finished
  Future _getThingsOnStartup() async {
    await Future.delayed(Duration(seconds: 1));
  }
}














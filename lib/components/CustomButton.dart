import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Icon _text;
  final Function _onPressed;
  final bool _isPlayButton;

  // Component/ Widget for all buttons

  CustomButton(this._text, this._onPressed, this._isPlayButton);


  // the below code is for button play, pause and stop
  // it also includes condition which checks for isPlayButton which display the purple color play button.
  @override
  Widget build(BuildContext context) {
    return _isPlayButton
        ? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Color(0xFF534AC0),
            ),
            child: Center(
                child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  new IconButton(icon: _text, onPressed: _onPressed)
                ])))
        : Center(
            child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                new IconButton(icon: _text, onPressed: _onPressed)
              ]));
  }
}

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Icon _text;
  final Function _onPressed;
  final bool _isPlayButton;

  CustomButton(this._text, this._onPressed, this._isPlayButton);

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

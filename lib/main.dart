import 'package:flutter/material.dart';
import 'components/CustomButton.dart';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

typedef void OnError(Exception exception);

void main() {
  runApp(new MaterialApp(
    //setting up font
      theme: ThemeData(fontFamily: 'Quicksand'),
      debugShowCheckedModeBanner: false,
      home: AudioPlayerCustom()));
}

class AudioPlayerCustom extends StatefulWidget {
  @override
  _AudioPlayerCustom createState() => _AudioPlayerCustom();
}

class _AudioPlayerCustom extends State<AudioPlayerCustom> {
  // private variables for duration and position of slider.
  Duration _duration = new Duration();
  Duration _position = new Duration();
  AudioPlayer advancedPlayer;
  AudioCache audioCache;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() {
    // used flutter library Audio Player which handles play, pause and stop actions
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);

    // code that sets the state for duration and time
    advancedPlayer.durationHandler = (d) => setState(() {
          _duration = d;
        });

    advancedPlayer.positionHandler = (p) => setState(() {
          _position = p;
        });
  }

  Widget _tab(List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: children
                .map((w) => Container(child: w, padding: EdgeInsets.all(6.0)))
                .toList(),
          ),
        ),
      ],
    );
  }

  // slider which helps sliding of music durations
  Widget slider() {
    return Slider(
        activeColor: Color(0xFF534AC0),
        inactiveColor: Colors.white,
        value: _position.inSeconds.toDouble(),
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            seekToSecond(value.toInt());
            value = value;
          });
        });
  }

  //static image container which displays the image of songs in circle
  Widget imageContainer(){
    return Container(width: 250.0, height: 250.0,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 5, blurRadius: 7, offset: Offset(0, 3),),
          ],
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
                "https://upload.wikimedia.org/wikipedia/sco/a/a7/Mark_Ronson_-_Uptown_Funk_%28feat._Bruno_Mars%29_%28Official_Single_Cover%29.png"),
          ),
        ),
      );
  }


  // widget/component that calls custom buttons from components folder. Holds all three buttons for action play, pause and stop
  Widget actionButtons(){
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CustomButton(Icon(Icons.pause, color: Colors.white, size: 25.0,),() => advancedPlayer.pause(),false),
          CustomButton(Icon(Icons.play_arrow,color: Colors.white,size: 25.0,),() => audioCache.play('uptown.mp3'),true),
          CustomButton(Icon(Icons.stop,color: Colors.white,size: 25.0,),() => advancedPlayer.stop(),false),
        ],
      );
  }

  // Widget which show duration of song and how much music is been already played 
  Widget durations(){
    return Row(
        children: <Widget>[
          Text(
            convertDuration(_position),
            style: TextStyle(color: Colors.white),
          ),
          Spacer(),
          Text(
            convertDuration(_duration),
            style: TextStyle(color: Colors.white),
          )
        ],
      );
  }

  // function that is converting duration into minutes and reconds
  String convertDuration(Duration duration) {
    var _minutes = duration.inMinutes.remainder(60);
    var _seconds = duration.inSeconds.remainder(60);
    var _startTime = _minutes.toString() + ":" + _seconds.toString();
    return _startTime;
  }

  // Main Widget that holds image, buttons, and slider
  Widget audioPlayerCustom() {
    return _tab([
      
      SizedBox(height: 80),
      
      imageContainer(),
      
      SizedBox(height: 5),
      
      Container(child: Text("Uptown Funk - Bruno Mars", style: TextStyle(color: Colors.white, fontSize: 18))),
      
      SizedBox(height: 80),
      
      actionButtons(),
      
      slider(),
      
      durations(),
      
    ]);
  }

  // function which is called when ever slider is shifted
  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    advancedPlayer.seek(newDuration);
  }

  // scafffold/ main layout of the app which calls the function audioPlayerCustom
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 1.0,
          backgroundColor: Colors.black,
          title: Center(child: Text('Now Playing')),
        ),
        body: TabBarView(
          children: [audioPlayerCustom()],
        ),
      ),
    );
  }
}

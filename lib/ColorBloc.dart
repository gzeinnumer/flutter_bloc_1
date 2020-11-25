import 'dart:async';

import 'package:flutter/material.dart';

enum ColorEvent{to_amber, to_light_blue}

class ColorBloc{
  Color _color = Colors.amber;

  StreamController<ColorEvent> _eventController = StreamController<ColorEvent>();
  StreamSink<ColorEvent> get eventSink => _eventController.sink; //todo 3

  StreamController<Color> _stateController = StreamController<Color>();
  StreamSink<Color> get _stateSink => _stateController.sink;
  Stream<Color> get stateStream => _stateController.stream;

  //todo 5
  void _mapEventToState(ColorEvent colorEvent){
    if(colorEvent == ColorEvent.to_amber){
      _color = Colors.amber;
    } else{
      _color = Colors.lightBlue;
    }

    //todo 6
    _stateSink.add(_color); // value  color dan _statrSink berubah masuk ke _stateController
  }

  ColorBloc(){
    _eventController.stream.listen(_mapEventToState); //todo 4 value listen berubah
  }

  void dispose(){
    _eventController.close();
    _stateController.close();
  }
}
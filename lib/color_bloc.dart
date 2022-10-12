import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

abstract class ColorEvent{}  
class eventRed extends ColorEvent{} 
class eventGreen extends ColorEvent{} 
 

class ColorBloc extends Bloc<ColorEvent, Color> {
  // ignore: unused_field
  Color _color = Colors.red;

  ColorBloc() : super(Colors.red) {
    on<eventRed>((event, emit) => emit(_color = Colors.red));
    on<eventGreen>((event, emit) => emit(_color = Colors.green));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learningbloc/features/darklightmode/bloc/light_blocf.dart';
import 'package:learningbloc/features/darklightmode/bloc/light_event.dart';
import 'package:learningbloc/features/darklightmode/bloc/light_state.dart';

class LightScreen extends StatelessWidget {
  LightScreen({super.key});
  final lightBloc = LightBloc();
  @override
  Widget build(BuildContext context) {
    return BlocListener<LightBloc,LightState>(
      listener: (context, state) {

      },
      bloc: lightBloc,
      child: BlocBuilder(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: lightBloc.state.value == false ? Colors.black : Colors.white,
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  heroTag: "on",
                  onPressed: () {
                    lightBloc.add(onButtonPressed());
                  },
                  child: Icon(Icons.light_mode),
                ),
                SizedBox(width: 20),
                FloatingActionButton(
                  heroTag: "off",
                  onPressed: () {
                    lightBloc.add(offButtonPressed());
                  },
                  child: Icon(Icons.dark_mode),
                ),
              ],
            ),
          );
        },
        bloc: lightBloc,
      ),
    );
  }
}

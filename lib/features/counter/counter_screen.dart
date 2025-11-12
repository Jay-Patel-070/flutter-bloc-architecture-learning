// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:learningbloc/bloc/counter_bloc.dart';
// import 'package:learningbloc/bloc/counter_event.dart';
// import 'package:learningbloc/bloc/counter_state.dart';
//
// class CounterScreen extends StatelessWidget {
//   final counterBloc = CounterBloc();
//   @override
//   Widget build(BuildContext context) {
//
//     return BlocListener<CounterBloc,CounterState>(
//       bloc: counterBloc,
//       listener: (context, state) {
//         if(state.value == 3){
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('you reached 3')));
//         }
//         print(state.value);
//       },
//       child: Scaffold(
//         appBar: AppBar(title: Text("Counter")),
//
//         body: Center(
//           child: BlocBuilder<CounterBloc, CounterState>(
//             bloc: counterBloc,
//             builder: (context, state) {
//               return Text(
//                 state.value.toString(),
//                 style: TextStyle(fontSize: 40),
//               );
//             },
//           ),
//         ),
//
//         floatingActionButton: Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             FloatingActionButton(
//               heroTag: "inc",
//               onPressed: () {
//                 counterBloc.add(CounterIncrementPressed());
//               },
//               child: Icon(Icons.add),
//             ),
//             SizedBox(width: 20),
//             FloatingActionButton(
//               heroTag: "dec",
//               onPressed: () {
//                 counterBloc.add(CounterDecrementPressed());
//               },
//               child: Icon(Icons.remove),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

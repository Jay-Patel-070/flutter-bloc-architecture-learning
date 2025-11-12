import 'package:bloc/bloc.dart';
import 'light_event.dart';
import 'light_state.dart';

class LightBloc extends Bloc<LightEvent,LightState>{
  LightBloc() : super(LightState(true)){
    on<onButtonPressed>((event,emit){
      emit(LightState(true));
  });
    on<offButtonPressed>((event,emit){
      emit(LightState(false));
    });
  }
}
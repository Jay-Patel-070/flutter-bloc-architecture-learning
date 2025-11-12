// import 'package:learningbloc/features/weather/bloc/weather_bloc.dart';
//
// sealed class WeatherBlocState {
//   const WeatherBlocState();
//
//   @override
//   List<Object> get props => [];
// }
//
// final class WeatherBlocInitial extends WeatherBlocState {}
//
// final class WeatherBlocLoading extends WeatherBlocState {}
// final class WeatherBlocFailure extends WeatherBlocState {}
// final class WeatherBlocSuccess extends WeatherBlocState {
//   final WeatherBlocBloc weather;
//
//   const WeatherBlocSuccess(this.weather);
//
//   @override
//   List<Object> get props => [weather];
// }
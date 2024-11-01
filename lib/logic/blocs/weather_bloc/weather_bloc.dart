import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/weather.dart';
import 'package:weatherly/app/utils/constants.dart';
import 'package:geolocator/geolocator.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(const WeatherInitialState(isLoading: false)) {
    on<FetchWeatherEvent>(
      (event, emit) async {
        emit(const FetchWeatherLoadingState(isLoading: true));
        try {
          WeatherFactory weatherFactory = WeatherFactory(
            apiKey,
            language: Language.ENGLISH,
          );
          Position position = await _determinePosition();
          Weather weather = await weatherFactory.currentWeatherByLocation(
            position.latitude,
            position.longitude,
          );
          log(weather.toString());
          emit(
            FetchWeatherSuccessState(weather: weather, isLoading: false),
          );
        } catch (e) {
          emit(const FetchWeatherFailureState(
            error: 'Failed to get weather',
            isLoading: false,
          ));
        }
      },
    );
  }
}

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error('Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}

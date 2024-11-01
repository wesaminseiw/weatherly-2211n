part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  final bool isLoading;
  const WeatherState({required this.isLoading});

  @override
  List<Object> get props => [];
}

final class WeatherInitialState extends WeatherState {
  const WeatherInitialState({required super.isLoading});
}

//* fetch weather states

final class FetchWeatherLoadingState extends WeatherState {
  const FetchWeatherLoadingState({required super.isLoading});
}

final class FetchWeatherSuccessState extends WeatherState {
  final Weather weather;

  const FetchWeatherSuccessState({
    required this.weather,
    required super.isLoading,
  });

  @override
  List<Object> get props => [weather];
}

final class FetchWeatherFailureState extends WeatherState {
  final String error;

  const FetchWeatherFailureState({
    required this.error,
    required super.isLoading,
  });
}

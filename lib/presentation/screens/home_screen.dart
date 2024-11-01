import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherly/app/utils/extensions.dart';
import 'package:weatherly/logic/blocs/weather_bloc/weather_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget getWeatherIcon(int weatherCode) {
    switch (weatherCode) {
      case >= 200 && < 300:
        return Image.asset(
          'assets/images/1.png',
        );
      case >= 300 && < 400:
        return Image.asset(
          'assets/images/2.png',
        );
      case >= 500 && < 600:
        return Image.asset(
          'assets/images/3.png',
        );
      case >= 600 && < 700:
        return Image.asset(
          'assets/images/4.png',
        );
      case > 700 && < 800:
        return Image.asset(
          'assets/images/5.png',
        );
      case == 800:
        return Image.asset(
          'assets/images/6.png',
        );
      case > 800 && <= 804:
        return Image.asset(
          'assets/images/7.png',
        );
      default:
        return Image.asset(
          'assets/images/7.png',
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(10, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-10, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, -1.2),
                child: Container(
                  height: 300,
                  width: 600,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFAB40),
                  ),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 100,
                  sigmaY: 100,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                ),
              ),
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state is FetchWeatherLoadingState && state.isLoading == true) {
                    return const Center(
                      child: SizedBox(
                        width: 80,
                        height: 80,
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (state is FetchWeatherFailureState) {
                    return Center(
                      child: Text(
                        state.error,
                        textAlign: TextAlign.center,
                        style: context.headlineMedium,
                      ),
                    );
                  } else if (state is FetchWeatherSuccessState) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '📍 ${state.weather.areaName}',
                            style: context.bodyMedium,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Good Morning',
                            style: context.headlineLarge,
                          ),
                          getWeatherIcon(state.weather.weatherConditionCode!),
                          Center(
                            child: Text(
                              '${state.weather.temperature!.celsius!.round().toString()}°C',
                              style: context.displayMedium!.copyWith(fontSize: 54),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Center(
                            child: Text(
                              state.weather.weatherMain!.toUpperCase(),
                              style: context.headlineSmall,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Center(
                            child: Text(
                              DateFormat('EEEE MM-dd •').add_jm().format(state.weather.date!),
                              style: context.bodyMedium,
                            ),
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/11.png',
                                    scale: 8,
                                  ),
                                  const SizedBox(width: 5),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Sunrise',
                                        style: context.labelLarge,
                                      ),
                                      const SizedBox(height: 3),
                                      Text(
                                        DateFormat().add_jm().format(state.weather.sunrise!),
                                        style: context.bodyLarge,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/12.png',
                                    scale: 8,
                                  ),
                                  const SizedBox(width: 5),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Sunset',
                                        style: context.labelLarge,
                                      ),
                                      const SizedBox(height: 3),
                                      Text(
                                        DateFormat().add_jm().format(state.weather.sunset!),
                                        style: context.bodyLarge,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Divider(
                              color: Colors.grey,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/13.png',
                                    scale: 8,
                                  ),
                                  const SizedBox(width: 5),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Temp Max',
                                        style: context.labelLarge,
                                      ),
                                      const SizedBox(height: 3),
                                      Text(
                                        '${state.weather.tempMax!.celsius!.round()}°C',
                                        style: context.bodyLarge,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/14.png',
                                    scale: 8,
                                  ),
                                  const SizedBox(width: 5),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Temp Min',
                                        style: context.labelLarge,
                                      ),
                                      const SizedBox(height: 3),
                                      Text(
                                        '${state.weather.tempMin!.celsius!.round()}°C',
                                        style: context.bodyLarge,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 56),
                        ],
                      ),
                    );
                  } else {
                    return Center(
                      child: Text(
                        'An error occurred, try again later and check your internet connection.',
                        textAlign: TextAlign.center,
                        style: context.headlineMedium,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

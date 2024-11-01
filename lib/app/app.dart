import 'package:flutter/material.dart';
import 'package:weatherly/logic/blocs/weather_bloc/weather_bloc.dart';
import 'package:weatherly/presentation/themes/themes.dart';
import '../presentation/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc()
        ..add(
          FetchWeatherEvent(),
        ),
      child: MaterialApp(
        title: 'Weatherly',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: lightTheme(),
        darkTheme: darkTheme(),
        home: const HomeScreen(),
      ),
    );
  }
}

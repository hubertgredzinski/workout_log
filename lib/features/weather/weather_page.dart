import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workout_log/app/core/injection_container.dart';
import '../../app/core/enums/enums.dart';
import '../../domain/models/weather_model.dart';
import 'cubit/weather_cubit.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherCubit>(
      create: (context) => getIt(),
      child: BlocListener<WeatherCubit, WeatherState>(
        listener: (context, state) {
          if (state.status == Status.error) {
            final errorMessage = state.errorMessage ?? 'Unkown error';
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  errorMessage,
                ),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            final weatherModel = state.model;
            return Scaffold(
              body: Center(
                child: Builder(builder: (context) {
                  if (state.status == Status.loading) {
                    return const Text(
                      'Loading',
                    );
                  }
                  return ListView(
                    shrinkWrap: true,
                    children: [
                      if (weatherModel != null)
                        _FirstWeatherWidget(
                          weatherModel: weatherModel,
                        ),
                      if (weatherModel != null)
                        SecondWeatherDetails(
                          weatherModel: weatherModel,
                        ),
                      const SizedBox(
                        height: 10,
                      ),
                      _SearchWidget(),
                    ],
                  );
                }),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _FirstWeatherWidget extends StatelessWidget {
  const _FirstWeatherWidget({
    Key? key,
    required this.weatherModel,
  }) : super(key: key);

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        return Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(32),
                ),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[
                    Colors.amberAccent,
                    Colors.deepOrange,
                  ],
                ),
              ),
              margin: const EdgeInsets.only(
                bottom: 15,
                top: 30,
                left: 20,
                right: 20,
              ),
              padding: const EdgeInsets.only(
                bottom: 20,
                top: 20,
                left: 20,
                right: 20,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        weatherModel.temp.tempC.toString(),
                        style: GoogleFonts.dosis(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ' °',
                        style: GoogleFonts.dosis(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                weatherModel.city.name.toString(),
                                style: GoogleFonts.dosis(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Partly cloud',
                            style: GoogleFonts.dosis(
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            'New Mexico',
                            style: GoogleFonts.dosis(
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 240,
              height: 140,
              child: Image.network(
                  'https://www.transparentpng.com/thumb/weather-report/sun-cloud-rain-water-lightning-weather-report-png-0.png'),
            )
          ],
        );
      },
    );
  }
}

class SecondWeatherDetails extends StatelessWidget {
  const SecondWeatherDetails({
    Key? key,
    required this.weatherModel,
  }) : super(key: key);

  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        return Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(32),
                ),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[
                    Colors.amberAccent,
                    Colors.deepOrange,
                  ],
                ),
              ),
              margin: const EdgeInsets.only(
                bottom: 30,
                top: 15,
                left: 20,
                right: 20,
              ),
              padding: const EdgeInsets.only(
                bottom: 20,
                top: 20,
                left: 20,
                right: 20,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '456',
                        style: GoogleFonts.dosis(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ' °',
                        style: GoogleFonts.dosis(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                '123',
                                style: GoogleFonts.dosis(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Partly cloud',
                            style: GoogleFonts.dosis(
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            'New Mexico',
                            style: GoogleFonts.dosis(
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 240,
              height: 140,
              child: Image.network(
                  'https://www.transparentpng.com/thumb/weather-report/sun-cloud-rain-water-lightning-weather-report-png-0.png'),
            )
          ],
        );
      },
    );
  }
}

class _SearchWidget extends StatelessWidget {
  _SearchWidget({
    Key? key,
  }) : super(key: key);

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white12,
                    width: 3,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 249, 199, 1),
                  ),
                ),
                hintText: 'Write city e.g.: Wroclaw',
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  const Color.fromARGB(255, 249, 199, 1), // Background color
            ),
            onPressed: () {
              context.read<WeatherCubit>().start(
                    city: _controller.text,
                  );
            },
            child: const Text(
              'Get',
            ),
          ),
        ],
      ),
    );
  }
}

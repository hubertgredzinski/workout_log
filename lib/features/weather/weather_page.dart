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
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      if (weatherModel != null)
                        _DisplayWeatherWidget(
                          weatherModel: weatherModel,
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

class _DisplayWeatherWidget extends StatelessWidget {
  const _DisplayWeatherWidget({
    Key? key,
    required this.weatherModel,
  }) : super(key: key);

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        return Column(
          children: [
            Text(
              weatherModel.city.name.toString(),
              style: GoogleFonts.dosis(
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Temperature :  ',
                  style: GoogleFonts.dosis(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  weatherModel.temp.tempC.toString(),
                  style: GoogleFonts.dosis(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  ' °C',
                  style: GoogleFonts.dosis(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
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
          const SizedBox(
            height: 20,
          ),
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

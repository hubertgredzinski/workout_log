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
                child: Builder(
                  builder: (context) {
                    if (state.status == Status.loading) {
                      return const Text(
                        'Loading',
                      );
                    }
                    return ListView(
                      shrinkWrap: true,
                      children: [
                        if (weatherModel != null)
                          _TopWeatherWidget(
                            weatherModel: weatherModel,
                          ),
                        if (weatherModel != null)
                          DetailsWeatherWidget(
                            weatherModel: weatherModel,
                          ),
                        const SizedBox(
                          height: 10,
                        ),
                        _SearchWidget(),
                      ],
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _TopWeatherWidget extends StatelessWidget {
  const _TopWeatherWidget({
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
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(32),
                ),
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[
                    Colors.lightBlueAccent,
                    Colors.deepPurpleAccent
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(4, 8),
                  ),
                ],
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
                  FirstLineTopWeatherWidget(weatherModel: weatherModel),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      weatherModel.city.name.toString(),
                      style: GoogleFonts.dosis(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ThirdLineTopWeatherWidget(weatherModel: weatherModel),
                ],
              ),
            ),
            SizedBox(
              width: 260,
              height: 145,
              child: Image.network(
                  'https://cdn.weatherapi.com/weather/64x64/day/113.png',
                  fit: BoxFit.fitHeight),
            ),
          ],
        );
      },
    );
  }
}

class FirstLineTopWeatherWidget extends StatelessWidget {
  const FirstLineTopWeatherWidget({
    super.key,
    required this.weatherModel,
  });

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

class ThirdLineTopWeatherWidget extends StatelessWidget {
  const ThirdLineTopWeatherWidget({
    super.key,
    required this.weatherModel,
  });

  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Partly cloud',
          style: GoogleFonts.dosis(
            fontSize: 25,
          ),
        ),
        Text(
          weatherModel.country.country.toString(),
          style: GoogleFonts.dosis(
            fontSize: 25,
          ),
        ),
      ],
    );
  }
}

class DetailsWeatherWidget extends StatelessWidget {
  const DetailsWeatherWidget({
    Key? key,
    required this.weatherModel,
  }) : super(key: key);

  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(
            bottom: 30,
            top: 15,
            left: 20,
            right: 20,
          ),
          padding: const EdgeInsets.only(
            bottom: 20,
            top: 20,
          ),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(32),
            ),
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                Colors.orangeAccent,
                Colors.red,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(4, 8),
              ),
            ],
          ),
          child: const Column(
            children: [
              HeadLineMiddleWeatherWidget(),
              SizedBox(
                height: 20,
              ),
              WeatherDetailsMiddleWeatherWidget(),
            ],
          ),
        );
      },
    );
  }
}

class HeadLineMiddleWeatherWidget extends StatelessWidget {
  const HeadLineMiddleWeatherWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Weather details'.toUpperCase(),
      style: GoogleFonts.dosis(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class WeatherDetailsMiddleWeatherWidget extends StatelessWidget {
  const WeatherDetailsMiddleWeatherWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 15,
        ),
        GridDetailsElementLeft(),
        GridDetailsElementRight(),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}

class GridDetailsElementLeft extends StatelessWidget {
  const GridDetailsElementLeft({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Icon(
          Icons.air,
          size: 30,
        ),
        SizedBox(
          height: 3,
        ),
        Text(
          'wind_mph',
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          '10.5',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Icon(
          Icons.compress_outlined,
          size: 30,
        ),
        SizedBox(
          height: 3,
        ),
        Text(
          'pressure',
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          '1010.0',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class GridDetailsElementRight extends StatelessWidget {
  const GridDetailsElementRight({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Icon(
          Icons.water_drop_outlined,
          size: 30,
        ),
        SizedBox(
          height: 3,
        ),
        Text(
          'humidity',
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          '60',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Icon(
          Icons.wb_cloudy_outlined,
          size: 30,
        ),
        SizedBox(
          height: 3,
        ),
        Text(
          'cloud',
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          '40',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
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

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
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/sky.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: BlocProvider<WeatherCubit>(
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
                backgroundColor: Colors.transparent,
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
  final String weatherIcon = 'weatherModel.current.condition.icon';

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
                    Colors.cyan,
                    Color.fromARGB(255, 45, 77, 255),
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
                      weatherModel.location.name.toString(),
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
              width: 240,
              height: 150,
              child: Image.network(
                "https:${weatherModel.current.condition.icon}",
                fit: BoxFit.fitHeight,
              ),
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
          weatherModel.current.tempC.toString(),
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
        Expanded(
          child: Text(
            weatherModel.current.condition.text.toString(),
            style: GoogleFonts.dosis(
              fontSize: 25,
            ),
          ),
        ),
        Text(
          weatherModel.location.country.toString(),
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
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(4, 8),
              ),
            ],
          ),
          child: Column(
            children: [
              const HeadLineMiddleWeatherWidget(),
              const SizedBox(
                height: 20,
              ),
              WeatherDetailsMiddleWeatherWidget(
                weatherModel: weatherModel,
              ),
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
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: const EdgeInsets.only(
          bottom: 5,
        ),
        child: Text(
          'Weather details'.toUpperCase(),
          style: GoogleFonts.roboto(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class WeatherDetailsMiddleWeatherWidget extends StatelessWidget {
  const WeatherDetailsMiddleWeatherWidget({
    super.key,
    required this.weatherModel,
  });
  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          height: 15,
        ),
        GridDetailsElementLeft(
          weatherModel: weatherModel,
        ),
        GridDetailsElementRight(
          weatherModel: weatherModel,
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}

class GridDetailsElementLeft extends StatelessWidget {
  const GridDetailsElementLeft({
    super.key,
    required this.weatherModel,
  });

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Icons.air,
          size: 30,
          color: Colors.cyan,
        ),
        const SizedBox(
          height: 3,
        ),
        const Text(
          'wind_mph',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          weatherModel.current.windMph.toString(),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Icon(
          Icons.compress_outlined,
          size: 30,
          color: Colors.cyan,
        ),
        const SizedBox(
          height: 3,
        ),
        const Text(
          'pressure',
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          weatherModel.current.pressureMb.toString(),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class GridDetailsElementRight extends StatelessWidget {
  const GridDetailsElementRight({
    required this.weatherModel,
    super.key,
  });

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Icons.water_drop_outlined,
          size: 30,
          color: Colors.cyan,
        ),
        const SizedBox(
          height: 3,
        ),
        const Text(
          'humidity',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          weatherModel.current.humidity.toString(),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Icon(
          Icons.wb_cloudy_outlined,
          size: 30,
          color: Colors.cyan,
        ),
        const SizedBox(
          height: 3,
        ),
        const Text(
          'cloud',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          weatherModel.current.cloud.toString(),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
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
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              controller: _controller,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 45, 111, 255),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                hintText: 'Write city e.g.: Wroclaw',
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              side: const BorderSide(
                color: Colors.black,
              ),
              backgroundColor: const Color.fromARGB(255, 45, 111, 255),
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

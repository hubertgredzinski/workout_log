import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workout_log/features/notes/notes_page.dart';
import '../add_cardio_training/add_cardio_training_page.dart';
import '../add_strength training/add_strength_training.dart';
import '../auth/user_profile.dart';
import '../history/history_training_page.dart';
import '../weather/weather_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.currentUser}) : super(key: key);

  final User currentUser;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Builder(
          builder: (context) {
            if (currentIndex == 3) {
              return const Text(
                'Notes',
              );
            }
            if (currentIndex == 2) {
              return const Text(
                'Weather',
              );
            }
            if (currentIndex == 1) {
              return const Text(
                'History',
              );
            }
            return Text(
              AppLocalizations.of(context)!.helloWorld,
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const UserProfile(),
                ),
              );
            },
            icon: const Icon(
              Icons.person,
            ),
          )
        ],
      ),
      body: Builder(
        builder: (context) {
          if (currentIndex == 3) {
            return const NotesPage();
          }
          if (currentIndex == 2) {
            return const WeatherPage();
          }
          if (currentIndex == 1) {
            return const HistoryPage();
          }
          return Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Center(
                child: Text(
                  'Create your training',
                  style: GoogleFonts.robotoSlab(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddStrengthTrainingPage(),
                    ),
                  );
                },
                child: Text(
                  'Strength Training',
                  style: GoogleFonts.robotoSlab(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AddCardioTrainingPage(),
                      fullscreenDialog: false,
                    ),
                  );
                },
                child: Text(
                  'Cardio',
                  style: GoogleFonts.robotoSlab(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        backgroundColor: Colors.black12,
        iconSize: 26,
        selectedFontSize: 20,
        unselectedFontSize: 15,
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(
            () {
              currentIndex = newIndex;
            },
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Training',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sunny),
            label: 'Weather',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notes),
            label: 'Notes',
          ),
        ],
      ),
    );
  }
}

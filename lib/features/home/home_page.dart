import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workout_log/features/notes/notes_page.dart';
import '../add_cardio_training/add_cardio_training_page.dart';
import '../add_strength training/add_strength_training_page.dart';
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
        backgroundColor: Colors.black54,
        title: Builder(
          builder: (context) {
            if (currentIndex == 3) {
              return const Text(
                'Weather',
              );
            }
            if (currentIndex == 2) {
              return const Text(
                'Notes',
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
            return const WeatherPage();
          }
          if (currentIndex == 2) {
            return const NotesPage();
          }
          if (currentIndex == 1) {
            return const HistoryPage();
          }
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/gym.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: const Column(
              children: [
                Center(),
                SizedBox(
                  height: 220,
                ),
                FirstButton(),
                SizedBox(
                  height: 60,
                ),
                SecondButton()
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.black87,
        iconSize: 22,
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
            icon: Icon(
              Icons.fitness_center,
            ),
            label: 'Training',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history,
            ),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notes,
            ),
            label: 'Notes',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.sunny,
            ),
            label: 'Weather',
          ),
        ],
      ),
    );
  }
}

class FirstButton extends StatelessWidget {
  const FirstButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
          side: BorderSide(color: Colors.grey),
        ),
        backgroundColor: Colors.black87,
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 12,
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
          color: Colors.white70,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class SecondButton extends StatelessWidget {
  const SecondButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
          side: BorderSide(color: Colors.white70),
        ),
        backgroundColor: Colors.black87,
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 12,
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
          color: Colors.white70,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workout_log/app/features/history/history_page.dart';
import 'package:workout_log/app/features/strength%20training/strength_training.dart';
import '../auth/user_profile.dart';
import '../bmi/bmi_page.dart';
import '../cardio_training/cardio_training.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.currentUser}) : super(key: key);

  final User currentUser;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;
  final usersQuery = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.helloWorld),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const UserProfile(),
                ),
              );
            },
            icon: const Icon(Icons.person),
          )
        ],
      ),
      body: Builder(builder: (context) {
        if (currentIndex == 2) {
          return const BmiPage();
        }
        if (currentIndex == 1) {
          return const HistoryPage();
        }
        return Center(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Text(
                'Choose your training',
                style: GoogleFonts.robotoSlab(
                    fontSize: 35, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 100,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StrengthTrainingPage(),
                    ),
                  );
                },
                child: Text(
                  'Strength Training',
                  style: GoogleFonts.robotoSlab(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CardioTrainingPage(),
                      fullscreenDialog: false,
                    ),
                  );
                },
                child: Text(
                  'Cardio',
                  style: GoogleFonts.robotoSlab(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        );
      }),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black12,
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center), label: 'Choose Training'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(
              icon: Icon(Icons.scale), label: 'Check your BMI'),
        ],
      ),
    );
  }
}

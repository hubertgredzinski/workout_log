import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workout_log/app/features/strength%20training/strength_training.dart';
import '../auth/user_profile.dart';
import '../cardio_training/cardio_training.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.currentUser}) : super(key: key);

  final User currentUser;

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
      body: Center(
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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => StrengthTrainingPage(key),
                    fullscreenDialog: false,
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
                    builder: (_) => CardioTrainingPage(key),
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
      ),
    );
  }
}

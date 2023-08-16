import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '_strength_history/strength_history_page.dart';
import 'cardio_history/cardio_history_page.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Text(
              'History',
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
                    builder: (context) => const StrengthHistoryPage(),
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
                    builder: (context) => const CardioHistoryPage(),
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

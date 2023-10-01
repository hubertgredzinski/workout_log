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
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/gym.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            children: [
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
        ),
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
          side: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
        backgroundColor: Colors.grey,
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 12,
        ),
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
            color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
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
          side: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
        backgroundColor: Colors.grey,
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 12,
        ),
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
            color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}

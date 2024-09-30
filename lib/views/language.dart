import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 851.5,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://i.pinimg.com/236x/42/18/e9/4218e916944cfe9c18132d6f15e38cbf.jpg"))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed("home");
                  },
                  child: Container(
                    margin: EdgeInsets.all(12),
                    height: 65,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade500,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "हिंदी",
                          style: GoogleFonts.getFont("Mulish",
                              textStyle: const TextStyle(
                                fontSize: 18,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed("Eng_Home_Page");
                  },
                  child: Container(
                    margin: EdgeInsets.all(12),
                    height: 65,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade500,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "English",
                          style: GoogleFonts.getFont("Mulish",
                              textStyle: const TextStyle(
                                fontSize: 18,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

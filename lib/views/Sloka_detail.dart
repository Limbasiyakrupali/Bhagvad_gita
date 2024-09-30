import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SlokaDetail extends StatefulWidget {
  const SlokaDetail({super.key});

  @override
  State<SlokaDetail> createState() => _SlokaDetailState();
}

class _SlokaDetailState extends State<SlokaDetail> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bhagavad Gita",
          style: GoogleFonts.getFont("Mulish",
              textStyle: const TextStyle(
                fontSize: 20,
              )),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     Container(
            //       margin: EdgeInsets.all(8),
            //       height: 250,
            //       width: 376,
            //       decoration: BoxDecoration(
            //           image: DecorationImage(
            //         fit: BoxFit.cover,
            //         image: NetworkImage(data['image_name']),
            //       )),
            //     ),
            //   ],
            // ),
            SingleChildScrollView(
              child: Column(
                children: [
                  for (var verse in data['verses'])
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                "श्लोक: ${verse['Sloka']}",
                                style: GoogleFonts.getFont("Mulish",
                                    textStyle: const TextStyle(
                                        fontSize: 20, color: Colors.blue)),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "${verse['Verse']}:",
                              style: GoogleFonts.getFont("Mulish",
                                  textStyle: const TextStyle(
                                    fontSize: 17,
                                  )),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 14, right: 14),
                              child: Text(
                                "${verse['Translation_Hindi']}",
                                style: GoogleFonts.getFont("Mulish",
                                    textStyle: const TextStyle(
                                      fontSize: 16,
                                    )),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

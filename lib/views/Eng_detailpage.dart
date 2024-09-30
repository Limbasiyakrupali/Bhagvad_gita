import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/favouritedata.dart';

class EngDetailPage extends StatefulWidget {
  const EngDetailPage({super.key});

  @override
  State<EngDetailPage> createState() => _EngDetailPageState();
}

class _EngDetailPageState extends State<EngDetailPage> {
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
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    data['istapped'] = !data['istapped'];
                    if (data['istapped']) {
                      Favouritedata.favouritedata.add(data);
                    } else {
                      Favouritedata.favouritedata.remove(data);
                    }
                    Favouritedata.convertuniquedata();
                  });
                },
                icon: Icon(
                  data['istapped']
                      ? Icons.favorite
                      : Icons.favorite_border_outlined,
                  color: data['istapped'] ? Colors.red : null,
                ),
              ),
            )
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(8),
              height: 100,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "chapter_number: ${data['chapter_number']}",
                    style: GoogleFonts.getFont("Mulish",
                        textStyle: const TextStyle(
                          fontSize: 20,
                        )),
                  ),
                  Text(
                    "Name Translation: ${data['name_transliterated']}",
                    style: GoogleFonts.getFont("Mulish",
                        textStyle: const TextStyle(
                          fontSize: 20,
                        )),
                  ),
                ],
              ),
            ),
            Container(
              height: 280,
              width: 360,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage("${data['image_name']}"))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "Summary",
                    style: GoogleFonts.getFont("Mulish",
                        textStyle:
                            const TextStyle(fontSize: 22, color: Colors.blue)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      "${data['chapter_summary']}",
                      style: GoogleFonts.getFont("Mulish",
                          textStyle: const TextStyle(
                            fontSize: 16,
                          )),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed("sloka_Eng_detail", arguments: data);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    elevation: 3,
                    child: Container(
                      alignment: Alignment.center,
                      height: 45,
                      width: 140,
                      child: Text(
                        "All Sloka",
                        style: GoogleFonts.getFont("Mulish",
                            textStyle: const TextStyle(
                                fontSize: 22, color: Colors.blue)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}

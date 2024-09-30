import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/favouritedata.dart';

class Favouritepage extends StatefulWidget {
  const Favouritepage({super.key});

  @override
  State<Favouritepage> createState() => _FavouritepageState();
}

class _FavouritepageState extends State<Favouritepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "https://w0.peakpx.com/wallpaper/532/1/HD-wallpaper-shree-krishna-bhagavad-gita-lord-shiva-mahabharata-ramayan.jpg",
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Title widget
                      Text(
                        "Favourites",
                        style: GoogleFonts.getFont("Mulish",
                            textStyle: const TextStyle(
                              fontSize: 23,
                            )),
                      ),
                      SizedBox(height: 20),
                      ...Favouritedata.favouriteproductdata.map(
                        (e) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 10),
                            height: 100,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: ListTile(
                                    onTap: () {},
                                    leading: Text(
                                      "${e['chapter_number']}",
                                      style: GoogleFonts.getFont("Mulish",
                                          textStyle: TextStyle(
                                            fontSize: 16,
                                          )),
                                    ),
                                    title: Text(
                                      "${e['name']}",
                                      style: GoogleFonts.getFont("Mulish",
                                          textStyle: TextStyle(
                                            fontSize: 16,
                                          )),
                                    ),
                                    subtitle: Text(
                                      "${e['name_transliterated']}",
                                      style: GoogleFonts.getFont("Mulish",
                                          textStyle: TextStyle(
                                              fontSize: 16,
                                              color: Colors.blueAccent)),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 35, left: 50),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          e['istapped'] = !e['istapped'];
                                          if (e['istapped']) {
                                            // Add to favorites
                                            Favouritedata.favouritedata.add(e);
                                          } else {
                                            Favouritedata.favouriteproductdata
                                                .remove(e);
                                            Favouritedata.favouritedata
                                                .remove(e);
                                          }
                                        });
                                      },
                                      child: Icon(
                                        e['istapped']
                                            ? Icons.favorite_rounded
                                            : Icons.favorite_border_outlined,
                                        size: 25,
                                        color:
                                            e['istapped'] ? Colors.red : null,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ).toList(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

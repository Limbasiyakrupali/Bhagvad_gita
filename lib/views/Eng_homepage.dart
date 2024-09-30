import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/Switchprovider.dart';

class EngHomePage extends StatefulWidget {
  const EngHomePage({super.key});

  @override
  State<EngHomePage> createState() => _EngHomePageState();
}

class _EngHomePageState extends State<EngHomePage> {
  late Future<String>? jsondata;
  @override
  void initState() {
    super.initState();
    loaddata();
  }

  void loaddata() {
    jsondata = rootBundle.loadString("assests/alldata.json");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.black),
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              child: Container(
                decoration: BoxDecoration(color: Colors.black),
                height: 150,
                width: double.infinity,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(
                            "https://i.pinimg.com/564x/3d/91/09/3d910919cf4d41c1114457504dc29201.jpg")),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.dark_mode),
              title: Text('Change Theme'),
              onTap: () {
                Provider.of<Switchprovider>(context, listen: false)
                    .Changetheme();
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Add Favourite'),
              onTap: () {
                Navigator.of(context).pushNamed("favourite");
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Bhagavad Gita",
            style: GoogleFonts.getFont("Mulish",
                textStyle: const TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold))),
      ),
      body: FutureBuilder(
        future: jsondata,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("ERROR: ${snapshot.hasError}"),
            );
          } else if (snapshot.hasData) {
            String? data = snapshot.data;

            List allposts = (data == null) ? [] : jsonDecode(data);

            return (data == null)
                ? const Center(
                    child: Text("No Data Found"),
                  )
                : ListView.separated(
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed("Eng_detail_Page",
                              arguments: allposts[index]);
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 110,
                                    height: 110,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            "${allposts[index]['image_name']}"),
                                      ),
                                    ),
                                  ),
                                  // Content on the right
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${allposts[index]['chapter_number']}",
                                            style: GoogleFonts.getFont("Mulish",
                                                textStyle: const TextStyle(
                                                  fontSize: 19,
                                                )),
                                          ),
                                          const SizedBox(height: 0),
                                          Text(
                                            "${allposts[index]['name_translation']}",
                                            style: GoogleFonts.getFont("Mulish",
                                                textStyle: const TextStyle(
                                                  fontSize: 16,
                                                )),
                                          ),
                                          Text(
                                            "${allposts[index]['name_transliterated']}",
                                            style: GoogleFonts.getFont("Mulish",
                                                textStyle: const TextStyle(
                                                  fontSize: 15,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Container();
                    },
                    itemCount: allposts.length);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

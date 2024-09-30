import 'package:bhagwat_gita/provider/Switchprovider.dart';
import 'package:bhagwat_gita/views/Eng_detailpage.dart';
import 'package:bhagwat_gita/views/Eng_homepage.dart';
import 'package:bhagwat_gita/views/Sloka_Eng_detailpage.dart';
import 'package:bhagwat_gita/views/Sloka_detail.dart';
import 'package:bhagwat_gita/views/detalipage.dart';
import 'package:bhagwat_gita/views/favouritepage.dart';
import 'package:bhagwat_gita/views/homepage.dart';
import 'package:bhagwat_gita/views/language.dart';
import 'package:bhagwat_gita/views/login_info.dart';
import 'package:bhagwat_gita/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  // bool isintroscreenvisited = prefs.getBool("isintroscreenvisited") ?? false;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) {
            return Switchprovider();
          },
        ),
      ],
      builder: (context, _) {
        return MaterialApp(
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: (Provider.of<Switchprovider>(context).istapped)
              ? ThemeMode.dark
              : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          // initialRoute: (isintroscreenvisited) ? 'home' : 'logininfo',
          routes: {
            '/': (context) => const splashScreen(),
            'language': (context) => const LanguagePage(),
            'logininfo': (context) => const LoginInfo(),
            'home': (context) => const Homepage(),
            'detail': (context) => const DetailPage(),
            'sloka_detail': (context) => const SlokaDetail(),
            'favourite': (context) => const Favouritepage(),
            'Eng_Home_Page': (context) => const EngHomePage(),
            'Eng_detail_Page': (context) => const EngDetailPage(),
            'sloka_Eng_detail': (context) => const SlokaEngDetailpage(),
          },
        );
      },
    ),
  );
}

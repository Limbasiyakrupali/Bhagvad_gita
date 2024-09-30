import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginInfo extends StatelessWidget {
  const LoginInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            height: 851,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://qph.cf2.quoracdn.net/main-qimg-20a16f96b866b2da06e98edddac286df"))),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        onPressed: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();

                          await prefs.setBool("isintroscrrenvisited", true);
                          Navigator.of(context).pushNamed("home");
                        },
                        child: Text(
                          "Get Started",
                          style: TextStyle(fontSize: 22),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

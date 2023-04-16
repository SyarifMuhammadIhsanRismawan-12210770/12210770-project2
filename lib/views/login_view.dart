import 'package:flutter/material.dart';
import 'package:pendataanwarga/views/dashboard_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            judullogin(),
            Image.asset(
              'assets/human.png',
              width: 120,
            ),
            Card(
              color: Color.fromARGB(255, 0, 0, 0),
              elevation: 8,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17)),
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  isidata(),
                  isidata(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (c) => DashboardView()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text('Login'),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        primary: Color.fromARGB(255, 10, 87, 67)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding isidata() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
      child: TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(17),
                    bottomRight: Radius.circular(17))),
            fillColor: Color.fromARGB(255, 212, 212, 212),
            filled: true),
      ),
    );
  }
}

class judullogin extends StatelessWidget {
  const judullogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100, bottom: 30),
      child: Text(
        'Aplikasi\nPendataan Warga',
        style: TextStyle(fontSize: 37, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}

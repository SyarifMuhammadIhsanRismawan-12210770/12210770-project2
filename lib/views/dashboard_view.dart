import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pendataanwarga/providers/dashboard_provider.dart';
import 'package:pendataanwarga/views/berita_panel.dart';
import 'package:pendataanwarga/views/peta_view.dart';
import 'package:provider/provider.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final panels = [DashboardPanel(), BeritaPanel(), SizedBox()];

    return Consumer<DashboardProvider>(builder: (context, provider, widget) {
      return Scaffold(
          bottomNavigationBar: NavigatorBawah(),
          body: panels[provider.indexTombol]);
    });
  }
}

class DashboardPanel extends StatelessWidget {
  const DashboardPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Latar(),
        InformasiPengguna(),
        SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.only(
            top: 150,
          ),
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            margin: EdgeInsets.zero,
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  LabelBerita(),
                  ListBerita(),
                  SizedBox(
                    height: 17,
                  ),
                  Wrap(
                    children: [
                      TombolMenu(
                          image: Image.asset(
                        'assets/icon1.png',
                        width: 60,
                      )),
                      TombolMenu(
                          image: Image.asset(
                        'assets/icon2.png',
                        width: 60,
                      )),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (c) => PetaView()));
                        },
                        child: TombolMenu(
                            image: Image.asset(
                          'assets/icon3.png',
                          width: 60,
                        )),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ))
      ],
    );
  }
}

class Latar extends StatelessWidget {
  const Latar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/ltr1.jpg',
      height: 300,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}

class TombolMenu extends StatelessWidget {
  final Image? image;
  const TombolMenu({Key? key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 9,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.all(8),
      child: Padding(
          padding: const EdgeInsets.all(18.0), child: image ?? SizedBox()),
    );
  }
}

class ListBerita extends StatelessWidget {
  const ListBerita({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/brt1.jpg',
              height: 120,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/brt2.jpg',
              height: 120,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/brt3.jpg',
              height: 120,
            ),
          ),
        ],
      ),
    );
  }
}

class LabelBerita extends StatelessWidget {
  const LabelBerita({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'berita',
            style: TextStyle(fontSize: 17),
          )),
    );
  }
}

class NavigatorBawah extends StatelessWidget {
  const NavigatorBawah({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final p = context.read<DashboardProvider>();

    return BottomNavigationBar(
      currentIndex: p.indexTombol,
      onTap: (value) {
        p.ubahTab(value);
      },
      items: [
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.house), label: 'Beranda'),
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.newspaper), label: 'Berita'),
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.gear), label: 'Pengaturan')
      ],
    );
  }
}

class InformasiPengguna extends StatelessWidget {
  const InformasiPengguna({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                'assets/hacker.png',
                width: 50,
              )),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, Ihsan',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  'Ihsan@gmail.com',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/bell.png',
            width: 40,
          )
        ],
      ),
    );
  }
}

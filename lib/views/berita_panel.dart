import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pendataanwarga/models/berita_model.dart';
import 'package:pendataanwarga/providers/dashboard_provider.dart';
import 'package:provider/provider.dart';

class BeritaPanel extends StatelessWidget {
  const BeritaPanel({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<BeritaLoadDataProvider>().refresh();
    return Scaffold(
        appBar: AppBar(
          title: _TitleBeritaPanel(),
          elevation: 0,
          actions: [_TombolActionBeritaPanel()],
        ),
        body: Consumer<BeritaLoadDataProvider>(builder: (context, prov, w) {
          return ListView(
            children: [for (BeritaModel bm in prov.data) itemBerita(bm)],
          );
        }));
  }

  Container itemBerita(BeritaModel bm) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(children: [
          Container(
            width: double.infinity,
            height: 150,
            child: Image.network(
              bm.image ?? '',
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset('assets/noimage.png');
              },
            ),
            decoration: BoxDecoration(border: Border.all()),
          ),
          Text('${bm.title}')
        ]),
      ),
    );
  }
}

class _TombolActionBeritaPanel extends StatelessWidget {
  const _TombolActionBeritaPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<BeritaPanelProvider>(builder: (context, prov, w) {
      return IconButton(
          onPressed: () {
            prov.ubahmode;
          },
          icon: Visibility(
            visible: prov.modecari == true,
            child: Icon(FontAwesomeIcons.circleXmark),
            replacement: Icon(FontAwesomeIcons.magnifyingGlass),
          ));
    });
  }
}

class _TitleBeritaPanel extends StatelessWidget {
  const _TitleBeritaPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<BeritaPanelProvider>(builder: (context, prov, w) {
      return Visibility(
        visible: prov.modecari,
        child: CupertinoSearchTextField(
          backgroundColor: Colors.black,
          style: TextStyle(color: Colors.white),
          placeholderStyle: TextStyle(color: Colors.white),
        ),
        replacement: Text('Berita Terkini'),
      );
    });
  }
}

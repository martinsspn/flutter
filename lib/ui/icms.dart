import 'package:app_transparencia/ui/graficos/geradorGraficos.dart';
import 'package:app_transparencia/ui/home.dart';
import 'package:app_transparencia/ui/infoPage.dart';
import 'package:app_transparencia/ui/ipi.dart';
import 'package:app_transparencia/ui/ipva.dart';
import 'package:app_transparencia/ui/royaltie.dart';
import 'package:flutter/material.dart';

const List<String> listMunicipio = <String>[
  'Deixar em branco',
  'Natal',
  'Parnamirim',
  'Mossoro',
  'Caico',
  'Currais Novos'
];
const List<String> listAno = <String>[
  'Deixar em branco',
  '2022',
  '2021',
  '2020',
  '2019',
  '2018',
  '2017',
  '2016',
  '2015',
  '2014',
  '2013',
  '2012',
  '2011'
];
const List<String> listMes = <String>[
  'Deixar em branco',
  'Janeiro',
  'Fevereiro',
  'Março',
  'Abril',
  'Maio',
  'Junho',
  'Julho',
  'Agosto',
  'Setembro',
  'Outubro',
  'Novembro',
  'Dezembro'
];

class ICMSPage extends StatefulWidget {
  const ICMSPage({Key? key}) : super(key: key);

  final String title = "ICMS";

  @override
  State<ICMSPage> createState() => _ICMSPageState();
}

class _ICMSPageState extends State<ICMSPage> {
  // ignore: avoid_init_to_null
  String? municipio = null;
  String? ano = null;
  String? mes = null;
  int tipo = 0;
  List<Color> gradientColors = [
    const Color(0xff0293ee),
    const Color(0xff02d39a),
  ];

  void _onItemTapped(int index) {
    setState(() {
      if (index == 0) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const MyHomePage()));
      } else if (index == 2) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const IPVAPage()));
      } else if (index == 3) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const IPIPage()));
      } else if (index == 4) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const RoyaltiePage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.info_sharp,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const InfoPage()));
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButton<String>(
              value: municipio,
              // isExpanded: true,
              onChanged: (String? value) {
                setState(() {
                  municipio = value;
                  if (value == 'Deixar em branco') {
                    municipio = null;
                  }
                });
              },
              items:
                  listMunicipio.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: const Text("Município"),
            ),
            DropdownButton<String>(
              value: ano,
              // isExpanded: true,
              onChanged: (String? value) {
                setState(() {
                  ano = value;
                  if (value == 'Deixar em branco') {
                    ano = null;
                  }
                });
              },
              items: listAno.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: const Text("Ano"),
            ),
            DropdownButton<String>(
              value: mes,
              // isExpanded: true,
              onChanged: (String? value) {
                setState(() {
                  mes = value;
                  if (value == 'Deixar em branco') {
                    mes = null;
                  }
                });
              },
              items: listMes.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: const Text("Mês"),
            ),
            GeradorGrafico(
                imposto: widget.title,
                municipio: municipio,
                ano: ano,
                mes: mes,
                gradientColors: gradientColors,),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Total',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'ICMS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'IPVA',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'IPI',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.align_vertical_bottom_outlined),
            label: 'Royalties',
          ),
        ],
        currentIndex: 1,
        selectedItemColor: Colors.teal,
        unselectedItemColor: const Color.fromARGB(255, 58, 53, 53),
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}

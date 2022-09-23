import 'dart:io';
import 'dart:math';

import 'package:app_transparencia/indicator.dart';
import 'package:app_transparencia/ui/icms.dart';
import 'package:app_transparencia/ui/infoPage.dart';
import 'package:app_transparencia/ui/ipi.dart';
import 'package:app_transparencia/ui/ipva.dart';
import 'package:app_transparencia/ui/royaltie.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

double valorTotal = 10000000000 + Random().nextDouble() * 40000000000;


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  final String title = "Portal da Tranparência";

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String label = "Valor Total";


  bool showTotal = true;
  int lastTouched = -2;
  int x = 0;

  int touchedIndex = -1;
  double valor = valorTotal;


  void _onItemTapped(int index) {
    setState(() {
      if (index == 1) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const ICMSPage()));
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
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Encerrar Aplicativo'),
                  content:
                      const Text('Tem certeza que deseja fechar o aplicativo?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancelar'),
                      child: const Text('Cancelar'),
                    ),
                    TextButton(
                      onPressed: () => exit(0),
                      child: const Text('Sair'),
                    ),
                  ],
                ),
              );
            }),
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
            const Text(
                "Acompanhe aqui os princípais repasses dos impostos do governo do RN aos múnicipios do estado",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20)),
            Row(
              children: <Widget>[
                const SizedBox(
                  height: 18,
                ),
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: PieChart(
                      PieChartData(
                          pieTouchData: PieTouchData(touchCallback:
                              (FlTouchEvent event, pieTouchResponse) {
                            setState(() {
                              if (!event.isInterestedForInteractions ||
                                  pieTouchResponse == null ||
                                  pieTouchResponse.touchedSection == null) {
                                touchedIndex = -1;
                                return;
                              }
                              touchedIndex = pieTouchResponse
                                  .touchedSection!.touchedSectionIndex;

                              if (touchedIndex == 0) {
                                valor = valorTotal * (40 / 100);
                                label = "Valor ICMS";
                              } else if (touchedIndex == 1) {
                                valor = valorTotal * (30 / 100);
                                label = "Valor IPVA";
                              } else if (touchedIndex == 2) {
                                valor = valorTotal * (15 / 100);
                                label = "Valor IPI";
                              } else if (touchedIndex == 3) {
                                valor = valorTotal * (15 / 100);
                                label = "Valor Royalties";
                              } else {
                                valor = valorTotal;
                                label = "Valor Total";
                              }
                            });
                          }),
                          borderData: FlBorderData(
                            show: false,
                          ),
                          sectionsSpace: 0,
                          centerSpaceRadius: 40,
                          sections: showingSections()),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Indicator(
                      color: Color(0xff0293ee),
                      text: 'ICMS',
                      isSquare: true,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Indicator(
                      color: Color(0xfff8b250),
                      text: 'IPVA',
                      isSquare: true,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Indicator(
                      color: Color(0xff845bef),
                      text: 'IPI',
                      isSquare: true,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Indicator(
                      color: Color(0xff13d38e),
                      text: 'Royalties',
                      isSquare: true,
                    ),
                    SizedBox(
                      height: 18,
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  label,
                  style: const TextStyle(fontSize: 20, color: Colors.teal),
                ),
                Text(
                  "R\$ ${valor.toStringAsFixed(2)}",
                  style: const TextStyle(fontSize: 28),
                ),
              ],
            )
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
            icon: Icon(Icons.add_shopping_cart_rounded),
            label: 'ICMS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.car_rental),
            label: 'IPVA',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.align_vertical_bottom_outlined),
            label: 'IPI',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            label: 'Royalties',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.teal,
        unselectedItemColor: const Color.fromARGB(255, 58, 53, 53),
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        default:
          throw Error();
      }
    });
  }
}

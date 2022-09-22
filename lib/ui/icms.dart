import 'package:app_transparencia/ui/home.dart';
import 'package:app_transparencia/ui/infoPage.dart';
import 'package:app_transparencia/ui/ipi.dart';
import 'package:app_transparencia/ui/ipva.dart';
import 'package:app_transparencia/ui/royaltie.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class ICMSPage extends StatefulWidget {
  const ICMSPage({Key? key}) : super(key: key);

  final String title = "ICMS";

  @override
  State<ICMSPage> createState() => _ICMSPageState();
}

class _ICMSPageState extends State<ICMSPage> {
  // ignore: avoid_init_to_null
  String? dropdownValue = null;

  Map<String, double> dataMap = {
    "ICMS": 45,
    "IPVA": 30,
    "IPI": 15,
    "Royalties": 10
  };

  void _onItemTapped(int index) {
    setState(() {
      if (index == 0) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const MyHomePage()));
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const InfoPage()));
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButton<String>(
              value: dropdownValue,
              // isExpanded: true,
              onChanged: (String? value) {
                setState(() {
                  dropdownValue = value!;
                });
              },
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: const Text("Município"),
            ),
            DropdownButton<String>(
              value: dropdownValue,
              // isExpanded: true,
              onChanged: (String? value) {
                setState(() {
                  dropdownValue = value!;
                });
              },
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: const Text("Ano"),
            ),
            DropdownButton<String>(
              value: dropdownValue,
              // isExpanded: true,
              onChanged: (String? value) {
                setState(() {
                  dropdownValue = value!;
                });
              },
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: const Text("Mês"),
            ),
            PieChart(dataMap: dataMap),
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
            icon: Icon(Icons.school),
            label: 'Royalties',
          ),
        ],
        currentIndex: 1,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: const Color.fromARGB(255, 58, 53, 53),
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}

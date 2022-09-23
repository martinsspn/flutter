import 'dart:math';

import 'package:app_transparencia/ui/graficos/graficoDeBarras.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GeradorGrafico extends StatelessWidget {
  final String imposto;
  final String? municipio;
  final String? ano;
  final String? mes;

  
  const GeradorGrafico(
      {Key? key, required this.imposto, required this.municipio, required this.ano, required this.mes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (municipio == null) {
      return const Text("Informe o município para localizar os dados!");
    } else {
      if (ano == null && mes == null) {
        List<String> bottomTitles = ["JAN", "FEV", "MAR", "ABR", "MAI", "JUN", "JUL", "AGO", "SET", "OUT", "NOV", "DEZ"];
        Map <double, double> valores = {};
        for(int i=0; i<=11; i++){
          valores.putIfAbsent(i.toDouble(), () => double.parse(Random().nextDouble().toStringAsPrecision(2)) * 11);
        }
        return GraficoDeBarras(label: "2022", bottomTitles: bottomTitles, valores: valores);
      } else if (ano != null && mes == null) {
        List<String> bottomTitles = ["JAN", "FEV", "MAR", "ABR", "MAI", "JUN", "JUL", "AGO", "SET", "OUT", "NOV", "DEZ"];
        Map <double, double> valores = {};
        for(int i=0; i<=11; i++){
          valores.putIfAbsent(i.toDouble(), () => double.parse(Random().nextDouble().toStringAsPrecision(2)) * 11);
        }
        return GraficoDeBarras(label: ano!, bottomTitles: bottomTitles, valores: valores,);
      }else if(ano == null && mes != null){
                List<String> bottomTitles = ["2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022"];
        Map <double, double> valores = {};
        for(int i=0; i<=11; i++){
          valores.putIfAbsent(i.toDouble(), () => double.parse(Random().nextDouble().toStringAsPrecision(2)) * 11);
        }
        return GraficoDeBarras(label: mes!, bottomTitles: bottomTitles, valores: valores,) ;
      } else if (ano != null && mes != null) {
        var valor = 1000000000 + Random().nextDouble() * 4000000000;
        var valorString = valor.toStringAsFixed(2);
        return Text("O repasse do $imposto para o mês de $mes do ano $ano foi de R\$ $valorString");
      } else {
        return const Text("Error!");
      }
    }
  }
}

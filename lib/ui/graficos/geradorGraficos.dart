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
        Map <double, double> valores = {  //primeiro valor é eixo x(0 a 11) e o segundo é o eixo y (0 a 10)
          0: 1.2,
          1: 1.4,
          2: 1.3,
          3: 1.6,
          4: 1.1,
          5: 2.2,
          6: 2.5,
          7: 2.4,
          8: 3.4,
          9: 2.1,
          10: 1.1,
          11: 2
        };
        return GraficoDeBarras(label: "2022", bottomTitles: bottomTitles, valores: valores);
      } else if (ano != null && mes == null) {
        List<String> bottomTitles = ["JAN", "FEV", "MAR", "ABR", "MAI", "JUN", "JUL", "AGO", "SET", "OUT", "NOV", "DEZ"];
        Map <double, double> valores = {  //primeiro valor é eixo x(0 a 11) e o segundo é o eixo y (0 a 6)
          0: 1.4,
          1: 1.6,
          2: 1.4,
          3: 1.3,
          4: 1.8,
          5: 3.2,
          6: 3.5,
          7: 1.4,
          8: 0.4,
          9: 1.1,
          10: 1.1,
          11: 2
        };
        return GraficoDeBarras(label: ano!, bottomTitles: bottomTitles, valores: valores,);
      }else if(ano == null && mes != null){
                List<String> bottomTitles = ["2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022"];
        Map <double, double> valores = {  //primeiro valor é eixo x(0 a 11) e o segundo é o eixo y (0 a 6)
          0: 1.2,
          1: 1.4,
          2: 2.3,
          3: 1.6,
          4: 1.2,
          5: 2.5,
          6: 4.1,
          7: 2.4,
          8: 3.4,
          9: 2.1,
          10: 1.1,
          11: 6
        };
        return GraficoDeBarras(label: mes!, bottomTitles: bottomTitles, valores: valores,) ;
      } else if (ano != null && mes != null) {
        return const Text("Informações desse mês e ano");
      } else {
        return const Text("Error!");
      }
    }
  }
}

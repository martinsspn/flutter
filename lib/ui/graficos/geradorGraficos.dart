import 'dart:math';

import 'package:app_transparencia/ui/graficos/graficoDeBarras.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GeradorGrafico extends StatefulWidget {
  final String imposto;
  final String? municipio;
  final String? ano;
  final String? mes;
  final List<Color> gradientColors;

  const GeradorGrafico(
      {Key? key,
      required this.imposto,
      required this.municipio,
      required this.ano,
      required this.mes,
      required this.gradientColors})
      : super(key: key);

  @override
  State<GeradorGrafico> createState() => _GeradorGraficoState();
}

class _GeradorGraficoState extends State<GeradorGrafico> {
  @override
  Widget build(BuildContext context) {
    if (widget.municipio == null) {
      return const Text("Informe o município para localizar os dados!");
    } else {
      if (widget.ano == null && widget.mes == null) {
        List<String> bottomTitles = [
          "JAN",
          "FEV",
          "MAR",
          "ABR",
          "MAI",
          "JUN",
          "JUL",
          "AGO",
          "SET",
          "OUT",
          "NOV",
          "DEZ"
        ];
        Map<double, double> valores = {};
        for (int i = 0; i <= 11; i++) {
          valores.putIfAbsent(
              i.toDouble(),
              () =>
                  double.parse(Random().nextDouble().toStringAsFixed(2)) * 10);
        }
        return GraficoDeBarras(
          label: "2022",
          bottomTitles: bottomTitles,
          valores: valores,
          gradientColors: widget.gradientColors,
        );
      } else if (widget.ano != null && widget.mes == null) {
        List<String> bottomTitles = [
          "JAN",
          "FEV",
          "MAR",
          "ABR",
          "MAI",
          "JUN",
          "JUL",
          "AGO",
          "SET",
          "OUT",
          "NOV",
          "DEZ"
        ];
        Map<double, double> valores = {};
        for (int i = 0; i <= 11; i++) {
          valores.putIfAbsent(
              i.toDouble(),
              () =>
                  double.parse(Random().nextDouble().toStringAsFixed(2)) * 10);
        }
        return GraficoDeBarras(
            label: widget.ano!,
            bottomTitles: bottomTitles,
            valores: valores,
            gradientColors: widget.gradientColors);
      } else if (widget.ano == null && widget.mes != null) {
        List<String> bottomTitles = [
          "2011",
          "2012",
          "2013",
          "2014",
          "2015",
          "2016",
          "2017",
          "2018",
          "2019",
          "2020",
          "2021",
          "2022"
        ];
        Map<double, double> valores = {};
        for (int i = 0; i <= 11; i++) {
          valores.putIfAbsent(
              i.toDouble(),
              () =>
                  double.parse(Random().nextDouble().toStringAsFixed(2)) * 10);
        }
        return GraficoDeBarras(
            label: widget.mes!,
            bottomTitles: bottomTitles,
            valores: valores,
            gradientColors: widget.gradientColors);
      } else if (widget.ano != null && widget.mes != null) {
        var valor = 1000000000 + Random().nextDouble() * 4000000000;
        var valorString = valor.toStringAsFixed(2);
        return Padding(
            padding: const EdgeInsets.only(
                right: 18.0, left: 12.0, top: 24, bottom: 12),
            child: Text(
              "O repasse do(s) ${widget.imposto} para ${widget.mes} de ${widget.ano} foi de R\$ $valorString",
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ));
      } else {
        return const Text("Error!");
      }
    }
  }
}

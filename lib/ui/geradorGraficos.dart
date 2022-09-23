import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GeradorGrafico extends StatelessWidget {
  final String? municipio;
  final String? ano;
  final String? mes;

  Map<String, double> dataMap = {
    "ICMS": 45,
    "IPVA": 30,
    "IPI": 15,
    "Royalties": 10
  };

  GeradorGrafico(
      {Key? key, required this.municipio, required this.ano, required this.mes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (municipio == null) {
      return const Text("Informe o município para localizar os dados!");
    } else {
      if (ano == null && mes == null) {
        //plotar um grafico
        return const Text("Plotar Gráfico para o imposto");
      } else if (ano != null && mes == null) {
        return const Text("Plotar Gráfico ano");

        //plotar um gráfico
      } else if (ano != null && mes != null) {
        return const Text("Informações desse mês e ano");

        //informações sobre aquele mês
      } else {
        return const Text("Error!");
      }
    }
  }
}

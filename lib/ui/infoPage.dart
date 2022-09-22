import 'package:app_transparencia/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  PageController? pageViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E63BB),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyHomePage()));
          },
        ),
        // ignore: prefer_const_constructors
        title: Text(
          'Informações',
          style: const TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        actions: const [],
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 500,
                  child: Stack(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                        child: PageView(
                          controller: pageViewController ??=
                              PageController(initialPage: 0),
                          scrollDirection: Axis.horizontal,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Text('ICMS',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF0E63BB),
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: GradientText(
                                    'O ICMS (imposto sobre operações relativas à circulação de mercadorias e sobre prestações de serviços de transporte interestadual, intermunicipal e de comunicação) é de competência dos Estados e do Distrito Federal.\n\nSua regulamentação constitucional está prevista na Lei Complementar 87/1996 (a chamada “Lei Kandir”).',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 18,
                                    ),
                                    colors: const [
                                      Color(0xFF0E63BB),
                                      Color(0xFF959700)
                                    ],
                                    gradientDirection: GradientDirection.ltr,
                                    gradientType: GradientType.linear,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Text(
                                  'IPI',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF0E63BB),
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: GradientText(
                                    'O imposto sobre produtos industrializados (IPI) incide sobre produtos industrializados, nacionais e estrangeiros.\n\nSuas disposições estão regulamentadas pelo Decreto 7.212/2010 (RIPI/2010).\n\nO campo de incidência do imposto abrange todos os produtos com alíquota, ainda que zero, relacionados na Tabela de Incidência do IPI (TIPI), observadas as disposições contidas nas respectivas notas complementares, excluídos aqueles a que corresponde a notação \"NT\" (não-tributado).',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 18,
                                    ),
                                    colors: const [
                                      Color(0xFF0E63BB),
                                      Color(0xFF959700)
                                    ],
                                    gradientDirection: GradientDirection.ltr,
                                    gradientType: GradientType.linear,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Text(
                                  'IPVA',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF0E63BB),
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: GradientText(
                                    'O IPVA – Imposto sobre a Propriedade de Veículos Automotores - é um imposto estadual pago anualmente pelo proprietário de todo e qualquer veículo automotor ao qual seja exigido emplacamento.\n\nDo total arrecadado, 50% cabe ao Estado e 50% ao Município onde ocorreu o emplacamento.',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 18,
                                    ),
                                    colors: const [
                                      Color(0xFF0E63BB),
                                      Color(0xFF959700)
                                    ],
                                    gradientDirection: GradientDirection.ltr,
                                    gradientType: GradientType.linear,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0, 1),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: SmoothPageIndicator(
                            controller: pageViewController ??=
                                PageController(initialPage: 0),
                            count: 3,
                            axisDirection: Axis.horizontal,
                            onDotClicked: (i) {
                              pageViewController!.animateToPage(
                                i,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            effect: const ExpandingDotsEffect(
                              expansionFactor: 2,
                              spacing: 8,
                              radius: 16,
                              dotWidth: 16,
                              dotHeight: 16,
                              dotColor: Color(0xFF9E9E9E),
                              activeDotColor: Color(0xFF3995EF),
                              paintStyle: PaintingStyle.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

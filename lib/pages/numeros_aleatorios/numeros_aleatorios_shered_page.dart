import 'dart:math';

import 'package:flutter/material.dart';

import 'package:trilhaapp/services/app_storage.dart';

class NumerosAleatoriosSheredPreferencesPage extends StatefulWidget {
  const NumerosAleatoriosSheredPreferencesPage({super.key});

  @override
  State<NumerosAleatoriosSheredPreferencesPage> createState() =>
      _NumerosAleatoriosSheredPreferencesPageState();
}

class _NumerosAleatoriosSheredPreferencesPageState
    extends State<NumerosAleatoriosSheredPreferencesPage> {
  int? numeroGerado;
  int? quantidadeClicks;

  AppStorage storage = AppStorage();

  void carregarDados() async {
    numeroGerado = await storage.getNumeroAleatorio();
    quantidadeClicks = await storage.getNumeroDeClicks();

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Gerador De numeros Aleatorios")),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                numeroGerado == null
                    ? "Nenhum numero gerado"
                    : numeroGerado.toString(),
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                quantidadeClicks == null
                    ? "Nenhum click"
                    : quantidadeClicks.toString(),
                style: const TextStyle(fontSize: 18),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () async {
              var random = Random();
              setState(() {
                numeroGerado = random.nextInt(1000);
                quantidadeClicks = (quantidadeClicks ?? 0) + 1;
              });
              storage.setNumeroAleatorio(numeroGerado!);
              storage.setNumeroDeClicks(quantidadeClicks!);
            }),
      ),
    );
  }
}

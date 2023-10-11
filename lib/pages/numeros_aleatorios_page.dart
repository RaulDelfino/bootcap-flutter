import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trilhaapp/pages/services/app_storage.dart';

class NumerosAleatoriosPage extends StatefulWidget {
  const NumerosAleatoriosPage({super.key});

  @override
  State<NumerosAleatoriosPage> createState() => _NumerosAleatoriosPageState();
}

class _NumerosAleatoriosPageState extends State<NumerosAleatoriosPage> {
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

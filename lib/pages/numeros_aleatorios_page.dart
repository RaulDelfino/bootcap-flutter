import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NumerosAleatoriosPage extends StatefulWidget {
  const NumerosAleatoriosPage({super.key});

  @override
  State<NumerosAleatoriosPage> createState() => _NumerosAleatoriosPageState();
}

class _NumerosAleatoriosPageState extends State<NumerosAleatoriosPage> {
  int? numeroGerado;
  int? quantidadeClicks;
  final CHAVE_NUMERO_ALEATORIO = 'numero_aleatorio';
  final CHAVE_quantidadeClicks = 'quantidade_cliques';
  late SharedPreferences storage;

  void carregarDados() async {
    storage = await SharedPreferences.getInstance();

    setState(() {
      numeroGerado = storage.getInt(CHAVE_NUMERO_ALEATORIO);
      quantidadeClicks = storage.getInt(CHAVE_quantidadeClicks);
    });
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
            child: Icon(Icons.add),
            onPressed: () async {
              var random = Random();
              setState(() {
                numeroGerado = random.nextInt(1000);
                quantidadeClicks = (quantidadeClicks ?? 0) + 1;
              });
              storage.setInt(CHAVE_NUMERO_ALEATORIO, numeroGerado!);
              storage.setInt(CHAVE_quantidadeClicks, quantidadeClicks!);
            }),
      ),
    );
  }
}

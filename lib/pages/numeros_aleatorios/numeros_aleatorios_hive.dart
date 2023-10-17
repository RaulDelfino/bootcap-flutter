import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class NumerosAleatoriosHivePage extends StatefulWidget {
  const NumerosAleatoriosHivePage({super.key});

  @override
  State<NumerosAleatoriosHivePage> createState() =>
      _NumerosAleatoriosHivePageState();
}

class _NumerosAleatoriosHivePageState extends State<NumerosAleatoriosHivePage> {
  int? numeroGerado;
  int? quantidadeClicks;

  late Box boxNumerosAleatorios;

  void carregarDados() async {
    if (Hive.isBoxOpen("box_numeros_aleatorios")) {
      boxNumerosAleatorios = Hive.box("box_numeros_aleatorios");
    } else {
      boxNumerosAleatorios = await Hive.openBox("box_numeros_aleatorios");
    }

    numeroGerado = boxNumerosAleatorios.get("numeroGerado") ?? 0;
    quantidadeClicks = boxNumerosAleatorios.get("clicks") ?? 0;

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
        appBar: AppBar(title: const Text("Hive")),
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
              boxNumerosAleatorios.put("numeroGerado", numeroGerado);
              boxNumerosAleatorios.put("clicks", quantidadeClicks);
            }),
      ),
    );
  }
}

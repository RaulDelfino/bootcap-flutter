import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/model/tarefa.dart';
import 'package:trilhaapp/pages/repositores/tarefa_repository.dart';

class TarefaPage extends StatefulWidget {
  const TarefaPage({super.key});

  @override
  State<TarefaPage> createState() => _TarefaPageState();
}

class _TarefaPageState extends State<TarefaPage> {
  var tarefaRepository = TarefaRepository();
  TextEditingController descricaoController = TextEditingController();
  var _tarefas = const <Tarefa>[];

  void obtertarefas() async {
    _tarefas = await tarefaRepository.listarTarefas();
  }

  @override
  void initState() {
    super.initState();
    obtertarefas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            descricaoController.text = "";
            showDialog(
                context: context,
                builder: (BuildContext bc) {
                  return AlertDialog(
                    title: Text('adicionar tarefa'),
                    content: TextField(
                      controller: descricaoController,
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancelar")),
                      TextButton(
                          onPressed: () async {
                            await tarefaRepository.adicionat(
                                Tarefa(descricaoController.text, false));
                            Navigator.pop(context);
                            setState(() {});
                          },
                          child: const Text("Salvar")),
                    ],
                  );
                });
          }),
      body: ListView.builder(
          itemCount: _tarefas.length,
          itemBuilder: (BuildContext bc, int index) {
            var tarefa = _tarefas[index];
            return Text(tarefa.getDescricao());
          }),
    );
  }
}

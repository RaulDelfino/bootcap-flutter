import 'package:flutter/material.dart';
import 'package:trilhaapp/model/tafera_model_hive.dart';
import 'package:trilhaapp/model/tarefa_model_sqlite.dart';

import 'package:trilhaapp/repositores/tarefa_hive_repository.dart';
import 'package:trilhaapp/repositores/tarefa_sqlite_repository.dart';

class TarefaSqlitePage extends StatefulWidget {
  const TarefaSqlitePage({super.key});

  @override
  State<TarefaSqlitePage> createState() => _TarefaSqlitePageState();
}

class _TarefaSqlitePageState extends State<TarefaSqlitePage> {
  TarefaSqliteRepository tarefaRepository = TarefaSqliteRepository();

  TextEditingController descricaoController = TextEditingController();
  var _tarefas = const <TarefaSqliteModel>[];
  var apenasNaoConcluidos = false;

  void obtertarefas() async {
    _tarefas = await tarefaRepository.obterDados(apenasNaoConcluidos);
    setState(() {});
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
                            await tarefaRepository.salvar(TarefaSqliteModel(
                                0, descricaoController.text, false));
                            Navigator.pop(context);
                            obtertarefas();
                            setState(() {});
                          },
                          child: const Text("Salvar")),
                    ],
                  );
                });
          }),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Filtrar Apenas não concluidos",
                      style: TextStyle(fontSize: 18)),
                  Switch(
                      value: apenasNaoConcluidos,
                      onChanged: (bool value) {
                        apenasNaoConcluidos = value;
                        setState(() {});
                        obtertarefas();
                      })
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: _tarefas.length,
                  itemBuilder: (BuildContext bc, int index) {
                    var tarefa = _tarefas[index];
                    return Dismissible(
                      onDismissed: (DismissDirection dismissDirection) async {
                        tarefaRepository.remover(tarefa.id);
                        obtertarefas();
                      },
                      key: Key(tarefa.descricao),
                      child: ListTile(
                        title: Text(tarefa.descricao),
                        trailing: Switch(
                            onChanged: (bool value) async {
                              tarefa.concluido = value;
                              tarefaRepository.atualizar(tarefa);
                              obtertarefas();
                            },
                            value: tarefa.concluido),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

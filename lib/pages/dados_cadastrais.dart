import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/repositores/linguagens_repository.dart';
import 'package:trilhaapp/pages/repositores/nivel_repository.dart';
import 'package:trilhaapp/shared/widgets/text_label.dart';

class DadosPage extends StatefulWidget {
  const DadosPage({super.key});

  @override
  State<DadosPage> createState() => _DadosPageState();
}

class _DadosPageState extends State<DadosPage> {

  TextEditingController nomeController = TextEditingController(text: "");
  TextEditingController dataNascientoController =
      TextEditingController(text: "");
  DateTime? dataNascimento;


  var nivelRepository = NivelRepository();
  var niveis = [];
  var nivelSelected = "";

  var linguagensRepository = LinguagensRepository();
  var linguagens = [];
  var linguagensCheck = [];

  bool salvando = false;

  double salarioEscolhido = 0;
  int? tempoExperiencia = 1;
  
  @override
  void initState() {
    niveis = nivelRepository.retornaNiveis();
    linguagens = linguagensRepository.retornarLinguagens();
    super.initState();
  }

  List<DropdownMenuItem> returnItens(int quantidadeMaxima) {
    var itens = <DropdownMenuItem>[];
    for (var i = 0; i <= quantidadeMaxima; i++) {
      itens.add(DropdownMenuItem(child: Text(i.toString()), value: i));
    }
    return itens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Meus dados"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: salvando
              ? const Center(child: CircularProgressIndicator())
              : ListView(children: [
                  const TextLabel(texto: "Nome"),
                  TextField(
                    controller: nomeController,
                  ),
                  const TextLabel(texto: "Data de Nascimento"),
                  TextField(
                    controller: dataNascientoController,

                    readOnly: true, //n deixa escrever
                    onTap: () async {
                      var data = await showDatePicker(
                          context: context,
                          initialDate: DateTime(2000, 1, 1),
                          firstDate: DateTime(1900, 5, 20),
                          lastDate: DateTime(2023, 10, 12));
                      if (data != null) {
                        dataNascientoController.text = data.toString();
                        dataNascimento = data;
                      }
                    },
                  ),
                  const TextLabel(texto: "Nivel de experiencia"),
                  Column(
                    children: niveis
                        .map((nivel) => RadioListTile(
                            dense: true,
                            title: Text(nivel.toString()),
                            selected: nivelSelected == nivel,
                            value: nivel.toString(),
                            groupValue: nivelSelected,
                            onChanged: (value) {
                              setState(() {
                                nivelSelected = value.toString();
                              });
                            }))
                        .toList(),
                  ),
                  const TextLabel(texto: "linguagens Preferidas:"),
                  Column(
                    children: linguagens
                        .map((linguagem) => CheckboxListTile(
                            dense: true,
                            title: Text(linguagem.toString()),
                            value: linguagensCheck.contains(linguagem),
                            onChanged: (bool? value) {
                              if (value!) {
                                setState(() {
                                  linguagensCheck.add(linguagem);
                                });
                              } else {
                                setState(() {
                                  linguagensCheck.remove(linguagem);
                                });
                              }
                            }))
                        .toList(),
                  ),
                  const TextLabel(texto: "Tempo de Experiencia"),
                  DropdownButton(
                      isExpanded: true,
                      value: tempoExperiencia,
                      items: returnItens(50),
                      onChanged: (value) {
                        setState(() {
                          tempoExperiencia = int.parse(value.toString());
                        });
                      }),
                  TextLabel(
                      texto:
                          "Pretenção Salarial R\$ ${salarioEscolhido.round().toString()}"),
                  Slider(
                      min: 0,
                      max: 10000,
                      value: salarioEscolhido,
                      onChanged: (double value) {
                        setState(() {
                          salarioEscolhido = value;
                        });
                      }),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          salvando = false;
                        });
                        if (nomeController.text.trim().length < 3) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("O nome deve ser Preenchido!")));
                          return; // para n continuar
                        }
                        if (dataNascimento == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Data de nacimento invalida")));
                          return;
                        }

                        if (nivelSelected.trim() == "") {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("O nivel Deve ser selecionado!")));
                          return;
                        }
                        if (linguagensCheck.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "Deve selecionar pelo menos uma Linguagem!")));
                          return;
                        } // isEmpty = é vazia

                        if (tempoExperiencia == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "Deve ter ao menos um ano de experiencoa")));
                          return;
                        }

                        if (salarioEscolhido == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "A pretenção salarial deve ser maior que 0")));
                          return;
                        }

                        print("salvo com Sucesso!");

                        setState(() {
                          salvando = true;
                        });

                        Future.delayed(Duration(seconds: 3), () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Dados salvos com Sucesso")));
                          setState(() {
                            salvando = false;
                          });
                          Navigator.pop(context);
                        });
                      },
                      child: const Text("Salvar")),
                ]),
        ));
  }
}

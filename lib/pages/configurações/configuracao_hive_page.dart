import 'package:flutter/material.dart';
import 'package:trilhaapp/model/configuracaos_model.dart';
import 'package:trilhaapp/repositores/configuracao_repository.dart';

import 'package:trilhaapp/services/app_storage.dart';

class ConfiguracaoHivePage extends StatefulWidget {
  const ConfiguracaoHivePage({super.key});

  @override
  State<ConfiguracaoHivePage> createState() => _ConfiguracaoHivePageState();
}

class _ConfiguracaoHivePageState extends State<ConfiguracaoHivePage> {
  late ConfiguracaoRepository configuracaoRepository;
  ConfiguracoesModel configuracoesModel = ConfiguracoesModel.vazio();

  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    configuracaoRepository = await ConfiguracaoRepository.carregar();
    configuracoesModel = configuracaoRepository.obterDados();

    nomeUsuarioController.text = configuracoesModel.nomeUsuario;
    alturaController.text = configuracoesModel.altura.toString();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Configurações Hive"),
        ),
        body: Container(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: nomeUsuarioController,
                  decoration: const InputDecoration(hintText: "Nome Usuario"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  decoration: const InputDecoration(hintText: "Altura"),
                  controller: alturaController,
                  keyboardType: TextInputType.number, //Apenas numeros
                ),
              ),
              SwitchListTile(
                  title: const Text("Receber Notificações"),
                  value: configuracoesModel.receberNotificacao,
                  onChanged: (bool value) {
                    setState(() {
                      configuracoesModel.receberNotificacao = value;
                    });
                  }),
              SwitchListTile(
                  title: const Text("Tema escuro"),
                  value: configuracoesModel.temaEscuro,
                  onChanged: (bool value) {
                    setState(() {
                      configuracoesModel.temaEscuro = value;
                    });
                  }),
              TextButton(
                  onPressed: () async {
                    FocusManager.instance.primaryFocus
                        ?.unfocus(); // fechar teclado
                    try {
                      configuracoesModel.altura =
                          double.parse(alturaController.text);
                    } catch (e) {
                      // ignore: use_build_context_synchronously
                      showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: const Text("Meu App"),
                              content: const Text("Informar altura Valida"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Ok"))
                              ],
                            );
                          });
                      return;
                    }
                    configuracoesModel.nomeUsuario = nomeUsuarioController.text;
                    configuracaoRepository.salvar(configuracoesModel);
                    Navigator.pop(context);
                  },
                  child: const Text("Salvar")),
            ],
          ),
        ),
      ),
    );
  }
}

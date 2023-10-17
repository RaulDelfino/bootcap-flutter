import 'package:flutter/material.dart';

import 'package:trilhaapp/services/app_storage.dart';

class ConfiguracaoSharedPage extends StatefulWidget {
  const ConfiguracaoSharedPage({super.key});

  @override
  State<ConfiguracaoSharedPage> createState() => _ConfiguracaoSharedPageState();
}

class _ConfiguracaoSharedPageState extends State<ConfiguracaoSharedPage> {
  AppStorage storage = AppStorage();
  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String? nomeUsuario;
  double? altura;
  bool receberPushNotificacion = false;
  bool temaEscuro = false;

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    nomeUsuarioController.text = await storage.getConfigNomeUsuario();
    alturaController.text =
        (await (storage.getConfigAlturaUsuario())).toString();
    receberPushNotificacion = await storage.getConfigNotificacao();
    temaEscuro = await storage.getConfigTemaEscuro();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Configurações"),
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
                  value: receberPushNotificacion,
                  onChanged: (bool value) {
                    setState(() {
                      receberPushNotificacion = value;
                    });
                  }),
              SwitchListTile(
                  title: const Text("Tema escuro"),
                  value: temaEscuro,
                  onChanged: (bool value) {
                    setState(() {
                      temaEscuro = value;
                    });
                  }),
              TextButton(
                  onPressed: () async {
                    FocusManager.instance.primaryFocus
                        ?.unfocus(); // fechar teclado
                    try {
                      await storage.setConfigAlturaUsuario(
                          double.parse(alturaController.text) ?? 0);
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
                    await storage
                        .setConfigNomeUsuario(nomeUsuarioController.text);
                    await storage.setConfigNotificacao(receberPushNotificacion);
                    await storage.setConfigTemaEscuro(temaEscuro);
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

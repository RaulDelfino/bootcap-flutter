import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfiguracaoPage extends StatefulWidget {
  const ConfiguracaoPage({super.key});

  @override
  State<ConfiguracaoPage> createState() => _ConfiguracaoPageState();
}

class _ConfiguracaoPageState extends State<ConfiguracaoPage> {
  late SharedPreferences storage;
  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String? nomeUsuario;
  double? altura;
  bool receberPushNotificacion = false;
  bool temaEscuro = false;

  final CHAVE_NOME_USUARIO = "CHAVE_NOME_USUARIO";
  final CHAVE_ALTURA = "CHAVE_ALTURA";
  final CHAVE_NOTIFICACAO = "CHAVE_NOTIFICACAO";
  final CHAVE_TEMA = "CHAVE_TEMA";

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    storage = await SharedPreferences.getInstance();

    setState(() {
      nomeUsuarioController.text = storage.getString(CHAVE_NOME_USUARIO) ?? "";
      alturaController.text = (storage.getDouble(CHAVE_ALTURA) ?? 0).toString();
      receberPushNotificacion = storage.getBool(CHAVE_NOTIFICACAO) ?? false;
      temaEscuro = storage.getBool(CHAVE_TEMA) ?? false;
    });
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
                    FocusManager.instance.primaryFocus?.unfocus(); // fechar teclado
                    try {
                      await storage.setDouble(CHAVE_ALTURA,
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
                    await storage.setString(
                        CHAVE_NOME_USUARIO, nomeUsuarioController.text);
                    await storage.setBool(
                        CHAVE_NOTIFICACAO, receberPushNotificacion);
                    await storage.setBool(CHAVE_TEMA, temaEscuro);
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

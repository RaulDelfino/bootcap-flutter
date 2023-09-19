import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/dados_cadastrais.dart';
import 'package:trilhaapp/pages/login_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  context: context,
                  builder: (BuildContext bc) {
                    return Wrap(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: Text("Camera"),
                          leading: Icon(Icons.camera),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: const Text("Galeria"),
                          leading: const Icon(Icons.album),
                        )
                      ],
                    );
                  });
            },
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.orange),
              accountName: Text("Raul Delfino"),
              accountEmail: const Text("Email@gmail"),
              currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.network(
                      'https://hermes.digitalinnovation.one/assets/diome/logo.png')),
            ),
          ),
          InkWell(
            child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: const Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Dados Cadastrais"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context); // fechar drawer
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const DadosPage()));
            },
          ),
          const Divider(),
          const SizedBox(height: 10),
          InkWell(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: const Row(
                children: [
                  Icon(Icons.album),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Termos de uso e Privacidade"),
                ],
              ),
            ),
            onTap: () {
              showModalBottomSheet(
                  showDragHandle: true,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  context: context,
                  builder: (BuildContext bc) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      child: const Column(
                        children: [
                          Text(
                            'Termos de uso e Privacidade',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Mussum Ipsum, cacilds vidis litro abertis. Cevadis im ampola pa arma uma pindureta. Per aumento de cachacis, eu reclamis. In elementis mé pra quem é amistosis quis leo. Aenean aliquam molestie leo, vitae iaculis nislCopo furadis é disculpa de bebadis, arcu quam euismod magna. Eu nunca mais boto a boca num copo de cachaça, agora eu só uso canudis! Admodum accumsan disputationi eu sit. Vide electram sadipscing et per. Detraxit consequat et quo num tendi nada.",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    );
                  });
            },
          ),
          const Divider(),
          const SizedBox(height: 10),
          InkWell(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: const Row(
                children: [
                  Icon(Icons.info),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Configurações"),
                ],
              ),
            ),
            onTap: () {},
          ),
          const Divider(),
          const SizedBox(height: 10),
          InkWell(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: const Row(
                children: [
                  Icon(Icons.exit_to_app),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Sair"),
                ],
              ),
            ),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext bc) {
                    return AlertDialog(
                      actionsAlignment: MainAxisAlignment.spaceAround,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Não")),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()));
                            },
                            child: const Text("Sim"))
                      ],
                      title: const Text(
                        "Meu App",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      content: const Wrap(
                        children: [
                          Text("Você Sairá do aplicativo!"),
                          Text("Deseja sair Realmente do Aplicativo?"),
                        ],
                      ),
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}

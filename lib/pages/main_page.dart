import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/dados_cadastrais.dart';
import 'package:trilhaapp/pages/pagina1.dart';
import 'package:trilhaapp/pages/pagina2.dart';
import 'package:trilhaapp/pages/pagina3.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int posicaoPagina = 0;
  PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Page"),
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: const Text("Dados Cadastrais")),
                onTap: () {
                  Navigator.pop(context); // fechar drawer
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DadosPage()));
                },
              ),
              const Divider(),
              const SizedBox(height: 10),
              InkWell(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: const Text("Configurações"),
                ),
                onTap: () {},
              ),
              const Divider(),
              const SizedBox(height: 10),
              InkWell(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: const Text("Termos de uso e Privacidade"),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      body: PageView(
          onPageChanged: (value) {
            setState(() {
              posicaoPagina = value;
            });
          },
          controller: controller,
          scrollDirection: Axis.vertical,
          children: const [
            Pagina1Page(),
            Pagina2Page(),
            Pagina3Page(),
          ]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: posicaoPagina,
        onTap: (value) {
          controller.jumpToPage(value);
        },
        items: const [
          BottomNavigationBarItem(label: "home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "pag1", icon: Icon(Icons.add)),
          BottomNavigationBarItem(label: "pag2", icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}

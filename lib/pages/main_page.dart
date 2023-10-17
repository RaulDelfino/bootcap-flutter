import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/List_view_horizontal.dart';
import 'package:trilhaapp/pages/card_page.dart';
import 'package:trilhaapp/pages/image_assets.dart';
import 'package:trilhaapp/pages/List_vews.dart';
import 'package:trilhaapp/pages/tarefas_page/tarefa_page_hive.dart';
import 'package:trilhaapp/pages/tarefas_page/tarefa_page_sqlite.dart';
import 'package:trilhaapp/shared/widgets/custom_drawer.dart';

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
      drawer: const CustomDrawer(),
      body: PageView(
          onPageChanged: (value) {
            setState(() {
              posicaoPagina = value;
            });
          },
          controller: controller,
          scrollDirection: Axis.horizontal,
          children: const [
            Cardpage(),
            ImageAssets(),
            ListViewVPage(),
            ListViewHorizontal(),
            TarefaSqlitePage(),
          ]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: posicaoPagina,
        onTap: (value) {
          controller.jumpToPage(value);
        },
        items: const [
          BottomNavigationBarItem(label: "home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "pag1", icon: Icon(Icons.add)),
          BottomNavigationBarItem(label: "pag2", icon: Icon(Icons.person)),
          BottomNavigationBarItem(label: "pag3", icon: Icon(Icons.image)),
          BottomNavigationBarItem(label: "tarefas", icon: Icon(Icons.list)),
        ],
      ),
    );
  }
}

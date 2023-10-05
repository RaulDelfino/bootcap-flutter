import 'package:flutter/material.dart';
import 'package:trilhaapp/shared/app_images.dart';

class ListViewVPage extends StatefulWidget {
  const ListViewVPage({super.key});

  @override
  State<ListViewVPage> createState() => _ListViewVPageState();
}

class _ListViewVPageState extends State<ListViewVPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Image.asset(AppImages.user2),
          title: const Text("Usuario1"),
          subtitle: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Ola Tudo bem?"), Text("13:00")],
          ),
          trailing: PopupMenuButton<String>(
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem(value: 'Item1', child: Text("Item 1")),
              const PopupMenuDivider(),
              const PopupMenuItem(value: 'Item2', child: Text("Item 2")),
              const PopupMenuDivider(),
              const PopupMenuItem(value: 'Item3', child: Text("Item 3"))
            ],
            onSelected: (menu) {
              if (menu == menu) {
                print(menu);
              }
            },
          ),
          isThreeLine: true,
        ),
        Image.asset(AppImages.user1),
        Image.asset(AppImages.user2),
        Image.asset(AppImages.user3),
        Image.asset(AppImages.paisagem1),
        Image.asset(AppImages.paisagem2),
        Image.asset(AppImages.paisagem3),
      ],
    );
  }
}

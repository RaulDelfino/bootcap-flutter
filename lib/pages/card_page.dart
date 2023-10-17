import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/card_detail_page.dart';
import 'package:trilhaapp/model/card_detail.dart';
import 'package:trilhaapp/repositores/card_detail_repository.dart';

class Cardpage extends StatefulWidget {
  const Cardpage({super.key});

  @override
  State<Cardpage> createState() => _CardpageState();
}

class _CardpageState extends State<Cardpage> {
  CardDetail? cardDetail;
  CardDetailRepository cardDetailRepository = CardDetailRepository();

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {

    cardDetail = await cardDetailRepository.get();
        setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: cardDetail == null
                ? const LinearProgressIndicator()
                : InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CardDetailPage(
                                    cardDetail: cardDetail!,
                                  )));
                    },
                    child: Hero(
                      tag: cardDetail!.id,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 8,
                        shadowColor: Colors.grey,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                Image.network(
                                  cardDetail!.url,
                                  height: 20,
                                ),
                                Text(
                                  cardDetail!.title,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                              ]),
                              const SizedBox(height: 10),
                              Text(
                                cardDetail!.text,
                                style: TextStyle(fontSize: 16),
                                textAlign: TextAlign.justify,
                              ),
                              Container(
                                  width: double.infinity,
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Ler Mais",
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline),
                                      )))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

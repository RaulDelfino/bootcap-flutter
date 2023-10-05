import 'package:trilhaapp/pages/model/card_detail.dart';

class CardDetailRepository {
  Future<CardDetail>  get() async {
    await Future.delayed(const Duration(microseconds: 20));

    return CardDetail(
        "Meu Card",
        "https://hermes.digitalinnovation.one/assets/diome/logo.png",
        "Mussum Ipsum, cacilds vidis litro abertis. Casamentiss faiz malandris se pirulitá. Não sou faixa preta cumpadi, sou preto inteiris, inteiris. Segunda-feiris nun dá, eu vô me pirulitá! In elementis mé pra quem é amistosis quis leo.",
        1);
  }
}

import 'package:hive/hive.dart';
import 'package:trilhaapp/model/configuracaos_model.dart';

class ConfiguracaoRepository {
  late Box _box;

  ConfiguracaoRepository._criar();

  static Future<ConfiguracaoRepository> carregar() async {
    final repository = ConfiguracaoRepository._criar();
    if (Hive.isBoxOpen("configuracoes")) {
      repository._box = Hive.box("configuracoes");
    } else {
      repository._box = await Hive.openBox("configuracoes");
    }
    return repository;
  }

  void salvar(ConfiguracoesModel configuracoesModel) {
    _box.put("configuracoesModel", {
      "nomeUsuario": configuracoesModel.nomeUsuario,
      "altura": configuracoesModel.altura,
      "receberNotificacao": configuracoesModel.receberNotificacao,
      "temaEscuro": configuracoesModel.temaEscuro,
    });
  }

  ConfiguracoesModel obterDados() {
    var configuracoes = _box.get("configuracoesModel");
    if (configuracoes == null) {
      return ConfiguracoesModel.vazio();
    }
    return ConfiguracoesModel(
        configuracoes["nomeUsuario"],
        configuracoes["altura"],
        configuracoes["receberNotificacao"],
        configuracoes["temaEscuro"]);
  }
}







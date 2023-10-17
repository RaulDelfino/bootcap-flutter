import 'package:hive/hive.dart';
import 'package:trilhaapp/model/dados_cadastrais_model.dart';

class DadosCadastraisRepository {
  late Box _box;

  DadosCadastraisRepository._criar();

  static Future<DadosCadastraisRepository> carregar() async {
    final repository = DadosCadastraisRepository._criar();
    if (Hive.isBoxOpen("DadosCadastraisModel")) {
      repository._box = Hive.box("DadosCadastraisModel");
    } else {
      repository._box = await Hive.openBox("DadosCadastraisModel");
    }
    return repository;
  }

  salvar(DadosCadastraisModels dadosCadastraisModels) {
    _box.put("DadosCadastraisModels", dadosCadastraisModels);
  }

  DadosCadastraisModels obterDados() {
    var dadosCadastraisModels = _box.get("DadosCadastraisModels");
    if (dadosCadastraisModels == null) {
      return DadosCadastraisModels.vazio();
    }
    return dadosCadastraisModels;
  }
}

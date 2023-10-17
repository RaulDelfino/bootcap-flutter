import 'package:hive/hive.dart';
import 'package:trilhaapp/model/tafera_model_hive.dart';

class TarefaHiveRepository {
  late Box _box;

  TarefaHiveRepository._criar();

  static Future<TarefaHiveRepository> carregar() async {
    final repository = TarefaHiveRepository._criar();
    if (Hive.isBoxOpen("TarefaModelHive")) {
      repository._box = Hive.box("TarefaModelHive");
    } else {
      repository._box = await Hive.openBox("TarefaModelHive");
    }
    return repository;
  }

  salvar(TarefaModelHive tarefaModelHive) {
    _box.add(tarefaModelHive);
  }

  List<TarefaModelHive> obterDados(bool naoConcluido){
    if(naoConcluido){
      return _box.values.cast<TarefaModelHive>().where((element) => !element.concluido).toList();
    }
    return _box.values.cast<TarefaModelHive>().toList();
  }

  alterar(TarefaModelHive tarefaModelHive) {
    tarefaModelHive.save();
  }

  excluir(TarefaModelHive tarefaModelHive) {
    tarefaModelHive.delete();
  }
}

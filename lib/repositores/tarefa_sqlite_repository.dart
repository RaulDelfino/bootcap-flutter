import 'package:trilhaapp/model/tarefa_model_sqlite.dart';
import 'package:trilhaapp/sqlite/database.dart';

class TarefaSqliteRepository {
  Future<List<TarefaSqliteModel>> obterDados(bool apenasNaoConcluidos) async {
    List<TarefaSqliteModel> tarefas = [];
    var db = await SqliteDataBase().obterDatabase();
    var result = await db.rawQuery(apenasNaoConcluidos
        ? "SELECT id, descricao, concluido FROM tarefas WHERE concluido = 0"
        : "SELECT id, descricao, concluido FROM tarefas");

    for (var element in result) {
      tarefas.add(TarefaSqliteModel(int.parse(element["id"].toString()),
          element["descricao"].toString(), element["concluido"] == 1));
    }

    return tarefas;
  }

  Future<void> salvar(TarefaSqliteModel tarefaSqliteModel) async {
    var db = await SqliteDataBase().obterDatabase();
    db.rawInsert('INSERT INTO tarefas (descricao , concluido) values(?,?)', [
      tarefaSqliteModel.descricao,
      tarefaSqliteModel.concluido,
    ]);
  }

  Future<void> atualizar(TarefaSqliteModel tarefaSqliteModel) async {
    var db = await SqliteDataBase().obterDatabase();
    db.rawInsert(
        'UPDATE tarefas SET descricao = ? , concluido = ? WHERE id = ?', [
      tarefaSqliteModel.descricao,
      tarefaSqliteModel.concluido,
      tarefaSqliteModel.id
    ]);
  }

  Future<void> remover(int id) async {
    var db = await SqliteDataBase().obterDatabase();
    db.rawInsert('DELETE FROM tarefas WHERE id = ?', [id]);
  }
}

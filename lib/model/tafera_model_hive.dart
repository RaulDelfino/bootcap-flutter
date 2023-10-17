import 'package:hive/hive.dart';
// flutter pub run build_runner build
part "tafera_model_hive.g.dart";

@HiveType(typeId: 1)
class TarefaModelHive extends HiveObject {
  @HiveField(0)
  String descricao = "";

  @HiveField(1)
  bool concluido = false;

  TarefaModelHive();

  TarefaModelHive.criar(this.descricao, this.concluido);
}

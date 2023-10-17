import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:trilhaapp/model/dados_cadastrais_model.dart';
import 'package:trilhaapp/model/tafera_model_hive.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var documentsDiretory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(documentsDiretory.path);
  Hive.registerAdapter(DadosCadastraisModelsAdapter());
  Hive.registerAdapter(TarefaModelHiveAdapter());
  runApp(const MyApp());
}

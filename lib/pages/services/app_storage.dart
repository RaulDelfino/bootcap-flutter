import 'package:shared_preferences/shared_preferences.dart';

enum STORAGE_CHAVES {
  CHAVE_Dados_NOME,
  CHAVE_Dados_Nascimento,
  CHAVE_Dados_NIVEL_EXPERIENCIA,
  CHAVE_Dados_LINGUAGENS,
  CHAVE_Dados_TEMPO_EXPERIENCIA,
  CHAVE_Dados_SALARIO,
  CHAVE_NOME_USUARIO,
  CHAVE_ALTURA,
  CHAVE_NOTIFICACAO,
  CHAVE_TEMA,
  CHAVE_NUMERO_ALEATORIO,
  CHAVE_quantidadeClicks,

}

class AppStorage {
  Future<void> setNumeroAleatorio(int numero) async {
    _setInt(STORAGE_CHAVES.CHAVE_NUMERO_ALEATORIO.toString(), numero);
  }

  Future<int> getNumeroAleatorio() async {
    return _getInt(STORAGE_CHAVES.CHAVE_NUMERO_ALEATORIO.toString());
  }

  Future<void> setNumeroDeClicks(int numero) async {
    _setInt(STORAGE_CHAVES.CHAVE_quantidadeClicks.toString(), numero);
  }

  Future<int> getNumeroDeClicks() async {
    return _getInt(STORAGE_CHAVES.CHAVE_quantidadeClicks.toString());
  }

  
  Future<void> setConfigNomeUsuario(String nome) async {
    _setString(STORAGE_CHAVES.CHAVE_NOME_USUARIO.toString(), nome);
  }

  Future<String> getConfigNomeUsuario() async {
    return _getString(STORAGE_CHAVES.CHAVE_NOME_USUARIO.toString());
  }

    
  Future<void> setConfigAlturaUsuario(double altura) async {
    _setDouble(STORAGE_CHAVES.CHAVE_ALTURA.toString(), altura);
  }

  Future<double> getConfigAlturaUsuario() async {
    return _getDouble(STORAGE_CHAVES.CHAVE_ALTURA.toString());
  }
  
  Future<void> setConfigNotificacao(bool value) async {
    _setBool(STORAGE_CHAVES.CHAVE_NOTIFICACAO.toString(), value);
  }

  Future<bool> getConfigNotificacao() async {
    return _getBool(STORAGE_CHAVES.CHAVE_NOTIFICACAO.toString());
  }

  Future<void> setConfigTemaEscuro(bool value) async {
    _setBool(STORAGE_CHAVES.CHAVE_TEMA.toString(), value);
  }

  Future<bool> getConfigTemaEscuro() async {
    return _getBool(STORAGE_CHAVES.CHAVE_TEMA.toString());
  }

  Future<void> setDadosCadastraisNome(String nome) async {
    _setString(STORAGE_CHAVES.CHAVE_Dados_NOME.toString(), nome);
  }

  Future<String> getDadosCadastraisNome() async {
    return _getString(STORAGE_CHAVES.CHAVE_Dados_NOME.toString());
  }

  Future<void> setDadosCadastraisDataNascimento(DateTime data) async {
    _setString(
        STORAGE_CHAVES.CHAVE_Dados_Nascimento.toString(), data.toString());
  }

  Future<String> getDadosCadastraisDataNascimento() async {
    return _getString(STORAGE_CHAVES.CHAVE_Dados_Nascimento.toString());
  }

  Future<void> setDadosCadastraisTempoExperiencia(int tempo) async {
    _setInt(STORAGE_CHAVES.CHAVE_Dados_TEMPO_EXPERIENCIA.toString(), tempo);
  }

  Future<int> getDadosCadastraisTempoExperiencia() async {
    return _getInt(STORAGE_CHAVES.CHAVE_Dados_TEMPO_EXPERIENCIA.toString());
  }

  Future<String> getDadosCadastraisNivelExperiencia() async {
    return _getString(STORAGE_CHAVES.CHAVE_Dados_NIVEL_EXPERIENCIA.toString());
  }

  Future<void> setDadosCadastraisLinguagens(List<String> linguagens) async {
    _setStringList(
        STORAGE_CHAVES.CHAVE_Dados_LINGUAGENS.toString(), linguagens);
  }

  Future<List<String>> getDadosCadastraisLinguagens() async {
    return _getStringList(STORAGE_CHAVES.CHAVE_Dados_LINGUAGENS.toString());
  }

  Future<void> setDadosCadastraisNivelExperiencia(String value) async {
    _setString(STORAGE_CHAVES.CHAVE_Dados_NIVEL_EXPERIENCIA.toString(), value);
  }

  Future<void> setDadosCadastraisSalario(double value) async {
    _setDouble(STORAGE_CHAVES.CHAVE_Dados_SALARIO.toString(), value);
  }

  Future<double> getDadosCadastraisSalario() async {
    return _getDouble(STORAGE_CHAVES.CHAVE_Dados_NIVEL_EXPERIENCIA.toString());
  }

  _setString(String chave, String value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setString(chave, value);
  }

  _setStringList(String chave, List<String> values) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setStringList(chave, values);
  }

  _setInt(String chave, int value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setInt(chave, value);
  }

  _setDouble(String chave, double value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setDouble(chave, value);
  }

  _setBool(String chave, bool value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setBool(chave, value);
  }


  Future<double> _getDouble(String chave) async {
    var storage = await SharedPreferences.getInstance();
    var value = storage.get(chave);
    if (value is double) {
      return value;
    } else if (value is String) {
      try {
        return double.parse(value);
      } catch (e) {
        return 0;
      }
    } else {
      return 0;
    }
  }

  Future<String> _getString(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getString(chave) ?? "";
  }

  Future<List<String>> _getStringList(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getStringList(chave) ?? [];
  }

  Future<int> _getInt(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getInt(chave) ?? 0;
  }
  Future<bool> _getBool(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getBool(chave)?? false;
  }


}

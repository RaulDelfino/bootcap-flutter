class ConfiguracoesModel {
  String _nomeUsuario = "";
  double _altura = 0;
  bool _receberNotificacao = false;
  bool _temaEscuro = false;

  ConfiguracoesModel.vazio() {
    _nomeUsuario = "";
    _altura = 0;
    _receberNotificacao = false;
    _temaEscuro = false;
  }

  ConfiguracoesModel(this._nomeUsuario, this._altura, this._receberNotificacao,
      this._temaEscuro);

  String get nomeUsuario => _nomeUsuario;
  set nomeUsuario(String nomeUsuario) {
    _nomeUsuario = nomeUsuario;
  }

  double get altura => _altura;
  set altura(double altura) {
    _altura = altura;
  }

  bool get receberNotificacao => _receberNotificacao;
  set receberNotificacao(bool receberNotificacao) {
    _receberNotificacao= receberNotificacao;
  }

  bool get temaEscuro => _temaEscuro;
  set temaEscuro(bool temaEscuro) {
    _temaEscuro= temaEscuro;
  }

  


}

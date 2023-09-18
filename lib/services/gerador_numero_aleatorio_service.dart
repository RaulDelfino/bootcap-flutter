import 'dart:math';

class GeradorNumeroAleatorioService{
    static int gerarNumeroAleatorio(int intervalo) {
    Random numeroAleatorio = Random();
    return numeroAleatorio.nextInt(intervalo);
  } // Static não precisa instanciar
}
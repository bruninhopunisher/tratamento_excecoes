import 'dart:io';

import 'package:tratamento_excecoes/exception/nome_invalido_exception.dart';
import 'package:tratamento_excecoes/models/aluno.dart';
import 'package:tratamento_excecoes/models/console_utils.dart';

  void execute () {

    stdout.write("\nBem vindo ao sistema de notas\n");

    String nome = ConsoleUltils.lerStringComTexto("Digite o nome do aluno: ");
    var aluno = Aluno(nome);
    double? nota;

    try {
      if (nome.trim() == "") {
        throw NomeInvalidoException();
      }
    } catch (nomeInvalidoException) {
      nome = "Nome padrão";
      print(nomeInvalidoException);
      exit(0);
    }

    do {
      nota = ConsoleUltils.lerDoubleComTexto("Digite a nota ou S para sair");
      if (nota != null) {
        aluno.adicionarNota(nota);
      }
    }
    while (nota != null);
    print(aluno.getNotas());
    print("As notas digitadas foram: ${aluno.getNotas()}");
    print("A média do aluno foi: ${aluno.retornaMedia()}");

    if (aluno.aprovado(7)) {
      print("O aluno ${aluno.getNome()} aprovado");
    } else {
      print("O aluno ${aluno.getNome()} reprovado");
    }

}

import 'dart:io';

// Classe que representa uma Nota
class Nota {
  double valor;

  Nota(this.valor);

  // Valida se a nota está entre 0 e 10
  bool isValida() {
    return valor >= 0 && valor <= 10;
  }
}

// Classe que representa um Aluno
class Aluno {
  String nome;
  List<Nota> notas = [];
  double media = 0.0;
  String classificacao = '';

  Aluno(this.nome);

  // Calcula a média do aluno
  void calcularMedia() {
    double soma = 0.0;
    for (var nota in notas) {
      soma += nota.valor;
    }
    media = soma / notas.length;
  }

  // Classifica o aluno com base na média
  void classificarAluno() {
    if (media >= 7.0) {
      classificacao = 'Aprovado';
    } else if (media >= 5.0) {
      classificacao = 'Recuperação';
    } else {
      classificacao = 'Reprovado';
    }
  }

  // Exibe os dados do aluno
  void exibirDados() {
    print('Nome: $nome');
    print('Notas: ${notas.map((n) => n.valor.toStringAsFixed(2)).join(', ')}');
    print('Média: ${media.toStringAsFixed(2)}');
    print('Classificação: $classificacao\n');
  }
}

void main() {
  List<Aluno> alunos = [];

  while (true) {
    // Coletando as informações do aluno
    print('Informe o nome do aluno:');
    String nome = stdin.readLineSync() ?? '';

    Aluno aluno = Aluno(nome);

    // Coletando as 3 notas do aluno
    for (int i = 1; i <= 3; i++) {
      double notaValor;
      while (true) {
        print('Digite a nota $i de $nome:');
        try {
          notaValor = double.parse(stdin.readLineSync() ?? '');
          Nota nota = Nota(notaValor);
          // Verificando se a nota é válida
          if (nota.isValida()) {
            aluno.notas.add(nota);
            break; // Sai do loop quando a nota é válida
          } else {
            print('Nota inválida. A nota deve estar entre 0 e 10.');
          }
        } catch (e) {
          print('Entrada inválida. Por favor, insira um número válido.');
        }
      }
    }

    // Calculando a média e classificando o aluno
    aluno.calcularMedia();
    aluno.classificarAluno();

    // Adicionando o aluno à lista
    alunos.add(aluno);

    // Perguntando se o usuário quer adicionar mais alunos
    print('Adicionar mais alunos? (s/n):');
    String resposta = stdin.readLineSync() ?? '';
    if (resposta.toLowerCase() != 's') {
      break;
    }
  }

  // Exibindo o relatório final
  print('\nRelatório Final:\n');
  for (var aluno in alunos) {
    aluno.exibirDados();
  }
}

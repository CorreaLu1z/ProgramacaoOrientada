import 'dart:io';

void main() {
  // Lista para armazenar os dados dos alunos
  List<Map<String, dynamic>> alunos = [];

  while (true) {
    // Coletando as informações do aluno
    print('Informe o nome do aluno:');
    String nome = stdin.readLineSync() ?? '';

    List<double> notas = [];
    for (int i = 1; i <= 3; i++) {
      double nota;
      while (true) {
        print('Digite a nota $i de $nome:');
        try {
          nota = double.parse(stdin.readLineSync() ?? '');
          if (nota >= 0 && nota <= 10) {
            break;
          } else {
            print('Nota inválida. A nota deve estar entre 0 e 10.');
          }
        } catch (e) {
          print('Entrada inválida. Por favor, insira um número válido.');
        }
      }
      notas.add(nota);
    }

    // Calculando a média do aluno
    double media = (notas[0] + notas[1] + notas[2]) / 3;

    // Classificando o aluno
    String classificacao;
    if (media >= 7.0) {
      classificacao = 'Aprovado';
    } else if (media >= 5.0) {
      classificacao = 'Recuperação';
    } else {
      classificacao = 'Reprovado';
    }

    // Armazenando os dados do aluno
    alunos.add({
      'nome': nome,
      'notas': notas,
      'media': media,
      'classificacao': classificacao,
    });

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
    print('Nome: ${aluno['nome']}');
    print('Notas: ${aluno['notas'][0]}, ${aluno['notas'][1]}, ${aluno['notas'][2]}');
    print('Média: ${aluno['media'].toStringAsFixed(2)}');
    print('Classificação: ${aluno['classificacao']}\n');
  }
}

import 'dart:io';
import 'dart:math';

//1. Dados comuns: 3 dados comuns, de 6 lados
int dadosComuns(Random gerador) {
  // Dados comuns
  var dado1 = gerador.nextInt(6) + 1;
  var dado2 = gerador.nextInt(6) + 1;
  var dado3 = gerador.nextInt(6) + 1;

  // Soma dos valores dos dados comuns
  var somaDados = dado1 + dado2 + dado3;
  return somaDados;
}

//2. Dado magico
double dadoMagico(Random gerador) {
  // Dado magico gera o valor 0 ou 1
  var dadoMagico = gerador.nextInt(2);
  double somaDados = 0;

  // Condicional do dado magico
  if (dadoMagico == 1) {
    somaDados = somaDados * 2;
  } else if (dadoMagico == 0) {
    somaDados = somaDados / 2;
  }
  return somaDados;
}

//3. Jogo de dados
void main() {
  var gerador = Random();
  int opcao;
  String nomeUsuario;
  int soma;

  // Exibir menu de opções
  stdout.writeln('Digite seu nome:');
  nomeUsuario = stdin.readLineSync()!;
  stdout.writeln('Menu de opções\n0 - Sair\n1 a 50 - Numero de rodadas\n');
  stdout.writeln(
      'Limitamos o numero de rodadas em 50 para não ficar muito exaustivo\n');
  stdout.writeln('Digite o numero de rodadas que deseja jogar:');
  opcao = int.tryParse(stdin.readLineSync()!) ?? 0;

  if (opcao == 0) {
    print('Saindo...');
    print('Tchau!');
    return;
  } else if (opcao > 50 || opcao < 1) {
    print('Numero de rodadas invalido, valor deve estar entre 1 e 50');
    return;
  }
  print('Numero de rodadas: $opcao');

  // Iniciar jogo com número de rodadas escolhido pelo usuário
  int usuario = 0;
  int placarUsuario = 0;
  int computador = 0;
  int placarComputador = 0;
  int placarEmpate = 0;
  //inicio da rodada usuario x computador
  for (int i = 0; i < opcao; i++) {
    print('\n------------------------------------------------------');
    print('|       \t\tRodada ${i + 1}\t\t     |');
    print('------------------------------------------------------');
    // Vez do usuário
    usuario = dadosComuns(gerador);
    print('Soma dos dados de $nomeUsuario: $usuario');
    // Vez do computador
    computador = dadosComuns(gerador);
    print('Soma dos dados do computador: $computador');
    if (usuario > computador) {
      print('$nomeUsuario venceu!');
      placarUsuario++;
    } else if (usuario < computador) {
      print('Computador venceu!');
      placarComputador++;
    } else if (usuario == computador) {
      print('Empate');
      placarEmpate++;
    }
    print(
        '\nPlacar da Rodada:\n$nomeUsuario: $placarUsuario \tComputador: $placarComputador \tEmpates: $placarEmpate');
  }
  // Exibir placar final
  print('\n\n*************************************************');
  print(
      '*  Placar final: \t\t\t\t*\n*  $nomeUsuario: $placarUsuario \tComputador: $placarComputador \tEmpates: $placarEmpate      *');
  print('*************************************************');

  // Exibir vencedor
  if (placarUsuario > placarComputador) {
    print('$nomeUsuario venceu!  ( • ᴗ • )');
  } else if (placarUsuario < placarComputador) {
    print('Computador venceu!  (╥﹏╥)');
  } else if (placarUsuario < placarEmpate ||
      placarComputador < placarEmpate ||
      placarUsuario == placarComputador) {
    print('Empate  ¯|_( •︠ ⏥ ︡•)_/¯');
  }
  print('Fim de jogo!\n');
}

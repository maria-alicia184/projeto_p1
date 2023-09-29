import 'dart:io';
import 'dart:math';

// 1. Dados comuns: 3 dados comuns, de 6 lados
int dadosComuns(Random gerador) {
  var dado1 = gerador.nextInt(6) + 1;
  var dado2 = gerador.nextInt(6) + 1;
  var dado3 = gerador.nextInt(6) + 1;

  // Soma dos valores dos dados comuns
  var somaDados = dado1 + dado2 + dado3;
  return somaDados;
}

// 2. Dado magico
double dadoMagico(Random gerador) {
  // Dado mágico gera o valor 0 ou 1
  var dadoMagico = gerador.nextInt(2);
  double multiplicador = 1.0; // Valor padrão do multiplicador

  // Condicional do dado mágico
  if (dadoMagico == 1) {
    multiplicador = 2.0;
  } else if (dadoMagico == 0) {
    multiplicador = 0.5;
  }
  return multiplicador;
}

// 3. Jogo de dados
void main() {
  var gerador = Random();
  int opcao;
  String nomeUsuario;
  int opcDadoMagico;

  // Exibir menu de opções
  stdout.writeln('Digite seu nome:');
  nomeUsuario = stdin.readLineSync()!;
  stdout.writeln('Digite um numero do menu de opções:');
  stdout.writeln('Menu de opções\n0 - Sair\n1 a 50 - Numero de rodadas\n');
  opcao = int.tryParse(stdin.readLineSync()!) ?? 0;
  if (opcao == 0) {
    print('Saindo...');
    print('Tchau!');
    return;
  } else if (opcao > 50 || opcao < 1) {
    print('Numero de rodadas invalido, valor deve estar entre 1 e 50');
    return;
  }

  // Iniciar jogo com número de rodadas escolhido pelo usuário
  print('Numero de rodadas: $opcao');
  int usuario = 0;
  int placarUsuario = 0;
  int computador = 0;
  int placarComputador = 0;
  int placarEmpate = 0;
  // Início da rodada usuario x computador
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
  //Ao fim das rodadas, perguntar se o usuário deseja usar o dado mágico
  stdout.writeln('\nDeseja usar o dado mágico? \n0 - Não \n1 - Sim');
  opcDadoMagico = int.tryParse(stdin.readLineSync()!) ?? 0;
  if (opcDadoMagico == 0) {
    print('\nVocê não usou o dado mágico!');
  } else if (opcDadoMagico == 1) {
    print('\nVocê usou o dado mágico!');
    double multiplicador = dadoMagico(gerador);
    int placarMultiplicado = (placarUsuario * multiplicador).toInt();
    print('Placar usuário: $placarUsuario');
    print('Multiplicador: $multiplicador');
    placarUsuario = placarMultiplicado;
  } else {
    print('Opção inválida!');
    return;
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

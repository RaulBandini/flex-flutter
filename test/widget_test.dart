import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:receitas_tops/main.dart';

void main() {
  testWidgets('exibe a página inicial de receitas', (WidgetTester tester) async {
    await tester.pumpWidget(const ReceitasTopsApp());

    expect(find.text('Receitas Tops'), findsOneWidget);
    expect(find.text('O que vamos cozinhar hoje?'), findsOneWidget);
    expect(find.text('Receita em destaque'), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
  });

  testWidgets('recusa consulta vazia ou com espaços', (WidgetTester tester) async {
    await tester.pumpWidget(const ReceitasTopsApp());

    await tester.tap(find.text('Pesquisar'));
    await tester.pumpAndSettle();

    expect(
      find.text('Digite o nome de uma receita para pesquisar.'),
      findsOneWidget,
    );
    expect(find.textContaining('Pesquisa recebida:'), findsNothing);

    await tester.enterText(
      find.byKey(const ValueKey('campo-busca-receita')),
      '   ',
    );
    await tester.tap(find.text('Pesquisar'));
    await tester.pumpAndSettle();

    expect(
      find.text('Digite o nome de uma receita para pesquisar.'),
      findsOneWidget,
    );
    expect(find.textContaining('Pesquisa recebida:'), findsNothing);
  });

  testWidgets('pesquisa pelo termo válido e permite repetir', (WidgetTester tester) async {
    await tester.pumpWidget(const ReceitasTopsApp());

    final campoBusca = find.byKey(const ValueKey('campo-busca-receita'));
    await tester.enterText(campoBusca, '  bolo de cenoura  ');
    await tester.tap(find.text('Pesquisar'));
    await tester.pumpAndSettle();

    expect(find.text('Pesquisa recebida: “bolo de cenoura”'), findsOneWidget);
    expect(find.text('Os resultados ainda são provisórios.'), findsOneWidget);

    await tester.enterText(campoBusca, '  pão de queijo ');
    await tester.tap(find.text('Pesquisar'));
    await tester.pumpAndSettle();

    expect(find.text('Pesquisa recebida: “pão de queijo”'), findsOneWidget);
    expect(find.text('Pesquisa recebida: “bolo de cenoura”'), findsNothing);
  });
}

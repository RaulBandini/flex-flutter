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
}

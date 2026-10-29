import 'package:flutter/material.dart';

void main() {
  runApp(const ReceitasTopsApp());
}

class ReceitasTopsApp extends StatelessWidget {
  const ReceitasTopsApp({super.key});

  @override
  Widget build(BuildContext context) {
    const verdeEscuro = Color(0xFF315C45);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Receitas Tops',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: verdeEscuro,
          surface: const Color(0xFFFFFBF5),
        ),
        scaffoldBackgroundColor: const Color(0xFFFFFBF5),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFFFBF5),
          foregroundColor: Color(0xFF26352B),
          elevation: 0,
        ),
        useMaterial3: true,
      ),
      home: const PaginaInicial(),
    );
  }
}

class PaginaInicial extends StatelessWidget {
  const PaginaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    const verdeEscuro = Color(0xFF315C45);
    const textoEscuro = Color(0xFF26352B);
    const textoSuave = Color(0xFF777D75);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Receitas Tops',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            tooltip: 'Buscar receitas',
            icon: const Icon(Icons.search),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Oi, chef! 👋',
              style: TextStyle(
                color: textoSuave,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'O que vamos cozinhar hoje?',
              style: TextStyle(
                color: textoEscuro,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 22),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFE9F0E7),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Receita em destaque',
                          style: TextStyle(
                            color: verdeEscuro,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Macarrão cremoso\nde uma panela só',
                          style: TextStyle(
                            color: textoEscuro,
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            height: 1.25,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Row(
                          children: [
                            Icon(Icons.schedule, size: 16, color: verdeEscuro),
                            SizedBox(width: 5),
                            Text(
                              '20 min',
                              style: TextStyle(color: verdeEscuro, fontSize: 13),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Icon(
                    Icons.dinner_dining,
                    color: verdeEscuro,
                    size: 76,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 26),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categorias',
                  style: TextStyle(
                    color: textoEscuro,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Ver todas',
                  style: TextStyle(
                    color: verdeEscuro,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: const [
                _CategoriaCard(
                  icone: Icons.ramen_dining,
                  titulo: 'Massas',
                  cor: Color(0xFFFFE9D5),
                ),
                SizedBox(width: 10),
                _CategoriaCard(
                  icone: Icons.eco,
                  titulo: 'Leves',
                  cor: Color(0xFFE5EFDF),
                ),
                SizedBox(width: 10),
                _CategoriaCard(
                  icone: Icons.cake_outlined,
                  titulo: 'Doces',
                  cor: Color(0xFFF7E4E5),
                ),
              ],
            ),
            const SizedBox(height: 26),
            const Text(
              'Fáceis para o dia a dia',
              style: TextStyle(
                color: textoEscuro,
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 14),
            const _ReceitaItem(
              icone: Icons.lunch_dining,
              titulo: 'Panqueca caseira',
              descricao: 'Simples, fofinha e deliciosa',
              tempo: '25 min',
              cor: Color(0xFFFFE9D5),
            ),
            const SizedBox(height: 12),
            const _ReceitaItem(
              icone: Icons.soup_kitchen,
              titulo: 'Sopa de legumes',
              descricao: 'Leve e cheia de sabor',
              tempo: '35 min',
              cor: Color(0xFFE5EFDF),
            ),
            const SizedBox(height: 12),
            const _ReceitaItem(
              icone: Icons.breakfast_dining,
              titulo: 'Bolo de chocolate',
              descricao: 'Um clássico para compartilhar',
              tempo: '45 min',
              cor: Color(0xFFF7E4E5),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoriaCard extends StatelessWidget {
  const _CategoriaCard({
    required this.icone,
    required this.titulo,
    required this.cor,
  });

  final IconData icone;
  final String titulo;
  final Color cor;

  @override
  Widget build(BuildContext context) {
    const verdeEscuro = Color(0xFF315C45);

    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 6),
        decoration: BoxDecoration(
          color: cor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Icon(icone, color: verdeEscuro, size: 25),
            const SizedBox(height: 7),
            Text(
              titulo,
              style: const TextStyle(
                color: verdeEscuro,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReceitaItem extends StatelessWidget {
  const _ReceitaItem({
    required this.icone,
    required this.titulo,
    required this.descricao,
    required this.tempo,
    required this.cor,
  });

  final IconData icone;
  final String titulo;
  final String descricao;
  final String tempo;
  final Color cor;

  @override
  Widget build(BuildContext context) {
    const textoEscuro = Color(0xFF26352B);
    const textoSuave = Color(0xFF777D75);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFF0EEE8)),
      ),
      child: Row(
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: cor,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icone, color: const Color(0xFF315C45), size: 29),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: const TextStyle(
                    color: textoEscuro,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  descricao,
                  style: const TextStyle(color: textoSuave, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Column(
            children: [
              const Icon(Icons.schedule, color: textoSuave, size: 16),
              const SizedBox(height: 4),
              Text(
                tempo,
                style: const TextStyle(color: textoSuave, fontSize: 11),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

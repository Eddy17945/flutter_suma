import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Suma de Dos Números',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const SumScreen(),
    );
  }
}

class SumScreen extends StatefulWidget {
  const SumScreen({super.key});

  @override
  State<SumScreen> createState() => _SumScreenState();
}

class _SumScreenState extends State<SumScreen> {
  final TextEditingController _numero1Controller = TextEditingController();
  final TextEditingController _numero2Controller = TextEditingController();
  String _resultado = '';

  void _calcularSuma() {
    final num1 = double.tryParse(_numero1Controller.text) ?? 0;
    final num2 = double.tryParse(_numero2Controller.text) ?? 0;
    final suma = num1 + num2;
    
    setState(() {
      _resultado = 'Resultado: $suma';
    });
  }

  void _limpiar() {
    _numero1Controller.clear();
    _numero2Controller.clear();
    setState(() {
      _resultado = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Suma de Dos Números'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _numero1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Primer número',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _numero2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Segundo número',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _calcularSuma,
                  child: const Text('Sumar'),
                ),
                ElevatedButton(
                  onPressed: _limpiar,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                  ),
                  child: const Text('Limpiar'),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              _resultado,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _numero1Controller.dispose();
    _numero2Controller.dispose();
    super.dispose();
  }
}
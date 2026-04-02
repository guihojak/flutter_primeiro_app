import 'package:flutter/material.dart';

class AlinhamentoHorizontal extends StatelessWidget {
  const AlinhamentoHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Texto Exemplo'),
            SizedBox(width: 20.00),
            Text('Texto Exemplo 2'),
            SizedBox(width: 20.00,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => MinhaPrimeiraPage())
          )
        },
        child: Icons(Icons.add)
      ),
    )
  }
}
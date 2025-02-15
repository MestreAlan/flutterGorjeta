import 'package:flutter/material.dart';

void main() {
  runApp(CalculaGorjetaApp());
}

class CalculaGorjetaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calcula Gorjeta',
      theme: ThemeData(
        primaryColor: Color(0xFF4A6B3D),
        scaffoldBackgroundColor: Color(0xFFADD8E6),
        appBarTheme: AppBarTheme(backgroundColor: Color(0xFF4A6B3D)),
        textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.black)),
      ),
      home: CalculaGorjetaPage(),
    );
  }
}

class CalculaGorjetaPage extends StatefulWidget {
  @override
  _CalculaGorjetaPageState createState() => _CalculaGorjetaPageState();
}

class _CalculaGorjetaPageState extends State<CalculaGorjetaPage> {
  final TextEditingController _controller = TextEditingController();
  double _gorjeta = 0.0;

  void _calcularGorjeta() {
    setState(() {
      double valorCompra = double.tryParse(_controller.text) ?? 0.0;
      _gorjeta = (valorCompra * 0.10) + valorCompra;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calcula Gorjeta')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/avatar.png'),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Digite o valor da compra',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calcularGorjeta,
                child: Text('Calcular Gorjeta'),
              ),
              SizedBox(height: 20),
              Text(
                'R\$ ${_gorjeta.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

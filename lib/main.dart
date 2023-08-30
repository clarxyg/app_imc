import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 14, 16, 145)),
        useMaterial3: true
      ),
      home: const MyHomePage(title: 'Calculadora de IMC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controllerPeso = TextEditingController();
  TextEditingController controllerAltura = TextEditingController();
  String resultadoIMC = '';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
    
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
       
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Informe os seus dados',
                style: TextStyle(fontSize: 20),
              ),
             const SizedBox(height: 16),
             TextFormField(
              keyboardType: const TextInputType.numberWithOptions(),
              controller: controllerAltura,
              decoration: const InputDecoration(
              labelText: 'Altura *',
              hintText: 'Digite a sua altura',
              border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0))
              ),
              ),
             ),
             const SizedBox(height: 16),
             TextFormField(
              keyboardType: const TextInputType.numberWithOptions(),
              controller: controllerPeso,
              decoration: const InputDecoration(
              labelText: 'Peso *',
              hintText: 'Digite o seu peso',
              border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0))
              ),
              ),
             ),
             const SizedBox(height: 16),
             Text(resultadoIMC, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
             const SizedBox(height: 16),
             SizedBox(
               width: 350,
               child: ElevatedButton(
                  style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Theme.of(context).colorScheme.primary.withOpacity(0.1);
                      }
                      return null;
                    },
                   )
                  ),
               onPressed: () {
                 setState(() {
                   num numAux = (num.parse(controllerPeso.text) / (num.parse(controllerAltura.text) * num.parse(controllerAltura.text)));
                   resultadoIMC = numAux.toStringAsFixed(2);
                 });
               }, 
               child: const Text('Calcular o imc')),
             )
            ],
          ),
        ),
      ), 
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //use this controller to get data from the TextField
  final _input1 = TextEditingController();
  final _input2 = TextEditingController();
  final _area = TextEditingController();

  //store text input into a variable
  var getText = '';

  @override
  Widget build(BuildContext context) {

    double mul;
    double div;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFfffdf7),
      appBar: AppBar(
        backgroundColor: Color(0xFFffd000),
        centerTitle: true,
        title: const Text("Área de un triángulo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
        children: [
          SizedBox(
            height: 16,
          ),
          TextField(
            controller: _input1,
            decoration: const InputDecoration(
              labelText: 'Medida de la base del triángulo (cm).',
              labelStyle: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              border: UnderlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              maxLength: 6,
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              controller: _input2,
            decoration: const InputDecoration(
              labelText: 'Medida de la altura del triángulo (cm).',
              labelStyle: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              border: UnderlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              maxLength: 6,
            ),
            SizedBox(
              height: 16,
            ),
          MaterialButton(
            onPressed: () {
              //update the string variable to get new data input
              setState(() {
                mul = double.parse(_input1.text) * double.parse( _input2.text);
                div = mul / 2;
                getText = div.toString();
                FocusScope.of(context).unfocus();
              });
            },
            color: Color(0xFFff792e),
            padding: const EdgeInsets.all(10.0),
            child: const Text('Calcular área', style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            )),
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: Container(
              child: Center(
                child: Column(
                  children: [
                    CustomPaint(
                      size: Size(200, 200), 
                      painter: DrawTriangle(),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Área del triángulo: ${getText}', 
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Center(
              child: Text(
                'Made by Isai Jesús❤️',
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}

class DrawTriangle extends CustomPainter {
  @override

  void paint(Canvas canvas, Size size) {
    var path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.height, size.width);
    path.close();
    canvas.drawPath(path, Paint()..color = Color(0xFFffd000));
  }
  @
override

  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
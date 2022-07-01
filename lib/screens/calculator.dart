
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/material.dart';


class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var result = "";
  
  get textt => null;
  Widget btn (var textt ) {
   return ElevatedButton(onPressed: (){
    setState(() {
      result = result + textt;
    });
   }, child: Text(textt));
  }
  clearr(){
    setState(() {
      result = "";
    });
  }
  output(){
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      result = eval.toString();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator App", style: TextStyle(fontSize: 30, 
        fontWeight: FontWeight.bold),),
        leading: const Icon(Icons.calculate,size: 25,),
      ), body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Text(result, style: const TextStyle(
            fontSize: 35, fontWeight: FontWeight.bold
          ),),
          const SizedBox(height: 100,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              btn("1"),
              btn("2"),
              btn("3"),
              btn("4"),
            ],
          ),const SizedBox(height: 10,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              btn("5"),
              btn("6"),
              btn("7"),
              btn("8"),
            ],
          ),
          const SizedBox(height: 10,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              btn("9"),
              btn("0"),
              btn("+"),
              btn("-"),
            ],
          ),
          const SizedBox(height: 10,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:[
              btn("*"),
              btn("/"),
              ElevatedButton(onPressed: clearr, child: const Text("clear")),
              ElevatedButton(onPressed: output, child: const Text("=")),
             ],
          )
        ],
      ),
    );
  }
}
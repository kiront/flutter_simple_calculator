import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    title: "keyron calculator",
    theme: ThemeData(
      primaryColor: Colors.blueAccent
    ),
    home: KiranCalculator(),
  )
);

class KiranCalculator extends StatefulWidget {
  @override
  _KiranCalculatorState createState() => _KiranCalculatorState();
}

class _KiranCalculatorState extends State<KiranCalculator> {
  var _operation = ['Add', 'Subtract', 'Multiply', 'Divide'];
  var _values = "Add";
  var _displayText = "";

  TextEditingController textBox1 = TextEditingController();
  TextEditingController textBox2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
      appBar: AppBar(
        title: Text('Kiran Calculator'),
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: ListView(
          children: <Widget>[
            //First item
            DropdownButton<String>(
              value: _values,
              style: textStyle,
              items: _operation.map((String values){
              return DropdownMenuItem<String>(
                value: values,
                child: Text(values),
              );
            }).toList(),
             onChanged: (value){
              setState(() {
                _values = value;
                print("value changed to $value");
              });
              value = _values;
             },
            ),
            Padding(
                padding: EdgeInsets.only(bottom: 5)
            ),
            //second item
            TextField(
              controller: textBox1,
              keyboardType: TextInputType.number,
              style: textStyle,
              decoration: InputDecoration(
                labelText: "First Number",
                hintText: "100",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0)
                )
              ),
            ),
            Padding(
                padding: EdgeInsets.only(bottom:5)
            ),
            //third item
            TextField(
              controller: textBox2,
              style: textStyle,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Second Number",
                hintText: "200",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0)
                )
              ),
            ),
            //fourth item
            Text(_displayText, style: TextStyle(fontSize: 20),),

            //fifth item
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    child: Text('Calculate'),
                    onPressed: (){
                      setState(() {
                        double first = double.parse(textBox1.text);
                        double second = double.parse(textBox2.text);

                        switch(_values){
                          case "Add":
                            var sum = first+second;
                            _displayText = "The sum is " +sum.toStringAsFixed(0);
                            break;
                          case "Subtract":
                            var sub = first-second;
                            _displayText = "The subtraction is " +sub.toStringAsFixed(0);
                            break;
                          case "Multiply":
                            var mult = first*second;
                            _displayText = "Multiply is " +mult.toStringAsFixed(0);
                            break;
                          case "Divide":
                            var div = first/second;
                            _displayText = "Divide " +div.toStringAsFixed(0);
                            break;
                          default:
                            _displayText = "Something went wrong";
                        }
                      });
                    },
                  ),
                ),
                
                Expanded(
                  child: RaisedButton(
                      child: Text('Clear'),
                      onPressed: (){
                        setState(() {
                          _clearAll();
                        });
                      },

                  ),
                )
              ],
            )
          ],

        ),
      ),
    );
  }
  void _clearAll(){
    textBox1.text = "";
    textBox2.text = "";
  }
  void _calculateResult(){

  }
}

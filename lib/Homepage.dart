import 'package:flutter/material.dart';
import 'main.dart'; //Link for call function

//default page setting
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,//delete banner top right
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: new HomePage(),
      home: new Calculator(),//implement hamepage sceen(linked), call funtion
    );
  }
}

//Stateful-> update
class Calculator extends StatefulWidget{
  @override
  State createState() => new CalcState();
}

//UI (Homepage)
class Layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mainState = MainState.of(context);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Calculator"),
      ),
      body: new Column(
        children: <Widget>[
          new Expanded(
            child: new Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.blueGrey.withOpacity(0.85),
              child: new Row(
                children: <Widget>[
                  new Text(
                    mainState.display ?? '0',
                    style: new TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w700,
                      fontSize: 48.0,
                    ),
                  )
                ],
              ),
            ),
          ),
          new Expanded(
              flex: 3,
              child: new Container(
                child: new Column(
                  children: <Widget>[
                    makeBtns('dmrn'), //addition function(mem and more)
                    makeBtns('C<%/'),
                    makeBtns('789x'),
                    makeBtns('456-'),
                    makeBtns('123+'),
                    makeBtns('i0.='),
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
  Widget makeBtns(String row){
    List<String> token = row.split("");
    return new Expanded(
      flex: 1,
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,//Stretch button
        children: token
            .map((e) => new Button(
          keyvalue: e == 'i' ? "+/-" : e == '<' ? '<=' : e == 'd' ? "mc" : e == 'm' ? "m+" : e == 'r' ? "mr"
              : e == 'n' ? ".." : e,
        )) //map key for special key
            .toList(),
      ),
    );
  }
}

//Button Setting
class Button extends StatelessWidget{
  Button({this.keyvalue});

  final String keyvalue;

  @override
  Widget build(BuildContext context) {
    final mainState = MainState.of(context);
    return new Expanded(
      flex: 1,
      child: new FlatButton(
        shape: new Border.all(
          color: Colors.black.withOpacity(0.5),
          width: 2.0,
          style: BorderStyle.solid,
        ),
        color: Colors.grey,
        child: new Text(
          keyvalue,
          style: new TextStyle(
            //fontFamily: 'RobotoMono',
            fontWeight: FontWeight.normal,
            fontSize: 36.0,
            color: Colors.black54,
            fontStyle: FontStyle.normal,
          ),
        ),
        //if pressed
        onPressed: () {
          mainState.onPressed(keyvalue);
        },
      ),
    );
  }
}

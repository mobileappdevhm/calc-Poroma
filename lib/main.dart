import 'package:flutter/material.dart';
import 'Homepage.dart'; //link to layout


void main() => runApp(new MyApp());

//default State
class MainState extends InheritedWidget{
  MainState({
    Key key,
      this.display,
      this.var1,
      this.var2,
      this.temp,
      this.tem,
      this.op,
      this.onPressed,
      Widget child,
  })  : super(key: key, child: child);

  final String display;
  final double var1;
  final String var2;
  final double temp;
  final String tem;
  final String op;
  final Function onPressed;

  static MainState of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(MainState); //update state
  }

  @override
  bool updateShouldNotify(MainState oldWidget) {
    return display != oldWidget.display; //update screen check
  }
}

//State(logic)
class CalcState extends State<Calculator> {
  String display = "";
  double var1;
  String var2 = "";
  String op = '';
  double invert = -1.0;
  double temp;
  String tem;


  bool isNum(String str) {
    if (str == null) {
      return false;
    }

    return double.parse(str, (e) => null) != null;
  }

  void onPressed(keyvalue) {
    switch (keyvalue) {

      //clear
      case "C":
        op = '';
        temp = 0.0;
        var1 = 0.0;
        var2 = "";
        //tem= "";
        setState(() => display = "");
        break;

      //decimal point
      case ".":
        if (op != null) {
          setState(() {
            display = display + keyvalue;
            var2 = var2+keyvalue;// var2 accept dot
          });
        }
        else{
          display = display + keyvalue;
        }

        break;

      //common op
      case "+": case "-": case "x": case "/":
        op = keyvalue;
        var2 = '';
        var1 = double.parse(display);
        setState(() {
          display = display + keyvalue;
        });
        break;

      // return
      case "=":
        temp = double.parse(var2);
        setState(() {
          switch (op) {
            case "+":
              display = (var1 +temp).toString();
              break;
            case "-":
              display = (var1 - temp).toString();
              break;
            case "x":
              display = (var1 * temp).toString();
              break;
            case "/":
              display = (var1 / temp).toString();
              break;
          }
          op = '';
        });
        break;

      //Sign of num
      case "+/-":
        if (op != '') {
          setState(() => display = "Error");
        } else {
          setState(() => display = (invert*double.parse(display)).toString());
        }
        break;

      //+mem
      case "m+":
        if (op != '') {
          setState(() => display = "Error");
        } else {
          setState(() => tem = '' + display);
        }
        break;

      //mem claer
      case "mc":
        tem = '';
        break;

      //mem retrieve
      case "mr":
        setState(() => display = tem);
        break;

      //percent / 100
      case "%":
        if (op == ''){
          setState(() => display = (double.parse(display) / 100.00).toString());
          op = '';
        }
        else{
          setState(()=> display = "error" );
        }
        break;

      //back space (unfinished)
      case "<=":
        break;

      //addition function (bin conver? && unfinished)
      case "..":
        break;

      //var1 var2 display
      default:
        if (isNum(keyvalue)) {
          if (op != null) {
            setState(() => display = display + keyvalue);
            var2 = var2 + keyvalue;
          } else {
            setState(() => display = "" + keyvalue);
            op = '';
          }
        }else {
          onPressed(keyvalue);
        }

    }
  }

  @override
  Widget build(BuildContext context) {
    return new MainState(
      display: display,
      var1: var1,
      var2: var2,
      op: op,
      temp: temp,
      tem: tem,
      onPressed: onPressed,
      child: new Layout(),
    );
  }
}

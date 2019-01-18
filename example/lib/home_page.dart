import 'package:flutter/material.dart';
import 'package:flutter_badge/flutter_badge.dart';

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<HomePage> {
  String _text = '10';
  int _number;
  bool _showExact = false;
  int _textStyleType = 0;
  TextStyle _textStyle0 = TextStyle(color: Colors.white, fontSize: 11);
  TextStyle _textStyle1 = TextStyle(color: Colors.blue, fontSize: 14.0);
  TextStyle _textStyle2 = TextStyle(
      color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Badge Demo'),
      ),
      body: Container(
        padding: EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Badge(
                text: _text,
                number: _number,
                showExactNumber: _showExact,
                textStyle: getTextStyle(_textStyleType),
                child: Padding(
                  padding: EdgeInsets.all(6),
                  child: RaisedButton(
                    onPressed: () {
                      showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            child: Container(
                              color: Colors.blue,
                              width: 100,
                              height: 100,
                            ),
                          );
                        },
                      );
                    },
                    child: Text('Button'),
                  ),
                )),
            _textInput,
            _numberInput,
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text('TextStyle: '),
            ),
            _textStyleGroup,
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text('BadgeDecoration: '),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _textInput {
    return Row(
      children: <Widget>[
        Text('text: '),
        Expanded(child: TextField(
          onChanged: (s) {
            setState(() {
              _text = s;
              _number = null;
            });
          },
        ))
      ],
    );
  }

  Widget get _numberInput {
    return Row(
      children: <Widget>[
        Text('number: '),
        Expanded(
            child: TextField(
          keyboardType: TextInputType.number,
          onChanged: (s) {
            setState(() {
              if (s.isEmpty) {
                _number = 0;
              } else {
                _number = int.parse(s);
              }
              _text = null;
            });
          },
        )),
        Text('showExact: '),
        Switch(
            value: _showExact,
            onChanged: (b) {
              setState(() {
                _showExact = b;
              });
            })
      ],
    );
  }

  Widget get _textStyleGroup {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _textStyleRadio('Default:', 0),
        _textStyleRadio('TextStyle1:', 1),
        _textStyleRadio('TextStyle2:', 2),
      ],
    );
  }

  Widget _textStyleRadio(String name, int value) {
    return Container(
      child: Row(
        children: <Widget>[
          Text(name),
          Radio(
              value: value,
              groupValue: _textStyleType,
              onChanged: (int i) {
                setState(() {
                  _textStyleType = i;
                });
              }),
        ],
      ),
    );
  }

  TextStyle getTextStyle(int type) {
    switch (type) {
      case 0:
        return _textStyle0;
      case 1:
        return _textStyle1;
      case 2:
        return _textStyle2;
      default:
        return _textStyle0;
    }
  }
}

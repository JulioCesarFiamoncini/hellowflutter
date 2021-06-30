import 'package:flutter/material.dart';
import 'package:hellowflutter/HellowAPI.dart';
import 'package:mercury_client/mercury_client.dart';

class MyDialogs {
  bool onBackPressed() {
      return false;
  }

  Future<bool> showAlertDialog2Button(BuildContext context, String textBtnCancel, String textBtnOk, String textTitle, String textContent,Function func) async {
    bool _result = false;

    Widget cancelaButton = FlatButton(
      child: Text(textBtnCancel),
      onPressed: () {
        Navigator.of(context).pop(false);

      },
    );
    Widget continuaButton = FlatButton(
      child: Text(textBtnOk),
      onPressed: () {
        if ( func() ) {
          Navigator.of(context).pop(true);
          _result = true;
        } else{
          Navigator.of(context).pop(false);
          _result = false;
        }
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text(textTitle),
      content: Text(textContent),
      actions: [
        cancelaButton,
        continuaButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );

    return _result;
  }


  Future<bool> showAlertDialog(BuildContext context, String textBtnOk, String textTitle, String textContent) async {
    bool _result = false;
    Widget okButton = FlatButton(
      child: Text(textBtnOk),
      onPressed: () {
        _result = true;
        Navigator.of(context).pop(true);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text(textTitle),
      content: Text(textContent),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
    return _result;
  }



}


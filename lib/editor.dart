import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'quick_note_bloc.dart';
import 'quick_note.dart';

import 'constants.dart';


class editor extends StatelessWidget{
  QuicknoteBloc quicknoteBloc;

  editor(this.quicknoteBloc);

  static final textController = TextEditingController();

  TextField tf = TextField(
    maxLines: 1,
    maxLength: 64,
    textAlign: TextAlign.center,
    autofocus: true,
    controller: textController,
  );


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        textController.clear();
        textController.dispose();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          title:Text("Quicknote Editor"),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed:(){
                quicknoteBloc.addQuicknote(Quicknote(content: textController.text));
                textController.clear();
                Navigator.pop(context);
              },
            )
          ],
        ),
        body: Container(
          color: Colors.black12,
          height: double.infinity,
          child: Center(child: tf),
        ),
        resizeToAvoidBottomPadding: true,
      ),
    );
  }
}


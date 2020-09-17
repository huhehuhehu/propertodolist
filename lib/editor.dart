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
    maxLines: 99999,
    autofocus: true,
    controller: textController,
  );


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        textController.clear();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
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
          child: tf,
        ),
        resizeToAvoidBottomPadding: true,
      ),
    );
  }
}


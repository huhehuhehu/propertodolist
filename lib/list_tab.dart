import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:propertodolist/constants.dart';
import 'package:propertodolist/quick_note.dart';
import 'package:propertodolist/quick_note_bloc.dart';

import 'editor.dart';

class ListTab extends StatelessWidget{
  final quicknoteBloc = QuicknoteBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: _showlist(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed:() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => editor(quicknoteBloc)),
          );
        },
      ),
    );
  }
  Widget _showlist(){
    return StreamBuilder(
      stream: quicknoteBloc.quicknotes,
      builder: (BuildContext context, AsyncSnapshot<List<Quicknote>> snapshot) {
        if(snapshot.hasData == false) return Center(child: Text('BLAH'),);
        return snapshot.data.length >= 1 ?
        ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, index){
            Quicknote q = snapshot.data[index];
            return Dismissible(
              key: new ObjectKey(q),
              background: Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(Icons.delete),
                  ),
                ),
                color: Colors.redAccent,
              ),
              secondaryBackground: Container(
                color: mainColor,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Wrong Direction",
                    style:
                      TextStyle(
                        color:Colors.white,
                      )
                  ),
                )
              ),
              dismissThresholds: {
                DismissDirection.startToEnd: .6,
                DismissDirection.endToStart: 1.00,
              },
              onDismissed: (direction) {
                if (direction == DismissDirection.startToEnd) {
                  quicknoteBloc.deleteQuicknote(q.id);
                };
              },
              child: ListTile(
                title: Text(snapshot.data[index].getTitle()),
              ),
            );
          },
        ) : Center(child: Text('EMPTY'),);
      },
    );
  }

  dispose(){
    quicknoteBloc.dispose();
  }

}
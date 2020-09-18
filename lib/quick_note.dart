import 'constants.dart';

class Quicknote{
  String content;
  int id;
  int isDone;

  Quicknote({this.content, this.id, this.isDone = 0});

  String getTitle(){
    return ls.convert(content)[0];
  }

  Map<String, dynamic> toMap(){
    return {
      Column_name : this.content,
      Column_id: this.id,
      Column_done: this.isDone,
    };
  }

  swapDone(){
    if(isDone == 0) isDone =1;
    else isDone = 0;
  }
}


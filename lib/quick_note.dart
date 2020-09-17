import 'constants.dart';

class Quicknote{
  String content;
  int id;
  String title;

  Quicknote({this.content, this.id});

  String getTitle(){
    return ls.convert(content)[0];
  }

  Map<String, dynamic> toMap(){
    return {
      Column_name : this.content
    };
  }
}


import 'dart:async';

import 'quick_note.dart';
import 'quick_note_repository.dart';

class QuicknoteBloc {
  final _quicknoteRepository = QuicknoteRepository();

  final _quicknoteController = StreamController<List<Quicknote>>.broadcast();

  get quicknotes => _quicknoteController.stream;

  QuicknoteBloc() {
    getQuicknotes();
  }

  getQuicknotes() async{
    _quicknoteController.sink.add(await _quicknoteRepository.getAllQuicknotes());
  }

  addQuicknote(Quicknote q) async{
    await _quicknoteRepository.insertQuicknote(q);
    getQuicknotes();
  }

  deleteQuicknote(int id) async{
    await _quicknoteRepository.deleteQuicknote(id);
    getQuicknotes();
  }

  editQuicknote(int id, String s) async{
    await _quicknoteRepository.editQuicknote(id, s);
    getQuicknotes();
  }

  dispose(){
    _quicknoteController.close();
  }
  
}

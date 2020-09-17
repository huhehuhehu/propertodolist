import 'quick_note.dart';
import 'quick_note_dao.dart';

class QuicknoteRepository {
  final qDao = QuicknotesDao();

  Future getAllQuicknotes() => qDao.getAllQuicknotes();

  Future insertQuicknote(Quicknote q) => qDao.insertQuicknote(q);

  Future editQuicknote(int id, String s) => qDao.editQuicknote(id, s);

  Future deleteQuicknote(int id) => qDao.deleteQuicknote(id);

}
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import 'db_states.dart';

class DataBaseCubit extends Cubit<DataBaseStates> {
  DataBaseCubit() : super (DBInitialStates());

  static DataBaseCubit get(context) => BlocProvider.of(context);


  late Database database;
  void createDatabase() {
    openDatabase(
      'Chats.db',
      version: 1,
      onCreate: (database, version) {
        if (kDebugMode) {
          print('database create');
        }

        database.execute(
            'CREATE TABLE Chats(id INTEGER PRIMARY KEY,message TEXT,boot TEXT)')
            .then((value) {
          if (kDebugMode) {
            print('Table Chats Created');
          }
        }).catchError((error) {
          if (kDebugMode) {
            print('error when creating table ${error.toString()}');
          }
        });
      },
      onOpen: (database) {
        getData(database);
        if (kDebugMode) {
          print('DataBase Opened');
        }

      },
    ).then((value) {
      database = value;
      getData(database);
      emit(DBCreateSuccessStates());
    }).catchError((error){
      emit(DBCreateErrorStates());
    });
  }


  insertChat({
    required String message,
    required String boot,

  }) async
  {
    await database.transaction((txn) async {
      return txn.rawInsert(
          'INSERT INTO Chats(message,boot)VALUES("$message","$boot")'
      ).then((value) {
        if (kDebugMode) {
          print('$value inserted successfully');
        }
        emit(DBAddSuccessStates());

        getData(database);

      }).catchError((error) {
        if (kDebugMode) {
          print('error when inserting new record ${error.toString()}');
        }
        emit(DBAddErrorStates());
      });
    });
  }


  List<Map> allChat = [];
  void getData(database) {
    allChat = [];
    database.rawQuery('SELECT * FROM Chats').then((value) {
      value.forEach((element) {
        allChat.add(element);
      });

      emit(DBGetSuccessStates());
    }).catchError((error){
      if (kDebugMode) {
        print(error.toString());
      }
      emit(DBGetErrorStates());
    });
  }



  // void UpdateData({
  //   required String status,
  //   required int id,
  // }) async {
  //   database.rawUpdate(
  //     'UPDATE Chat SET status = ? WHERE id = ?',
  //     [status, id],
  //   ).then((value) {
  //     getDataFromDatabase(database);
  //     emit(AppUpdateDatabaseState());
  //   });
  // }

  void deleteData({
    required int id,
  }) async {
    await database.rawDelete(
      'DELETE FROM Chats WHERE id = ?', [id],
    ).then((value) {
      getData(database);
      emit(DBDeleteSuccessStates());
    }).catchError((error){
      if (kDebugMode) {
        print(error.toString());
      }
      emit(DBDeleteErrorStates());
    });
  }

}

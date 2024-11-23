import 'dart:developer';

import 'package:mazaya/core/constent/contact_constants.dart';
import 'package:mazaya/core/constent/offer_constants.dart';
import 'package:mazaya/core/constent/user_constants.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {

  Database? _dbObject;
  Future<Database> get _getConnection async {
    if (_dbObject == null) {
      return _dbObject = await dbConnection();
    } else {
      return _dbObject!;
    }
  }

  Future<Database> dbConnection() async {
    String dbFolder = await getDatabasesPath();
    String dbName = "mazaya.db";
    String dbPath = join(dbFolder, dbName);
    return openDatabase(
      dbPath,
      version: 9,
      onCreate: (db, version) async {
        await db.execute("""
               create table ${UserConstants.tableName} (
                ${UserConstants.id} integer primary key autoincrement,
                ${UserConstants.userName} varchar(255) not null,
                ${UserConstants.password} varchar(255) not null,
                ${UserConstants.checkAccept} varchar(255) null
                )
              """);

        await db.execute("""
             create table ${Constants.tableName} (
                ${Constants.id} integer primary key autoincrement,
                ${Constants.name} varchar(255) not null,
                ${Constants.email} varchar(255) not null,
                ${Constants.title} varchar(255) not null,
                ${Constants.message} text not null,
                ${Constants.date} text not null
                )
              """);

        await db.execute("""
                create table ${OfferConstants.tableName} (
                ${OfferConstants.id} integer primary key autoincrement,
                ${OfferConstants.categroy} varchar(255) not null,
                ${OfferConstants.goalCategroy} varchar(255) not null,
                ${OfferConstants.organization} varchar(255) not null,
                ${OfferConstants.responsible} varchar(255) not null,
                ${OfferConstants.numberOfCustomer} varchar(255) not null,
                ${OfferConstants.city} varchar(255) not null,
                ${OfferConstants.discount} varchar(255) not null,
                ${OfferConstants.branches} varchar(255) not null,
                ${OfferConstants.startDate} text not null,
                ${OfferConstants.endDate} text not null,
                ${OfferConstants.name} varchar(255) not null,
                ${OfferConstants.number} varchar(255) not null,
                ${OfferConstants.image} text not null
                )
              """);

        await db.execute("""
                create table ${OfferConstants.admintableName} (
                ${OfferConstants.id} integer primary key autoincrement,
                ${OfferConstants.categroy} varchar(255) not null,
                ${OfferConstants.goalCategroy} varchar(255) not null,
                ${OfferConstants.organization} varchar(255) not null,
                ${OfferConstants.responsible} varchar(255) not null,
                ${OfferConstants.numberOfCustomer} varchar(255) not null,
                ${OfferConstants.city} varchar(255) not null,
                ${OfferConstants.discount} varchar(255) not null,
                ${OfferConstants.branches} varchar(255) not null,
                ${OfferConstants.startDate} text not null,
                ${OfferConstants.endDate} text not null,
                ${OfferConstants.name} varchar(255) not null,
                ${OfferConstants.number} varchar(255) not null,
                ${OfferConstants.image} text not null
                )
              """);
        await db.execute("""
                create table ${OfferConstants.lengthNewTable} (
                'length' integer 
                )
              """);

        await db.execute("""
                create table ${OfferConstants.newtableName} (
                ${OfferConstants.id} integer primary key autoincrement,
                ${OfferConstants.categroy} varchar(255) not null,
                ${OfferConstants.goalCategroy} varchar(255) not null,
                ${OfferConstants.organization} varchar(255) not null,
                ${OfferConstants.responsible} varchar(255) not null,
                ${OfferConstants.numberOfCustomer} varchar(255) not null,
                ${OfferConstants.city} varchar(255) not null,
                ${OfferConstants.discount} varchar(255) not null,
                ${OfferConstants.branches} varchar(255) not null,
                ${OfferConstants.startDate} text not null,
                ${OfferConstants.endDate} text not null,
                ${OfferConstants.name} varchar(255) not null,
                ${OfferConstants.number} varchar(255) not null,
                ${OfferConstants.image} text not null
                )
              """);
      },
    );
  }

  save(String tableName, Map<String, dynamic> item) async {
    Database d = await _getConnection;
    int i = await d.insert(tableName, item);
    log(i.toString());
  }

  Future<void> update(
      String tableName, Map<String, dynamic> item, String id) async {
    Database d =
        await _getConnection; // Ensure _getConnection is correctly defined
    int response = await d.update(
      tableName,
      item,
      where: 'id = ?', // Specify the condition to match the row to update
      whereArgs: [id], // Provide the id as an argument
    );

    log('Rows updated: $response');
  }
  // update(String tableName, OfferModel offer, String id) async {
  //   Database d = await _getConnection;
  //   int response = await d.update(tableName, offer.toJson() , where: id);
  //   log(response.toString());
  // }

  delete(String table, int id) async {
    Database d = await _getConnection;
    int rewopnst = await d.rawDelete("DELETE FROM $table WHERE  id = $id");
    log(rewopnst.toString());
  }

  Future<List<Map<String, dynamic>>> show(String table) async {
    Database d = await _getConnection;
    return d.query(table);
  }
}

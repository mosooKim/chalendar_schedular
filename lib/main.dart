import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:table_chalendar/const/color.dart';
import 'package:table_chalendar/database/drift.dart';
import 'package:table_chalendar/screen/home_screen.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting();

  final database = AppDatabase();

  await database.createSchedule(
    ScheduleTableCompanion(
      startTime: Value(12),
      endTime: Value(12),
      content: Value('Flutter 프로그래밍'),
      date: Value(DateTime.utc(2024, 7, 26)),
      color: Value(categoryColors.first),
    ),
  );

  final resp = await database.getSchedules();

  print(resp);

  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'NotoSans',
      ),
      home: HomeScreen(),
    ),
  );
}

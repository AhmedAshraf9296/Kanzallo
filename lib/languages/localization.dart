import 'package:get/get.dart';
import 'package:kanzalloshop/languages/ar.dart';
import 'package:kanzalloshop/languages/fr.dart';
import 'package:kanzalloshop/utils/my_string.dart';
import 'en.dart';
class LocalizationApp extends Translations{
  @override
  Map<String, Map<String, String>> get keys =>{
    ene : en,
    ara : ar,
    frf : fr
  };
}
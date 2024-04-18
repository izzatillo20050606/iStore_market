import 'package:phone_store/common/serves/network_servis.dart';
import 'package:phone_store/data/entitiy/category_mode.dart';
import 'package:phone_store/data/repazetoriy/app_repazetoriy.dart';

class AppRepazetoriyImplement implements AppRepazetoriy {
  @override
  Future<void> postAll(Map<String, dynamic> body) async {
    NetworkServes.read(NetworkServes.apipos, body);
  }

  @override
  Future<void> postAllLogin(Map<String, dynamic> body) async {
    await NetworkServes.read(NetworkServes.apilogin, body);
  }

  @override
  Future<List> getAll() async {
    List list = [];
    String res = (await NetworkServes.fetchData(NetworkServes.apigetCote)) as String;
    list = categoreFromJson(res);
    return list;
  }
}

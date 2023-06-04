import 'package:hive/hive.dart';

import '../models/user.dart';

class MaksimaLocalDBService {
  final maksimaUserBox = Hive.box<User>('maksimaUserBox');
  final maksimaTokenBox = Hive.box<String>('maksimaTokenBox');
  final ritelTokenBox = Hive.box<String>('ritelTokenBox');
  final ritelPipelineIdBox = Hive.box<String>('ritelPipelineIdBox');
  final ritelPeroranganFlagBox =
      Hive.box<Map<String, dynamic>>('ritelPeroranganFlagBox');
  final ritelPerusahaanCvFlagBox =
      Hive.box<Map<String, dynamic>>('ritelPerusahaanCvFlagBox');
  final ritelPerusahaanPtFlagBox =
      Hive.box<Map<String, dynamic>>('ritelPerusahaanPtFlagBox');
  final ritelInformasiNonFinansial =
      Hive.box<Map<String, int>>('ritelInformasiNonFinansial');
  final ritelPrakarsaId = Hive.box<String>('prakarsaId');
  final ritelPencairanFlag =
      Hive.box<Map<String, dynamic>>('ritelPencairanFlagBox');

  // User related
  void storeUser(User user) => maksimaUserBox.add(user);

  void replaceUser(User user) => maksimaUserBox.putAt(0, user);

  User? getUser() => maksimaUserBox.getAt(0);

  void removeUser() => maksimaUserBox.clear();

  bool maksimaUserBoxIsNotEmpty() => maksimaUserBox.isNotEmpty;

  // Token related
  void storeToken(String token) => maksimaTokenBox.add(token);

  String? getToken() => maksimaTokenBox.getAt(0);

  void removeToken() => maksimaTokenBox.clear();

  void ritelStoreToken(String token) => ritelTokenBox.add(token);

  String? ritelGetToken() => ritelTokenBox.getAt(0);

  void ritelRemoveToken() => ritelTokenBox.clear();

  void ritelStorePipelineId(String id) => ritelPipelineIdBox.add(id);

  String? ritelGetPipelineId() => ritelPipelineIdBox.getAt(0);

  void ritelRemovePipelineId() => ritelPipelineIdBox.clear();

  void replacePipelineId(String id) => ritelPipelineIdBox.put(0, id);

  bool pipelineIdBoxIsNotEmpty() => ritelPipelineIdBox.isNotEmpty;

  void storePeroranganFlag(Map<String, dynamic> flags) =>
      ritelPeroranganFlagBox.add(flags);

  Map<String, dynamic>? getPeroranganFlag() => ritelPeroranganFlagBox.getAt(0);

  void removePeroranganFlag() => ritelPeroranganFlagBox.clear();

  void replacePeroranganFlag(Map<String, dynamic> flag) =>
      ritelPeroranganFlagBox.put(0, flag);

  bool peroranganFlagBoxIsNotEmpty() => ritelPeroranganFlagBox.isNotEmpty;

  void storePerusahaanCvFlag(Map<String, dynamic> flags) =>
      ritelPerusahaanCvFlagBox.add(flags);

  Map<String, dynamic>? getPerusahaanCvFlag() =>
      ritelPerusahaanCvFlagBox.getAt(0);

  void removePerusahaanCvFlag() => ritelPerusahaanCvFlagBox.clear();

  void replacePerusahaanCvFlag(Map<String, dynamic> flag) =>
      ritelPerusahaanCvFlagBox.put(0, flag);

  bool perusahaanCvFlagBoxIsNotEmpty() => ritelPerusahaanCvFlagBox.isNotEmpty;

  void storePerusahaanPtFlag(Map<String, dynamic> flags) =>
      ritelPerusahaanPtFlagBox.add(flags);

  Map<String, dynamic>? getPerusahaanPtFlag() =>
      ritelPerusahaanPtFlagBox.getAt(0);

  void removePerusahaanPtFlag() => ritelPerusahaanPtFlagBox.clear();

  void replacePerusahaanPtFlag(Map<String, dynamic> flag) =>
      ritelPerusahaanPtFlagBox.put(0, flag);

  bool perusahaanPtFlagBoxIsNotEmpty() => ritelPerusahaanPtFlagBox.isNotEmpty;

  void storeNonFinansial(Map<String, int> answers) =>
      ritelInformasiNonFinansial.add(answers);

  List<Map<String, dynamic>> getAllValuesNonFinansial() =>
      ritelInformasiNonFinansial.values.toList();

  void getAllKeysNonFinaisial() => ritelInformasiNonFinansial.keys;

  Map<String, int>? getNonFinansial(index) =>
      ritelInformasiNonFinansial.get(index);

  void replaceNonFinansial(int key, Map<String, int> answers) =>
      ritelInformasiNonFinansial.put(key, answers);

  void removeNonFinansial() => ritelInformasiNonFinansial.clear();

  bool nonFinansialIsNotEmpty() => ritelInformasiNonFinansial.isNotEmpty;

  void ritelStorePrakarsaId(String key, String value) =>
      ritelPrakarsaId.put(key, value);

  String? ritelGetPrakarsaId(values) => ritelPrakarsaId.get(values);

  void ritelRemovePrakarsaId() => ritelPrakarsaId.clear();

  bool ritelPrakarsaIdIsEmpty() => ritelPrakarsaId.isNotEmpty;

  Map<String, dynamic>? getPencairanFlag() => ritelPencairanFlag.getAt(0);

  void storePencairanFlag(Map<String, dynamic> flags) =>
      ritelPencairanFlag.add(flags);

  void removePencairanFlag() => ritelPencairanFlag.clear();

  void replacePencairanFlag(Map<String, dynamic> flag) =>
      ritelPencairanFlag.put(0, flag);

  bool pencairanFlagBoxIsNotEmpty() => ritelPencairanFlag.isNotEmpty;
}

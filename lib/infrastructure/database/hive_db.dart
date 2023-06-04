import 'package:hive/hive.dart';

import '../../application/models/user.dart';

class HiveDB {
  static Future init() async {
    Hive.registerAdapter(MaksimaUserAdapter());

    await Hive.openBox<User>('maksimaUserBox');
    await Hive.openBox<String>('maksimaTokenBox');
    await Hive.openBox<String>('ritelTokenBox');
    await Hive.openBox<String>('ritelPipelineIdBox');
    await Hive.openBox<Map<String, dynamic>>('ritelPeroranganFlagBox');
    await Hive.openBox<Map<String, dynamic>>('ritelPerusahaanCvFlagBox');
    await Hive.openBox<Map<String, dynamic>>('ritelPerusahaanPtFlagBox');
    await Hive.openBox<Map<String, int>>('ritelInformasiNonFinansial');
    await Hive.openBox<String>('prakarsaId');
    await Hive.openBox<Map<String, dynamic>>('ritelPencairanFlagBox');
  }
}

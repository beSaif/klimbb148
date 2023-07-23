import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:klimbb148/models/profile_model.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
    listenToProfiles();
  }

  Future<void> saveProfiles(ProfileModel newProfile) async {
    debugPrint("saveProfiles: $newProfile");
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.profileModels.putSync(newProfile));
  }

  Future<List<ProfileModel>> getAllProfiles() async {
    final isar = await db;
    return await isar.profileModels.where().findAll();
  }

  Stream<List<ProfileModel>> listenToProfiles() async* {
    final isar = await db;
    yield* isar.profileModels.where().watch(fireImmediately: true);
  }

  Future<void> cleanDb() async {
    final isar = await db;
    await isar.writeTxn(() => isar.clear());
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [ProfileModelSchema],
        inspector: true,
        directory: dir.path,
      );
    }

    return Future.value(Isar.getInstance());
  }
}

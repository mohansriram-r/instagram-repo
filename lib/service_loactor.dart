import 'package:get_it/get_it.dart';
import 'package:instagram_clone/service/firestore_service.dart';
import 'package:instagram_clone/utils/helper/helper.dart';

final sl = GetIt.instance;

void firebaseMethods() {
  sl.registerSingleton<FirestoreService>(FireStoreImplementation());
  sl.registerSingleton<Helper>(Helper());
}

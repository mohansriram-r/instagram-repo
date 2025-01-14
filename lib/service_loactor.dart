import 'package:get_it/get_it.dart';
import 'package:instagram_clone/service/firestore_service.dart';

final sl = GetIt.instance;

void firebaseMethods() {
  sl.registerSingleton<FirestoreService>(FireStoreImplementation());
}

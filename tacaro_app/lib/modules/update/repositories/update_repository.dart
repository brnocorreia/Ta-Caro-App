abstract class IUpdateRepository {
  Future<bool> updater(
      {required String name, required String price, required String date});
}

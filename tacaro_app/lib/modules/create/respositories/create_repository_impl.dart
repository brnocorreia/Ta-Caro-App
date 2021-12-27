import 'package:tacaro_app/shared/services/app_database.dart';
import 'create_repository.dart';
import 'package:intl/intl.dart';

class CreateRepositoryImpl implements ICreateRepository {
  final AppDatabase database;

  CreateRepositoryImpl({
    required this.database,
  });

  @override
  Future<bool> create(
      {required String name,
      required String price,
      required String date}) async {
    final priceSanitize = double.parse(price.replaceAll(
      "R\$",
      "",
    ));
    // final datenew = double.parse(date.replaceAll("/", "-")).toString();
    DateTime datenew = DateTime.parse(date);
    final dateSanitize = DateFormat('yyyy-MM-dd').format(datenew);
    final response = await database.create(table: "orders", data: {
      "name": name,
      "price": priceSanitize,
      "created": dateSanitize,
    });
    return response;
  }
}

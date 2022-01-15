import 'package:intl/intl.dart';
import 'package:tacaro_app/shared/services/app_database.dart';

import 'update_repository.dart';

class UpdateRepositoryImpl implements IUpdateRepository {
  final AppDatabase database;

  UpdateRepositoryImpl({
    required this.database,
  });

  @override
  Future<bool> updater(
      {required String name,
      required String price,
      required String date}) async {
    final priceSanitize = double.parse(price.replaceAll(
      "R\$",
      "",
    ));
    // final datenew = double.parse(date.replaceAll("/", "-")).toString();
    var inputFormat = DateFormat('dd/MM/yyyy');
    var inputDate = inputFormat.parse(date); // <-- dd/MM 24H format

    var outputFormat = DateFormat('yyyy-MM-dd');
    var outputDate = outputFormat.format(inputDate);
    DateTime datenew = DateTime.parse(outputDate);
    final dateSanitize = DateFormat('yyyy-MM-dd').format(datenew);
    final response = await database.create(table: "orders", data: {
      "name": name,
      "price": priceSanitize,
      "created": dateSanitize,
    });
    return response;
  }
}

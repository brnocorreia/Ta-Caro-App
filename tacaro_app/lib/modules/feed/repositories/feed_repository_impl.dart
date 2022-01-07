import 'package:tacaro_app/modules/feed/repositories/feed_repository.dart';
import 'package:tacaro_app/shared/services/app_database.dart';

class FeedRepositoryImpl implements IFeedRepository {
  final AppDatabase database;

  FeedRepositoryImpl(this.database);

  @override
  Future<List<Map<String, dynamic>>> getAll() async {
    final response = await database.getAll("orders");
    return response;
  }
}

import 'package:tacaro_app/shared/models/user_model.dart';

import 'supabase_database.dart';

abstract class AppDatabase {

  static final AppDatabase instance  = SupabaseDatabase();

  void init();

  Future<UserModel> createUser(UserModel user);
  Future<UserModel> getUser(String id);

  Future<UserModel> login({
    required String email, 
    required String password,

  });

  Future<UserModel> createAccount({
    required String email, 
    required String password, 
    required String name,

  });





}
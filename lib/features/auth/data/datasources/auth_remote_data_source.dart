import '../models/user_model.dart'; // Import the UserModel class

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
  Future<UserModel> signUp(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserModel> login(String email, String password) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));
    return UserModel(id: '1', email: email, password: password);
  }

  @override
  Future<UserModel> signUp(String email, String password) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));
    return UserModel(id: '1', email: email, password: password);
  }
}

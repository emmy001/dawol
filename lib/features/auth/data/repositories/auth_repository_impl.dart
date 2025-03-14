import '../datasources/auth_remote_data_source.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/entities/user_entity.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<UserEntity> login(String email, String password) async {
    final userModel = await remoteDataSource.login(email, password);
    return UserEntity(id: userModel.id, email: userModel.email);
  }

  @override
  Future<UserEntity> signUp(String email, String password) async {
    final userModel = await remoteDataSource.signUp(email, password);
    return UserEntity(id: userModel.id, email: userModel.email);
  }
}

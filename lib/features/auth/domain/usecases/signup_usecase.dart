import '../repositories/auth_repository.dart';
import '../entities/user_entity.dart';

class SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCase({required this.repository});

  Future<UserEntity> call(String email, String password) async {
    return await repository.signUp(email, password);
  }
}

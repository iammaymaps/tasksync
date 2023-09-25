import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasksync/Authentication/Auth%20Repository/AuthRepository.dart';
import 'package:tasksync/Error%20Handle/SnackBar/snackBar.dart';


//AuthStateChange isn't finish yet

final AuthControllerProvider = StateNotifierProvider.autoDispose<AuthController, bool>(
    (ref) => AuthController(
        authRepository: ref.watch(authRepositoryProvider), ref: ref));

final userProvider = StateProvider((ref) => null);

class AuthController extends StateNotifier<bool> {
  final AuthRepository _authRepository;
  final Ref _ref;
  AuthController({required AuthRepository authRepository, required Ref ref})
      : _authRepository = authRepository,
        _ref = ref,
        super(false);



  void signInWithGoogle(BuildContext context) async {
    state = true;
    final user = await _authRepository.signInWithGoogle();
    user.fold((l) => showSnackbar(context, l.message),
        (userModel) => _ref.read(userProvider.notifier));
  }
}

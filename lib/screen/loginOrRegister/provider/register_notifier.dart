import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entity/registration_state.dart';

class RegistrationNotifier extends StateNotifier<RegistrationState> {
  RegistrationNotifier() : super(RegistrationState());

  Future<void> submit(String username, String password, String code, String phone) async {
    print("获取的值为：$username,, $password,,$code,,$phone");

    state = state.copyWith(isSubmitting: true, errorMessage: null);

    // 模拟注册过程
    await Future.delayed(Duration(seconds: 2));

    // 这里可以处理注册逻辑，例如调用 API
    // 假设注册失败
    state = state.copyWith(isSubmitting: false, errorMessage: '注册失败，请重试');
  }
}

final registrationProvider = StateNotifierProvider<RegistrationNotifier, RegistrationState>(
      (ref) => RegistrationNotifier(),
);
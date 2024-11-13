class LoginState {
  final String username;
  final String password;
  final String code;
  final bool rememberPassword;
  final bool isLoading;

  LoginState({
    this.username = '',
    this.password = '',
    this.code = '',
    this.rememberPassword = false,
    this.isLoading = false,
  });

  // 更新状态
  LoginState copyWith({
    String? username,
    String? password,
    String? code,
    bool? rememberPassword,
    bool? isLoading,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      code: code ?? this.code,
      isLoading: isLoading ?? this.isLoading,
      rememberPassword: rememberPassword ?? this.rememberPassword
    );
  }
}
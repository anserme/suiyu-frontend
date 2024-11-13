class RegistrationState {
  final String username;
  final String phone;
  final String password;
  final String code;
  final bool isSubmitting;
  final String? errorMessage;

  RegistrationState({
    this.username = '',
    this.phone = '',
    this.password = '',
    this.code = '',
    this.isSubmitting = false,
    this.errorMessage,
  });

  RegistrationState copyWith({
    String? username,
    String? phone,
    String? password,
    bool? isSubmitting,
    String? errorMessage,
    String? code,
  }) {
    return RegistrationState(
      username: username ?? this.username,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      errorMessage: errorMessage,
      code: code ?? this.code
    );
  }
}

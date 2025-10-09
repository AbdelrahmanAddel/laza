class UserEntity {
  final String id;
  final String email;
  final String name;
  final String token;
  final String refreshToken;
  final DateTime refreshTokenExpiryTime;

  UserEntity({
    required this.id,
    required this.email,
    required this.name,
    required this.token,
    required this.refreshToken,
    required this.refreshTokenExpiryTime,
  });
}

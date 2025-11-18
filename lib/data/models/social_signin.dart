class SocialSignin {
  String email;
  String provider;
  String providerId;

  SocialSignin({
    required this.email,
    required this.provider,
    required this.providerId,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'provider': provider,
      'provider_id': providerId,
    };
  }
}
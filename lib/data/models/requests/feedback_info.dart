class FeedbackInfo {
  String firstName;
  String lastName;
  String email;
  String phoneNo;
  String subject;
  String message;

  FeedbackInfo({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNo,
    required this.subject,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone_no': phoneNo,
      'subject': subject,
      'details': message,
    };
  }
}
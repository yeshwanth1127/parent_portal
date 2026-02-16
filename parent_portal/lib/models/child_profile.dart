/// Data model for the child/student profile shown on the Profile page.
class ChildProfile {
  const ChildProfile({
    this.profileImageUrl,
    required this.name,
    required this.parentName,
    required this.phoneNumber,
    required this.email,
    required this.address,
    required this.className,
    required this.teacherName,
    required this.teacherPhoneNumber,
    this.helplineNumber,
  });

  final String? profileImageUrl;
  final String name;
  final String parentName;
  final String phoneNumber;
  final String email;
  final String address;
  final String className;
  final String teacherName;
  final String teacherPhoneNumber;
  final String? helplineNumber;

  /// Example data for development / opening page.
  factory ChildProfile.placeholder() {
    return const ChildProfile(
      name: '—',
      parentName: '—',
      phoneNumber: '—',
      email: '—',
      address: '—',
      className: '—',
      teacherName: '—',
      teacherPhoneNumber: '—',
      helplineNumber: '—',
    );
  }
}

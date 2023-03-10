class TelegramUser {
final String firstName;
final String lastName;
final String phoneNumber;
final String username;
final String? bio;
final String? url;

TelegramUser({required this.firstName, required this.lastName, required this.phoneNumber, required this.username, this.bio, this.url});
}
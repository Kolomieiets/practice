class MonobankUser{
  final String? name;
  final String? surname;
  final String phoneNumber;
  final String cardNumber;
  final String? httpImage;
  final String id;

  MonobankUser({this.name, this.surname, required this.phoneNumber, required this.cardNumber, this.httpImage, required this.id});
}
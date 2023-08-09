import 'package:practice_app/services/global/entity/monobank_user.dart';
// TODO(Valentyna):Move this list to resources
class UsersList {
  static List<MonobankUser> _users = [
    MonobankUser(
      name: 'Benedict',
      surname: 'Cumberbatch',
      phoneNumber: '+380939721083',
      cardNumber: '4149263024315375',
      httpImage:
          'https://upload.wikimedia.org/wikipedia/commons/c/cd/Benedict_Cumberbatch_filming_Sherlock_cropped.jpg',
      id: '1',
    ),
    MonobankUser(
      name: 'Stephen',
      surname: 'King',
      phoneNumber: '+380956739955',
      cardNumber: '4149243126304114',
      httpImage:
          'https://upload.wikimedia.org/wikipedia/commons/e/e3/Stephen_King%2C_Comicon.jpg',
      id: '2',
    ),
    MonobankUser(
      name: 'Arnold',
      surname: 'Schwarzenegger',
      phoneNumber: '+380507759567',
      cardNumber: '5375263041495375',
      id: '3',
    ),
    MonobankUser(
      name: 'Kate',
      surname: 'Winslet',
      phoneNumber: '+380686434167',
      cardNumber: '4149411426302431',
      httpImage:
          'https://upload.wikimedia.org/wikipedia/commons/2/23/Kate_Winslet_Palm_Film_Festival_2_%28cropped%29.jpg',
      id: '4',
    ),
    MonobankUser(
      name: 'Mila',
      surname: 'Kunis',
      phoneNumber: '+380977232473 ',
      cardNumber: '4149743153754115',
      id: '5',
    ),
    MonobankUser(
      name: 'Valentyna',
      phoneNumber: '+380973615066',
      cardNumber: '5375263041494114',
      id: '6',
    ),
    MonobankUser(
      name: 'Ashton',
      surname: 'Kutcher',
      phoneNumber: '+380503533355',
      cardNumber: '4149537553752630',
      httpImage:
          'https://upload.wikimedia.org/wikipedia/commons/c/ce/Ashton_Kutcher_during_TechCrunch_Disrupt_New_York_May_2011%2C_5.jpg',
      id: '7',
    ),
    MonobankUser(
      name: 'Angelina',
      surname: 'Jolie',
      phoneNumber: '+380675068787',
      cardNumber: '4149243153754114',
      httpImage:
          'https://upload.wikimedia.org/wikipedia/commons/0/0c/Angelina_Jolie_by_Gage_Skidmore.jpg',
      id: '8',
    ),
    MonobankUser(
      surname: 'Sting',
      phoneNumber: '+380939721083',
      cardNumber: '4149537514924312',
      httpImage:
          'https://upload.wikimedia.org/wikipedia/commons/d/d7/Sting_at_the_2009_Tribeca_Film_Festival.jpg',
      id: '9',
    ),
    MonobankUser(
      name: 'Ryan',
      surname: 'Reynolds',
      phoneNumber: '+380956739955',
      cardNumber: '5375263075537526',
      httpImage:
          'https://upload.wikimedia.org/wikipedia/commons/1/14/Deadpool_2_Japan_Premiere_Red_Carpet_Ryan_Reynolds_%28cropped%29.jpg',
      id: '10',
    ),
    MonobankUser(
      name: 'Kate',
      phoneNumber: '+380956739955',
      cardNumber: '5375263075537526',
      id: '11',
    ),
    MonobankUser(
      name: 'Billie',
      surname: 'Eilish',
      phoneNumber: '+380939721083',
      cardNumber: '4149263024315375',
      httpImage:
          'https://upload.wikimedia.org/wikipedia/commons/f/fa/Billie_Eilish_2019_by_Glenn_Francis_%28cropped%29_2.jpg',
      id: '12',
    ),
    MonobankUser(
      name: 'Madonna',
      phoneNumber: '+380956739955',
      cardNumber: '4149243126304114',
      httpImage:
          'https://upload.wikimedia.org/wikipedia/commons/b/b1/Madonna_Rebel_Heart_Tour_2015_-_Stockholm_%2823051472299%29_%28cropped%29.jpg',
      id: '13',
    ),
    MonobankUser(
      name: 'Elton',
      surname: 'John',
      phoneNumber: '+380507759567',
      cardNumber: '5375263041495375',
      id: '14',
    ),
    MonobankUser(
      name: 'Miley',
      surname: 'Cyrus',
      phoneNumber: '+380686434167',
      cardNumber: '4149411426302431',
      httpImage:
          'https://upload.wikimedia.org/wikipedia/commons/d/d6/93.3_FLZ_Jingle_Ball_Tampa_Florida_IMG_6955_%2811490119034%29_%28cropped%29.jpg',
      id: '15',
    ),
    MonobankUser(
      name: 'Blake',
      surname: 'Lively',
      phoneNumber: '+380977232473 ',
      cardNumber: '4149743153754115',
      id: '16',
    ),
    MonobankUser(
      name: 'Emilia',
      surname: 'Clarke',
      phoneNumber: '+380973615066',
      cardNumber: '5375263041494114',
      id: '17',
    ),
    MonobankUser(
      name: 'Leonardo',
      surname: 'DiCaprio',
      phoneNumber: '+380503533355',
      cardNumber: '4149537553752630',
      httpImage:
          'https://upload.wikimedia.org/wikipedia/commons/f/fa/Leonardo_DiCaprio_2017.jpg',
      id: '18',
    ),
    MonobankUser(
      name: 'Kit',
      surname: 'Harington',
      phoneNumber: '+380675068787',
      cardNumber: '4149243153754114',
      httpImage:
          'https://upload.wikimedia.org/wikipedia/commons/3/32/Kit_harrington_by_sachyn_mital_%28cropped_2%29.jpg',
      id: '19',
    ),
    MonobankUser(
      name: 'Victoria',
      surname: 'Beckham',
      phoneNumber: '+380939721083',
      cardNumber: '4149537514924312',
      httpImage:
          'https://upload.wikimedia.org/wikipedia/commons/e/eb/Victoria_Beckham_%28Headshot%29.jpg',
      id: '20',
    ),
    MonobankUser(
      name: 'David',
      surname: 'Beckham',
      phoneNumber: '+380956739955',
      cardNumber: '5375263075537526',
      httpImage:
          'https://upload.wikimedia.org/wikipedia/commons/1/14/Deadpool_2_Japan_Premiere_Red_Carpet_Ryan_Reynolds_%28cropped%29.jpg',
      id: '21',
    ),
    MonobankUser(
      phoneNumber: '+380956739955',
      cardNumber: '5375263075537526',
      id: '22',
    ),
  ];

  static List<MonobankUser> get users => _users;
}
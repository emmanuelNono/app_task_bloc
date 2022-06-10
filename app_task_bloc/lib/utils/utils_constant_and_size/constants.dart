import 'package:flutter/material.dart';

import '../../../responsive.dart';

class Constants {
  static String? myName = "";
  static String? myPseudo = "";
  static String? myMail = "";
  static String? myUserId = "";
  static String? myThumbnail = "";

  static String? myCurrentCountry = "france";
  static List<List<String>>? myListAllCategoriesAndTypes;

  static Map<int, Color> blueColor900Map() {
    return {
      50: const Color(0xFFFFD7C2),
      100: Colors.blue[100]!,
      200: Colors.blue[200]!,
      300: Colors.blue[300]!,
      400: Colors.blue[400]!,
      500: Colors.blue[500]!,
      600: Colors.blue[600]!,
      700: Colors.blue[700]!,
      800: Colors.blue[800]!,
      900: Colors.blue[900]!,
    };
  }
}

// class SortedByIntOrString {
//   static String sortedByInt = "entier";
//   static String sortedByString = "string";
// }

getChatRoomId(String a, String b) {
  if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
    // ignore: unnecessary_string_escapes
    return "$b\_$a";
  } else {
    // ignore: unnecessary_string_escapes
    return "$a\_$b";
  }
}

// list of background area, button, text and icons colors that we use in our app
const kColorBlueClear =  Color(0xFF42A5F5);
const kColorYellow = Color(0xFFFFEB3B);
const kColorPink = Color(0xFFff1493);
const kColorRed = Color(0xFFE57373);
const kColorIndigo = Color(0xFFBA68C8);
const kColorPurple = Color(0xFF673AB7);
const kColorOrange = Color(0xFFF57F17);
const kColorGreen = Color(0xFF66BB6A);
const kColorWhite = Color(0xFFFFFFFF);
const kColorDark = Color(0xFF000000);
const kColorClear = Color(0xFFF1EFF1);
const kColorLight = Color(0xFFD6D6D6);
const kColorGrey = Color(0xFF9E9E9E);
const kColorDarkGrey = Color(0xFF3A3838);
const kColorLightGrey = Color(0xFFFAFAFA);

// list of divider color
const kDividerColorgrey = Color(0xFF757575);

//padding: 20
const defaultPadding = 20.0;

//size icon: 25
const defaultSize = 20.0;

//shadow
const defaultShadow = BoxShadow(
  offset: Offset(0, 15),
  blurRadius: 27,
  color: Colors.black12, // Black color with 12% opacity
);

//--------------------------------

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

//cette extention pemet le formatage des chaine de xre
extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${substring(1)}';
  String get allInCaps => toUpperCase();

  //ici je recup un 'str', a partir de 'str' crée une list de String à chaque xre espace " "
  //je fais une map sur cette list et je return chaque elt de la list avec le 1er xre en Majuscule

//voir: => https://coflutter.com/dart-flutter-how-to-capitalize-first-letter-of-each-word-in-a-string/
  String get capitalizeFirstLetterOfEachWord {
    if (length <= 1) {
      return toUpperCase();
    }

    // Split string into multiple words
    final List<String> words = split(' ');

    // Capitalize first letter of each words
    final capitalizedWords = words.map((word) {
      if (word.trim().isNotEmpty) {
        final String firstLetter = word.trim().substring(0, 1).toUpperCase();
        final String remainingLetters = word.trim().substring(1);

        return '$firstLetter$remainingLetters';
      }
      return '';
    });

    // Join/Merge all words back to one String
    return capitalizedWords.join(' ');
  }

  //cette fct met en majuscule les 1er, 2eme et 3eme xre du nom de l'équipe.
  //Exp: FC Barcelone, AC Milan,
  String get capitalizeAbreviation {
    if (trim().isEmpty) return "";

//recup le 1er et le dernier elt dans la chaine
    var list = split(" ");
    var first = list.first;
    var last = list.last;

    String str1;
    List<String> middle = [];

//si avant le premier xre espace, on a 1, 2, ou 3 xre alors on les met tous en majuscule
    if (first.length <= 3) {
      str1 = "${first.allInCaps} ${last.inCaps}";
    } else {
      //si après le dernier xre espace, on a  1 ou 2 xre alors on met ces derniers xre tous en majuscule
      if (last.length <= 3) {
        //on recup tt les xres compris avant le 1er espace ==> _first
        //on recup tt les xres compris après le dernier espace ==> _last
        //middle represente ts les xre compris entre first et last
        for (var i = 1; i < list.length - 1; i++) {
          middle.add(list[i]);
        }
        str1 =
            "${first.inCaps} ${middle.isNotEmpty ? middle.map((e) => e.inCaps).join(" ") : ''} ${last.allInCaps}";
      } else {
        str1 = capitalizeFirstLetterOfEachWord;
      }
    }
    return str1;
  }
}

/*
Après avoir utilisé String.split pour créer le List (l'équivalent Dart d'un tableau), nous avons un List<String>. 
Si vous voulez utiliser le List<String> à l'intérieur d'un ListView , vous aurez besoin d'un Widget qui affiche le texte. 
Vous pouvez simplement utiliser un widget Text .

Les fonctions suivantes peuvent vous y aider:

String.split: Pour diviser le String pour créer le List
List<String>.map: Mappez le String à un widget
Iterable<Widget>.toList: Convertissez le Map en List
 */

//obtenir le nbre d'occurence d'un caractere ds une chaine
int nbOccurenceString(String chaine, String car) {
  int i, nbOcc = 0;
  int size = chaine.length; // taille de la chaine

  for (i = 0; i < size; i++) {
    // si le caractère à l'index [i] est bien le caractère recherché
    if (chaine.split('')[i] == car) {
      nbOcc++; // on incrémente le compteur
    }
  }

  return nbOcc; // on renvoie le compteur
}

double customSizeImageSmall(BuildContext context) {
  return Responsive.isMobile(context)
      ? defaultSize
      : Responsive.isTablet(context)
          ? defaultSize * 1.5
          : defaultSize * 2;
}

double customSizeImageMedium(BuildContext context) {
  return Responsive.isMobile(context)
      ? defaultSize * 2
      : Responsive.isTablet(context)
          ? defaultSize * 3
          : defaultSize * 4;
}

double customSizeImageLarge(BuildContext context) {
  return Responsive.isMobile(context)
      ? defaultSize * 4
      : Responsive.isTablet(context)
          ? defaultSize * 4.5
          : defaultSize * 6;
}

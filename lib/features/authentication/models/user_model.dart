import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/enums.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/formatters/formatter.dart';

class UserModel {
  final String? id;
      String username,
      email,
      firstName,
      lastName,
      phoneNumber,
      profilePicture;
      AppRole role;
      DateTime? createdAt;
      DateTime? updatedAt;

  UserModel({
    this.id,
     this.username = '',
    required this.email,
     this.firstName = '',
     this.lastName = '',
     this.phoneNumber = '',
     this.profilePicture = '',
     this.role = AppRole.user,
     this.createdAt,
     this.updatedAt,
  });

//helper functions
  String get fullName => '$firstName $lastName';
  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);
  String get formattedDate => TFormatter.formatDate(createdAt);
  String get formattedUpdateAtDate => TFormatter.formatDate(updatedAt);


  static List<String> nameParts(fullName) => fullName.split(" ");

  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "cwt_$camelCaseUsername";

    return usernameWithPrefix;
  }

//static function to create an empty user model
  static UserModel empty() => UserModel(
      email: '',);

//convert model to json structure for storing data in firebase
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
      'role': role.name.toString(),
      'createdAt': createdAt,
      'updatedAt': updatedAt = DateTime.now()
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    if (data == null) {
      return empty();
    }
    return UserModel(
      id: document.id,
      username: data.containsKey('UserName') ? data['UserName'] ?? '' : '',
      email: data.containsKey('Email') ? data['Email'] ?? '' : '',
      firstName: data.containsKey('FirstName') ? data['FirstName'] ?? '' : '',
      lastName: data.containsKey('LastName') ? data['LastName'] ?? '' : '',
      phoneNumber: data.containsKey('PhoneNumber') ? data['PhoneNumber'] ?? '' : '',
      profilePicture: data.containsKey('ProfilePicture') ? data['ProfilePicture'] ?? '' : '',
      role: data.containsKey('Role') ? (data['Role'] ?? AppRole.user) == AppRole.admin.name.toString() ? AppRole.admin : AppRole.user : AppRole.user,
      createdAt: data.containsKey('CreatedAt') ? data['CreatedAt']?.toDate() ?? DateTime.now() : DateTime.now(),
      updatedAt: data.containsKey('UpdatedAt') ? data['UpdatedAt']?.toDate() ?? DateTime.now() : DateTime.now(),
    );
  }
}



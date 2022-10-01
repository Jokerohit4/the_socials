import '../app.dart';

class UserField {
  static final String lastMessageTime = 'lastMessageTime';
}

class Users {
  final String idUser;
  final String name;
  final String urlAvatar;
  final DateTime? lastMessageTime;

  const Users({
    required this.idUser,
    required this.name,
    required this.urlAvatar,
    required this.lastMessageTime,
  });

  Users copyWith({
    required String idUser,
    required String name,
    required String urlAvatar,
    required String lastMessageTime,
  }) =>
      Users(
        idUser: idUser ?? this.idUser,
        name: name ?? this.name,
        urlAvatar: urlAvatar ?? this.urlAvatar,
        lastMessageTime: lastMessageTime as DateTime,
      );

  static Users fromJson(Map<String, dynamic> json) => Users(
        idUser: json['idUser'],
        name: json['name'],
        urlAvatar: json['urlAvatar'],
        lastMessageTime: Utils.toDateTime(json['lastMessageTime']),
      );

  Map<String, dynamic> toJson() => {
        'idUser': idUser,
        'name': name,
        'urlAvatar': urlAvatar,
        'lastMessageTime': Utils.fromDateTimeToJson(lastMessageTime!),
      };
}

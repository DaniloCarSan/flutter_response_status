class UserEntityLabels {
  static String userCode = 'USER_CODE';
  static String userEmail = 'USER_EMAIL';
  static String userPassword = 'USER_PASSWORD';

  static List<String> toList()=>[
    userCode,
    userEmail,
    userPassword 
  ];

}

class UserEntity{

  final int? userCode;
  final String userEmail;
  final String? userPassword;

  UserEntity({
    this.userCode,
    required this.userEmail,
    this.userPassword
  });

  UserEntity copyWith({
   int? userCode,
   String? userEmail,
   String? userPassword,
  })=>UserEntity(
    userCode: userCode ?? this.userCode,
    userEmail: userEmail ?? this.userEmail,
    userPassword: userPassword ?? this.userPassword
  );

  UserEntity.fromJson(Map<String,dynamic>json):
    userCode=json[UserEntityLabels.userCode],
    userEmail=json[UserEntityLabels.userEmail],
    userPassword=json[UserEntityLabels.userPassword]
  ;

  Map<String,dynamic>toJson({List<dynamic>? getKeys , List<dynamic>?  notKeys }){

    Map<String,dynamic> map = {
      UserEntityLabels.userCode:userCode,
      UserEntityLabels.userEmail:userEmail,
      UserEntityLabels.userPassword:userPassword
    };

    if(getKeys != null )
    {
      map.removeWhere((k,v)=> ! getKeys.contains(k));
    }

    if(notKeys  != null )
    {
      map.removeWhere((k,v)=>notKeys.contains(k));
    }

    return map;
  }
  

  List<dynamic> toList()=>[
    userCode,
    userEmail,
    userPassword
  ];

}
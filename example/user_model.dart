class UserModelLabels {
  static String userCode = 'USER_CODE';
  static String userEmail = 'USER_EMAIL';
  static String userPassword = 'USER_PASSWORD';

  static List<String> toList()=>[
    userCode,
    userEmail,
    userPassword 
  ];

}

class UserModel{

  final int userCode;
  final String userEmail;
  final String userPassword;

  UserModel({
    this.userCode,
    this.userEmail,
    this.userPassword
  });

  UserModel copyWith({
   int userCode,
   String userEmail,
   String userPassword,
  })=>UserModel(
    userCode: userCode ?? this.userCode,
    userEmail: userEmail ?? this.userEmail,
    userPassword: userPassword ?? this.userPassword
  );

  UserModel.fromJson(Map<String,dynamic>json):
    this.userCode=json[UserModelLabels.userCode],
    this.userEmail=json[UserModelLabels.userEmail],
    this.userPassword=json[UserModelLabels.userPassword]
  ;

  Map<String,dynamic>toJson({List<dynamic> getKeys , List<dynamic>  notKeys }){

    Map<String,dynamic> map = {
      UserModelLabels.userCode:this.userCode,
      UserModelLabels.userEmail:this.userEmail,
      UserModelLabels.userPassword:this.userPassword
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
    this.userCode,
    this.userEmail,
    this.userPassword
  ];

}
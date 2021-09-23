import '../lib/flutter_response_status.dart';
import 'user_entity.dart';
import 'dart:convert' as convert;

class AuthRepositoryExternal{

   Future<ResponseStatus<String,UserEntity>> signIn(email,password) async {
    try 
    {
      //Response structure
      /*
       {
        requestStatus:true,
        actionStatus:true
        message:"Login success",
        code:"LOGIN_SUCCESS",
        data:{userCode:1,userName:'Danilo Santos',userEmail:'danilocarsan@gmail.com'}
      }
      */
      
      var dio =  Dio();
      var endpoint = 'auth/sign/in';
      var response = await dio.post(endpoint,data:{
        UserEntityLabels.userEmail:email,
        UserEntityLabels.userPassword:password
      });
  
      Map<String,dynamic> json = convert.jsonDecode(response.data);
      
      ResponseStatus res = ResponseStatus.fromJson(json);
      
      var responseUserEntity = res.copyWith<String,UserEntity>();

      if (res.status)
      {
        responseUserEntity.setData(UserEntity.fromJson(res.data));
      }
      
      return responseUserEntity;
    }
    catch (e)
    {
      return ResponseStatus(false,false,"No connected the server ",code:"SERVER_ERROR",dataError:e);
    }
  }

main(){

  AuthRepositoryExternal authRep = new AuthRepositoryExternal();

  authRep.signIn('danilocarsan@gmail.com','123456').then((response){
    print(response.status);
    print(response.requestStatus);
    print(response.actionStatus);
    print(response.message);
    print(response.code);
    print(response.data);
    print(response.data?.userEmail);
    print(response.dataError);
  });

}
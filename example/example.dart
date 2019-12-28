import '../lib/flutter_response_status.dart';
import 'user_model.dart';
import 'dart:convert' as convert;

class AuthRepositoryExternal{

   Future<ResponseStatus<String,UserModel>> signIn(email,password) async {
    try 
    {
      //Response structure
      /*
       {
        status:true,
        message:"Login success",
        code:"LOGIN_SUCCESS",
        data:{userCode:1,userName:'Danilo Santos',userEmail:'danilocarsan@gmail.com'}
      }
      */
      
      var dio =  Dio();
      var endpoint = 'auth/sign/in';
      var response = await dio.post(endpoint,data:{
        UserModelLabels.userEmail:email,
        UserModelLabels.userPassword:password
      });
  
      Map<String,dynamic> json = convert.jsonDecode(response.data);
      
      ResponseStatus res = ResponseStatus.fromJson(json);
      
      var responseUserModel = res.copyWith<String,UserModel>();

      if (res.status)
      {
        responseUserModel.setData(UserModel.fromJson(res.data));
      }
      
      return responseUserModel;
    }
    catch (e)
    {
      return ResponseStatus(false,"No connected the server ",code:"SERVER_ERROR",dataError:e);
    }
  }

main(){

  AuthRepositoryExternal authRep = new AuthRepositoryExternal();

  authRep.signIn('danilocarsan@gmail.com','123456').then((response){
    print(response.status);
    print(response.message);
    print(response.code);
    print(response.data);
    print(response.data.userEmail);
    print(response.dataError);
  });

}
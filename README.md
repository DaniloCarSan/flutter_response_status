# flutter_response_status

Flutter_response_status is a package that to standardize responses in dart.
 
# Example the use
````
class AuthRepositoryExternal{

   Future<ResponseStatus<String,UserModel>> signIn(email,password) async {
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
    print(response.data.userEmail);
    print(response.dataError);
  });

}

````

## Getting Started

For help getting started with Flutter, view 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

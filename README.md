# flutter_response_status

A new flutter package to responses in dart .

# Example the use
````
class AuthRepositoryExternal{

   Future<ResponseStatus<String,UserModel,Exception>> signIn(email,password) async {
    try 
    {
      //Response structure
      /*
       {
        status:true,
        message:"Login success",
        code:"LOGIN_SUCCESS",
        data:{userName:'Danilo Santos',userEmail:'danilocarsan@gmail.com'}
      }
      */
      
      var dio =  Dio();
      var endpoint = 'auth/sign/in';
      var response = await dio.post(endpoint,data:{});
  
      Map<String,dynamic> json = convert.jsonDecode(response.data);
      
      ResponseStatus res = ResponseStatus.fromJson(json);
      
      var responseUserModel = Response(res.status,res.message,code:res.code);

      if (responseStatus.status)
      {
        UserModel UsuarioModel = UsuarioModel.fromJson(responseStatus.data);
        responseUserModel.setData(UsuarioModel);
      }
      
      return responseUserModel;
    }
    catch (e)
    {
      return ResponseStatus(false,"No connected the server ",code:"SERVER_ERROR",dataError:e);
    }
  }
  
  ````

## Getting Started

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

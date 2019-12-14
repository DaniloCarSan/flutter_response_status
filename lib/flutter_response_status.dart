library flutter_response_status;

class ResponseStatusFields {
  static String status = "status";
  static String message = "message";
  static String code = "code";
  static String data = "data";
  static String dataError = "dataError";
}

class ResponseStatus<T1, T2, T3> {
  bool status;
  String message;
  T1 code;
  T2 data;
  T3 dataError;

  ResponseStatus(this.status, this.message, {this.code, this.data, this.dataError});

  ResponseStatus.fromJson(Map<String, dynamic> json):
      this.status = json[ResponseStatusFields.status],
      this.message = json[ResponseStatusFields.message],
      this.code = json[ResponseStatusFields.code],
      this.data = json[ResponseStatusFields.data],
      this.dataError = json[ResponseStatusFields.dataError]
  ;

  //Status the response success or falid
  void setStatus(bool status){
    this.status=status;
  }

  // Message the response
  void setMessage(String message){
    this.message = message;
  }

  // Code the response
  void setCode(T1 code){
    this.code = code;
  }

  // Data the response
  setData(T2 data){
    this.data = data;
  }
  //Error data the response
  setDataError(T3 dataError){
    this.dataError = dataError;
  }

}



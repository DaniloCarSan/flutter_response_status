class ResponseStatusFields {
  static String requestStatus= "requestStatus";
  static String actionStatus = "actionStatus";
  static String message = "message";
  static String code = "code";
  static String data = "data";
  static String dataError = "dataError";
}

class ResponseStatus<T1, T2> {
  bool requestStatus;
  bool actionStatus;
  String message;
  T1? code;
  T2? data;
  dynamic dataError;

  ResponseStatus(this.requestStatus,this.actionStatus,this.message,{this.code, this.data, this.dataError});

  ResponseStatus.fromJson(Map<String, dynamic> json): 
    requestStatus = json[ResponseStatusFields.requestStatus],
    actionStatus = json[ResponseStatusFields.actionStatus],
    message = json[ResponseStatusFields.message],
    code = json[ResponseStatusFields.code],
    data = json[ResponseStatusFields.data],
    dataError = json[ResponseStatusFields.dataError];

  ResponseStatus<T1,T2> copyWith<T1,T2>({
    bool? requestStatus,
    bool? actionStatus,
    String? message,
  }) =>ResponseStatus<T1,T2>(
    requestStatus ?? this.requestStatus,
    actionStatus ?? this.actionStatus,
    message ?? this.message,
  );

  bool get status => requestStatus && actionStatus; 
  bool get statusError => !actionStatus && !requestStatus; 
  bool get statusRequest => requestStatus && !actionStatus; 
  bool get statusAction => !requestStatus && actionStatus; 

  //Status the response success or falid
  void setRequestStatus(bool requestStatus) {
    this.requestStatus = requestStatus;
  }

  void setActionStatus(bool actionStatus) {
    this.actionStatus = actionStatus;
  }

  // Message the response
  void setMessage(String message) {
    this.message = message;
  }

  // Code the response
  void setCode(T1 code) {
    this.code = code;
  }

  // Data the response
  void setData(T2 data) {
    this.data = data;
  }

  //Error data the response
  void setDataError(dynamic dataError) {
    this.dataError = dataError;
  }

  getData() {
    return data;
  }
}
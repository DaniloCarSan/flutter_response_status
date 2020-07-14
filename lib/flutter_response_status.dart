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
  T1 code;
  T2 data;
  dynamic dataError;

  ResponseStatus(this.requestStatus,this.actionStatus,this.message,{this.code, this.data, this.dataError});

  ResponseStatus.fromJson(Map<String, dynamic> json): 
    this.requestStatus = json[ResponseStatusFields.requestStatus],
    this.actionStatus = json[ResponseStatusFields.actionStatus],
    this.message = json[ResponseStatusFields.message],
    this.code = json[ResponseStatusFields.code],
    this.data = json[ResponseStatusFields.data],
    this.dataError = json[ResponseStatusFields.dataError];

  ResponseStatus<T3, T4> copyWith<T3, T4>({
    bool requestStatus,
    bool actionStatus,
    String message,
    T3 code,
    T4 data,
  }) =>ResponseStatus<T3, T4>(
    requestStatus ?? this.requestStatus,
    actionStatus ?? this.actionStatus,
    message ?? this.message,
    code: code ?? this.code,
    data: data
  );

  bool get status => this.requestStatus && this.actionStatus; 
  bool get statusError => !this.actionStatus && !this.requestStatus; 
  bool get statusRequest => this.requestStatus && !this.actionStatus; 
  bool get statusAction => !this.requestStatus && this.actionStatus; 

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
}

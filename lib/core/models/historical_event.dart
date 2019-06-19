class HistoricalEvent {
  int _id;
  String _title;
  String _eventDateUtc;
  int _eventDateUnix;
  int _flightNumber;
  String _details;
  Links _links;

  HistoricalEvent(
      {int id,
      String title,
      String eventDateUtc,
      int eventDateUnix,
      int flightNumber,
      String details,
      Links links}) {
    this._id = id;
    this._title = title;
    this._eventDateUtc = eventDateUtc;
    this._eventDateUnix = eventDateUnix;
    this._flightNumber = flightNumber;
    this._details = details;
    this._links = links;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get title => _title;
  set title(String title) => _title = title;
  String get eventDateUtc => _eventDateUtc;
  set eventDateUtc(String eventDateUtc) => _eventDateUtc = eventDateUtc;
  int get eventDateUnix => _eventDateUnix;
  set eventDateUnix(int eventDateUnix) => _eventDateUnix = eventDateUnix;
  int get flightNumber => _flightNumber;
  set flightNumber(int flightNumber) => _flightNumber = flightNumber;
  String get details => _details;
  set details(String details) => _details = details;
  Links get links => _links;
  set links(Links links) => _links = links;

  HistoricalEvent.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _eventDateUtc = json['event_date_utc'];
    _eventDateUnix = json['event_date_unix'];
    _flightNumber = json['flight_number'];
    _details = json['details'];
    _links = json['links'] != null ? new Links.fromJson(json['links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['title'] = this._title;
    data['event_date_utc'] = this._eventDateUtc;
    data['event_date_unix'] = this._eventDateUnix;
    data['flight_number'] = this._flightNumber;
    data['details'] = this._details;
    if (this._links != null) {
      data['links'] = this._links.toJson();
    }
    return data;
  }
}

class Links {
  String _reddit;
  String _article;
  String _wikipedia;

  Links({String reddit, String article, String wikipedia}) {
    this._reddit = reddit;
    this._article = article;
    this._wikipedia = wikipedia;
  }

  String get reddit => _reddit;
  set reddit(String reddit) => _reddit = reddit;
  String get article => _article;
  set article(String article) => _article = article;
  String get wikipedia => _wikipedia;
  set wikipedia(String wikipedia) => _wikipedia = wikipedia;

  Links.fromJson(Map<String, dynamic> json) {
    _reddit = json['reddit'];
    _article = json['article'];
    _wikipedia = json['wikipedia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reddit'] = this._reddit;
    data['article'] = this._article;
    data['wikipedia'] = this._wikipedia;
    return data;
  }
}

/// total_count : 16596082
/// incomplete_results : true
/// items : [{"id":17359115,"name":"a","full_name":"fmtn/a","owner":{"login":"fmtn","id":15344772,"node_id":"MDEyOk9yZ2FuaXphdGlvbjE1MzQ0Nzcy","avatar_url":"https://avatars.githubusercontent.com/u/15344772?v=4","url":"https://api.github.com/users/fmtn"}}]

class RepoListResponse {
  RepoListResponse({
      num? totalCount, 
      bool? incompleteResults, 
      List<Items>? items,}){
    _totalCount = totalCount;
    _incompleteResults = incompleteResults;
    _items = items;
}

  RepoListResponse.fromJson(dynamic json) {
    _totalCount = json['total_count'];
    _incompleteResults = json['incomplete_results'];
    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(Items.fromJson(v));
      });
    }
  }
  num? _totalCount;
  bool? _incompleteResults;
  List<Items>? _items;
RepoListResponse copyWith({  num? totalCount,
  bool? incompleteResults,
  List<Items>? items,
}) => RepoListResponse(  totalCount: totalCount ?? _totalCount,
  incompleteResults: incompleteResults ?? _incompleteResults,
  items: items ?? _items,
);
  num? get totalCount => _totalCount;
  bool? get incompleteResults => _incompleteResults;
  List<Items>? get items => _items;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total_count'] = _totalCount;
    map['incomplete_results'] = _incompleteResults;
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 17359115
/// name : "a"
/// full_name : "fmtn/a"
/// owner : {"login":"fmtn","id":15344772,"node_id":"MDEyOk9yZ2FuaXphdGlvbjE1MzQ0Nzcy","avatar_url":"https://avatars.githubusercontent.com/u/15344772?v=4","url":"https://api.github.com/users/fmtn"}

class Items {
  Items({
      num? id, 
      String? name, 
      String? fullName, 
      Owner? owner,}){
    _id = id;
    _name = name;
    _fullName = fullName;
    _owner = owner;
}

  Items.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _fullName = json['full_name'];
    _owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null;
  }
  num? _id;
  String? _name;
  String? _fullName;
  Owner? _owner;
Items copyWith({  num? id,
  String? name,
  String? fullName,
  Owner? owner,
}) => Items(  id: id ?? _id,
  name: name ?? _name,
  fullName: fullName ?? _fullName,
  owner: owner ?? _owner,
);
  num? get id => _id;
  String? get name => _name;
  String? get fullName => _fullName;
  Owner? get owner => _owner;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['full_name'] = _fullName;
    if (_owner != null) {
      map['owner'] = _owner?.toJson();
    }
    return map;
  }

}

/// login : "fmtn"
/// id : 15344772
/// node_id : "MDEyOk9yZ2FuaXphdGlvbjE1MzQ0Nzcy"
/// avatar_url : "https://avatars.githubusercontent.com/u/15344772?v=4"
/// url : "https://api.github.com/users/fmtn"

class Owner {
  Owner({
      String? login, 
      num? id, 
      String? nodeId, 
      String? avatarUrl, 
      String? url,}){
    _login = login;
    _id = id;
    _nodeId = nodeId;
    _avatarUrl = avatarUrl;
    _url = url;
}

  Owner.fromJson(dynamic json) {
    _login = json['login'];
    _id = json['id'];
    _nodeId = json['node_id'];
    _avatarUrl = json['avatar_url'];
    _url = json['url'];
  }
  String? _login;
  num? _id;
  String? _nodeId;
  String? _avatarUrl;
  String? _url;
Owner copyWith({  String? login,
  num? id,
  String? nodeId,
  String? avatarUrl,
  String? url,
}) => Owner(  login: login ?? _login,
  id: id ?? _id,
  nodeId: nodeId ?? _nodeId,
  avatarUrl: avatarUrl ?? _avatarUrl,
  url: url ?? _url,
);
  String? get login => _login;
  num? get id => _id;
  String? get nodeId => _nodeId;
  String? get avatarUrl => _avatarUrl;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['login'] = _login;
    map['id'] = _id;
    map['node_id'] = _nodeId;
    map['avatar_url'] = _avatarUrl;
    map['url'] = _url;
    return map;
  }

}
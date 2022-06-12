import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _roleType = prefs.getStringList('ff_roleType') ?? _roleType;
  }

  SharedPreferences prefs;

  DocumentReference contentCelebId;

  List<String> uploadedMediaImage = [];

  List<String> uploadedMediaVideo = [];

  DateTime chronoDate;

  bool isSelected = false;

  bool isImageAdded = false;

  bool isVideoAdded = false;

  bool isActive = false;

  List<String> _roleType = [
    'Superadmin',
    'Admin',
    'Celeb Manager',
    'Content Manager'
  ];
  List<String> get roleType => _roleType;
  set roleType(List<String> _value) {
    _roleType = _value;
    prefs.setStringList('ff_roleType', _value);
  }

  void addToRoleType(String _value) {
    _roleType.add(_value);
    prefs.setStringList('ff_roleType', _roleType);
  }

  void removeFromRoleType(String _value) {
    _roleType.remove(_value);
    prefs.setStringList('ff_roleType', _roleType);
  }
}

LatLng _latLngFromString(String val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

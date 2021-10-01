import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MyProvider with ChangeNotifier{

  InAppWebViewController controllerHome ;
  setControllerHome(InAppWebViewController _controllerHome){
    controllerHome = _controllerHome;
    notifyListeners();
  }

  Uri uri = Uri.parse('https://www.islamweb.net/ar/');
  setUriHome(Uri _uri){
    uri = _uri;
    notifyListeners();
  }

  int progressHome = 0;
  setProgressHome(int _progress){
    progressHome = _progress;
    notifyListeners();
  }




  String searchField;
  setSearchField(String _searchField){
    searchField = _searchField;
    notifyListeners();
  }

  InAppWebViewController controllerSearch ;
  setControllerSearch(InAppWebViewController _controllerSearch){
    controllerSearch = _controllerSearch;
    notifyListeners();
  }

  Uri uriSearch = Uri.parse('https://www.islamweb.net/ar/');
  setUriSearch(Uri _uri){
    uriSearch = _uri;
    notifyListeners();
  }
  int progressSearch = 0;
  setProgressSearch(int _progressSearch){
    progressSearch = _progressSearch;
    notifyListeners();
  }



}
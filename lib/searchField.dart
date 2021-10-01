import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wepview_app/provider.dart';

class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<MyProvider>(context ,listen: false);
    final provLis = Provider.of<MyProvider>(context);
    return TextFormField(
      onChanged: (val){
        prov.setSearchField(val.toString());
      },
      textInputAction: TextInputAction.search,
      onFieldSubmitted: (val){

        prov.controllerSearch.evaluateJavascript(source: "document.getElementsByClassName('amobile nav-menu')[0].click();");
        prov.controllerSearch.evaluateJavascript(source: "document.getElementsByClassName('fa fa-search')[0].click();");
        prov.controllerSearch.evaluateJavascript(source: "document.getElementsByClassName('srbartext')[0].value ='${provLis.searchField}';");
        prov.controllerSearch.evaluateJavascript(source: "document.getElementsByClassName('srbarsubmit')[0].click();");

      },
    );
  }
}

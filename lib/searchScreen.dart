import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';
import 'package:wepview_app/provider.dart';
import 'package:wepview_app/searchField.dart';

class SearchScreen extends StatelessWidget {

  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        disableHorizontalScroll: false,
        disableVerticalScroll: false,
        supportZoom: false,
        verticalScrollBarEnabled: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<MyProvider>(context);
    final provLis = Provider.of<MyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: SearchField(),
      ),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(url: prov.uriSearch),
            initialOptions: options,
            onWebViewCreated: (InAppWebViewController _controller){
              prov.setControllerSearch(_controller);
            },
            onLoadStart: (InAppWebViewController _controller ,Uri _uri){
              prov.setUriSearch(_uri);
            },
            onLoadStop: (InAppWebViewController _controller ,Uri _uri){
              prov.setUriSearch(_uri);
            },
            onProgressChanged: (InAppWebViewController _controller ,int _progress){

              prov.controllerSearch.evaluateJavascript(source: "document.getElementById('animg1').style.display = 'none';");
              prov.controllerSearch.evaluateJavascript(source: "document.getElementById('appimg1').style.display = 'none';");

            },
          ),


          if (prov.uriSearch == Uri.parse('https://www.islamweb.net/ar/') )
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.grey[200],
              alignment: Alignment.center,
              child: Icon(Icons.search, size: 100),
            ),


        ],
      )
    );
  }
}

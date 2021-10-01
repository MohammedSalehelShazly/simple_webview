import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';
import 'package:wepview_app/provider.dart';
import 'package:wepview_app/searchScreen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {



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
    final prov = Provider.of<MyProvider>(context ,listen: false);
    final provLis = Provider.of<MyProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: IconButton(
          icon: Icon(Icons.search),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)
                =>SearchScreen()
            ));
          },
        ),
        actions: [Text(provLis.searchField==null ?'' :provLis.searchField)],
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: prov.uri),
        initialOptions: options,

        onWebViewCreated: (InAppWebViewController _controller){
          prov.setControllerHome(_controller);

        },

        onLoadStart: (InAppWebViewController _controller ,Uri _uri){
          prov.setUriHome(_uri);
        },

        onLoadStop: (InAppWebViewController _controller ,Uri _uri){
          prov.setUriHome(_uri);
        },

        onProgressChanged: (InAppWebViewController _controller ,int _progress){

          prov.controllerHome.evaluateJavascript(source: "document.getElementById('animg1').style.display = 'none';");
          prov.controllerHome.evaluateJavascript(source: "document.getElementById('appimg1').style.display = 'none';");

          prov.controllerHome.evaluateJavascript(source: "document.getElementsByClassName('amobile nav-menu')[0].style.display ='none';");

          prov.setProgressHome(_progress);
        },

      ),
    );
  }
}























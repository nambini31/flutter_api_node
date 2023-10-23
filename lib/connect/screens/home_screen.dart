import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_api_node/connect/models/api_response.dart';
import 'package:flutter_api_node/connect/services/connect_bridge_services.dart';
import 'package:flutter_api_node/connect/services/user_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    void _connectToBridgeToRedirect() async{
        ApiResponse apiResponse = await connectToBridge();
        if(apiResponse.error == null){
            Map<String, dynamic>? dataMap = apiResponse.data as Map<String, dynamic>?;
            String redirectUrl = dataMap!['redirect_url'];
            final Uri uri = Uri.parse(redirectUrl);
            _launchURL(uri);
        }
    }

    Future<void> _launchURL(Uri url) async {
        if(!await launchUrl(url)){
            throw 'Could not launch $url';
        }
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Home Screen'),
            actions: [
                IconButton(
                    onPressed: () {
                        logout().then((value) => Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false));
                    },
                  icon: const Icon(Icons.logout)
                )
            ]
        ),
        body: Center(
            child: ElevatedButton(
                child: Text("Connect to Bridge"),
                onPressed: () {
                    _connectToBridgeToRedirect();
                },
            ),
        ),
    );
  }
}
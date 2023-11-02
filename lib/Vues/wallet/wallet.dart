import 'package:flutter/material.dart';

class MyWallet {
  static AlertDialog getWalletDialog(BuildContext context) {
    return AlertDialog(
      title: Text('Mon Wallet'),
      content: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Rechercher dans le portefeuille',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 30),
          Card(
            child: ListTile(
              leading: Image.asset('assets/images/bitvavo_logo.png'), 
             
              
            ),
          ),
          SizedBox(height: 30),
          Card(
            child: ListTile(
              leading: Image.asset('assets/images/binance_logo.png'), 
              
            ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Suivant'),
        ),
      ],
    );
  }
}

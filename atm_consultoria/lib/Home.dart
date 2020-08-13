import 'package:flutter/material.dart';
import 'package:atm_consultoria/AboutUsScreen.dart';

class Home extends StatelessWidget {
  void _navigate(BuildContext context, int screenValue) {
    switch (screenValue) {
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AboutUsScreen(),
          ),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AboutUsScreen(),
          ),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AboutUsScreen(),
          ),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AboutUsScreen(),
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text("ATM Consultoria"),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(50, 80, 50, 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image(
              image: AssetImage("images/logo.png"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => _navigate(context, 1),
                  child: Image(
                    height: 110,
                    image: AssetImage("images/menu_empresa.png"),
                  ),
                ),
                GestureDetector(
                  onTap: () => _navigate(context, 2),
                  child: Image(
                    height: 110,
                    image: AssetImage("images/menu_servico.png"),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => _navigate(context, 3),
                  child: Image(
                    height: 110,
                    image: AssetImage("images/menu_cliente.png"),
                  ),
                ),
                GestureDetector(
                  onTap: () => _navigate(context, 4),
                  child: Image(
                    height: 110,
                    image: AssetImage("images/menu_contato.png"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

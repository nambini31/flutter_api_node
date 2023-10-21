import 'package:flutter/material.dart';
import 'package:flutter_api_node/connect/utils/utils.dart';

class SplashScreen extends StatefulWidget {
    const SplashScreen({super.key});

    @override
    State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

    late AnimationController _controller;
    late Animation<Offset> imageanimation;

    @override
    void initState() {
        _controller = AnimationController(
            vsync: this,
            duration: const Duration(seconds: 2),
        );
        imageanimation = Tween<Offset>(
            begin: const Offset(0.0, 0.1),
            end: const Offset(0.0, 0.0))
            .animate(
                CurvedAnimation(
                    parent: _controller,
                    curve: const Interval(0.1, 0.4, curve: Curves.easeIn)
                )
            );
        _controller.forward();

        Future.delayed(const Duration(seconds: 3), () {
            Navigator.pushNamed(context, '/login');
        });

        super.initState();
    }

    @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Utils.backgroundColor,
                body: Stack(
                    children: [
                        _buildlogo(),
                    ],
                )
        );
    }

    Widget _buildlogo() {
        return SlideTransition(
            position: imageanimation,
            child: Center(
                child: Image.asset(Utils.getImagePath('winedge-logo.png'),width: 200,height: 200,)
            ),
        );
    }
}
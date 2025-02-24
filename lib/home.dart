import 'package:flutter/material.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double boxSize = screenWidth * 0.4;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red.shade900, Colors.redAccent.shade400],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              _buildServiceBox(
                context: context,
                title: "Plumber",
                route: '/plumber',
                icon: Icons.plumbing,
                size: boxSize,
              ),
              _buildServiceBox(
                context: context,
                title: "Mechanic",
                route: '/mechanic',
                icon: Icons.build,
                size: boxSize,
              ),
              _buildServiceBox(
                context: context,
                title: "Electrician",
                route: '/electrician',
                icon: Icons.electrical_services,
                size: boxSize,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServiceBox({
    required BuildContext context,
    required String title,
    required String route,
    required IconData icon,
    required double size,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 8,
              offset: Offset(4, 4),
            ),
          ],
          gradient: LinearGradient(
            colors: [Colors.red.shade100, Colors.redAccent.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: size * 0.15,
              child: Icon(icon, size: size * 0.25, color: Colors.white.withOpacity(0.9)),
            ),
            Positioned(
              bottom: size * 0.15,
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size * 0.15,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

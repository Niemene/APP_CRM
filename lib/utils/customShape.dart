import 'package:flutter/cupertino.dart';

class AppBarShape extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
    double width = size.width;
    double height = size.height;

    var path= Path();
    path.lineTo(0, height-40);
    path.quadraticBezierTo(width/2, height, width, height-40);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper){
    return false;
  }
}

class ShapeBottom extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
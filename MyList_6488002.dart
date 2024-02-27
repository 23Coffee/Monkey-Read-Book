import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Directionality(
      textDirection: TextDirection.ltr, // Change to TextDirection.rtl if needed
      child: MylistWidget(),
    ),
  ));
}
class MylistWidget extends StatelessWidget {
          @override
          Widget build(BuildContext context) {
          // Figma Flutter Generator MylistWidget - FRAME
            return Container(
      width: 428,
      height: 926,
      decoration: BoxDecoration(
          color : Color.fromRGBO(255, 255, 255, 1),
  ),
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 112,
        left: 33,
        child: Container(
        width: 362,
        height: 775,
        decoration: BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(44),
            topRight: Radius.circular(44),
            bottomLeft: Radius.circular(44),
            bottomRight: Radius.circular(44),
          ),
      color : Color.fromRGBO(217, 217, 217, 1),
  )
      )
      ),Positioned(
        top: 387,
        left: 50,
        child: Container(
        width: 328,
        height: 97,
        decoration: BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(44),
            topRight: Radius.circular(44),
            bottomLeft: Radius.circular(44),
            bottomRight: Radius.circular(44),
          ),
      color : Color.fromRGBO(0, 0, 0, 0.4000000059604645),
  )
      )
      ),Positioned(
        top: 281,
        left: 50,
        child: Container(
        width: 328,
        height: 97,
        decoration: BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(44),
            topRight: Radius.circular(44),
            bottomLeft: Radius.circular(44),
            bottomRight: Radius.circular(44),
          ),
      color : Color.fromRGBO(0, 0, 0, 0.4000000059604645),
  )
      )
      ),Positioned(
        top: 165,
        left: 142,
        child: Text('My Lists', textAlign: TextAlign.center, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Inter',
        fontSize: 32,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),Positioned(
        top: 420,
        left: 86,
        child: Text('Novel', textAlign: TextAlign.center, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Inter',
        fontSize: 26,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),Positioned(
        top: 314,
        left: 86,
        child: Text('Crime Story', textAlign: TextAlign.center, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Inter',
        fontSize: 26,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),Positioned(
        top: 493,
        left: 50,
        child: Container(
        width: 328,
        height: 97,
        decoration: BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(44),
            topRight: Radius.circular(44),
            bottomLeft: Radius.circular(44),
            bottomRight: Radius.circular(44),
          ),
      color : Color.fromRGBO(0, 0, 0, 0.4000000059604645),
  )
      )
      ),Positioned(
        top: 520,
        left: 86,
        child: Text('Harry Potter Series', textAlign: TextAlign.center, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Inter',
        fontSize: 28,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),Positioned(
        top: 599,
        left: 50,
        child: Container(
      width: 328,
      height: 97,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Container(
        width: 328,
        height: 97,
        decoration: BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(44),
            topRight: Radius.circular(44),
            bottomLeft: Radius.circular(44),
            bottomRight: Radius.circular(44),
          ),
      color : Color.fromRGBO(0, 0, 0, 0.4000000059604645),
  )
      )
      ),Positioned(
        top: 32,
        left: 36,
        child: Text('Historical', textAlign: TextAlign.center, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Inter',
        fontSize: 28,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),
        ]
      )
    )
      ),Positioned(
        top: 705,
        left: 50,
        child: Container(
      width: 328,
      height: 97,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Container(
        width: 328,
        height: 97,
        decoration: BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(44),
            topRight: Radius.circular(44),
            bottomLeft: Radius.circular(44),
            bottomRight: Radius.circular(44),
          ),
      color : Color.fromRGBO(0, 0, 0, 0.4000000059604645),
  )
      )
      ),Positioned(
        top: 32,
        left: 36,
        child: Text('Fantasy Novel ', textAlign: TextAlign.center, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Inter',
        fontSize: 28,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),
        ]
      )
    )
      ),Positioned(
        top: 168,
        left: 86,
        child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          image : DecorationImage(
          image: AssetImage('/images/Image13.png'),
          fit: BoxFit.fitWidth
      ),
  )
      )
      ),Positioned(
        top: 38,
        left: 181,
        child: Container(
        width: 65,
        height: 63,
        decoration: BoxDecoration(
          image : DecorationImage(
          image: AssetImage('/images/Image8.png'),
          fit: BoxFit.fitWidth
      ),
  )
      )
      ),Positioned(
        top: 811,
        left: 189,
        child: Container(
        width: 50,
        height: 54,
        decoration: BoxDecoration(
          image : DecorationImage(
          image: AssetImage('/images/Image34.png'),
          fit: BoxFit.fitWidth
      ),
  )
      )
      ),
        ]
      )
    );
          }
        }
        
import 'package:flutter/material.dart';

class BottomNavigationBarr extends StatelessWidget {
  Function(int)? onTap;
  int currentIndex = 0;

  BottomNavigationBarr({
    Key? key,
    required this.onTap,
    this.currentIndex = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.0),
        topRight: Radius.circular(30.0),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.black87.withOpacity(0.5),
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_pin,
              size: 25.0,
              color: Colors.grey,
            ),
            label: 'others',
            // backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              size: 25.0,
              color: Colors.grey,
            ),
            label: 'label',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: MaterialButton(
                // padding: EdgeInsets.symmetric(vertical: 5.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                color: Color(0xFF23B66F),
                onPressed: () => print('Upload photo'),
                child: Icon(
                  Icons.add,
                  size: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
            label: 'lebel',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
              size: 25.0,
              color: Colors.grey,
            ),
            label: 'lebel',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 25.0,
              color: Colors.grey,
            ),
            label: 'Home',
          ),
        ],
      ),
    );
  }
}

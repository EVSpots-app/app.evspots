
import 'package:flutter/material.dart';

class CustomInfoWindowWidget extends StatelessWidget {
  const CustomInfoWindowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 5),
      curve: Curves.easeInOut,
      padding: EdgeInsets.symmetric(
          horizontal: 10, vertical: 10),
      margin: EdgeInsets.only(top: 80),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white
        ),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Card(
                        margin: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          side:  BorderSide(
                            color: Colors.grey,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            '99-11255',
                            style: TextStyle(
                             // fontFamily: 'PoppinsBold',
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      // Spacer(),
                      SizedBox(width: 10),
                      Expanded(
                        child: Image.asset(
                          'assets/images/EVStation2.jpg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 2, top: 5),
                  child: Text(
                    'e-tron GT quattro.',
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/pic1.jpg'),
                ),
                Expanded(
                  child: Text(
                    'Motasem Altamimi ',
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.white,
                     // fontFamily: 'PoppinsMedium',
                      fontSize:15,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
/*
image*
name*
vehicle
vehicle license plate
vehicle type
 */

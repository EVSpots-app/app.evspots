import 'package:courier/constants/app_colors.dart';
import 'package:courier/constants/app_dimensions.dart';
import 'package:courier/constants/app_fonts.dart';
import 'package:flutter/material.dart';

class CustomInfoWindowWidget extends StatelessWidget {
  const CustomInfoWindowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.w10, vertical: Dimensions.h10),
      margin: EdgeInsets.only(top: Dimensions.w80),
      decoration: BoxDecoration(
        color: AppColors.offBlack.withOpacity(0.95),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.white,
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
                          side: const BorderSide(
                            color: AppColors.offGrey,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(Dimensions.w5),
                          child: Text(
                            '99-11255',
                            style: AppFont.style(
                              fontFamily: 'PoppinsBold',
                              fontSize: Dimensions.w16,
                            ),
                          ),
                        ),
                      ),
                      // Spacer(),
                      SizedBox(width: Dimensions.w10),
                      Expanded(
                        child: Image.asset(
                          'assets/images/home/car2.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 2, top: Dimensions.h5),
                  child: Text(
                    'e-tron GT quattro.',
                    maxLines: 1,
                    style: AppFont.style(
                      color: AppColors.offGrey,
                      fontSize: Dimensions.w12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: Dimensions.h5),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/basket/Courier.png'),
                ),
                Expanded(
                  child: Text(
                    'Khaled waled ',
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: AppFont.style(
                      color: AppColors.offWhite,
                      fontFamily: 'PoppinsMedium',
                      fontSize: Dimensions.w15,
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

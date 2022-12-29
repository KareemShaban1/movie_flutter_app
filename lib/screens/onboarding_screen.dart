import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_app_ui/components/custom_outline.dart';
import 'package:movie_app_ui/constants.dart';
import 'package:movie_app_ui/screens/home_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constants.kBlackColor,
      body: Container(
        height: screenHeight,
        width: screenWidth,
        
        child: Stack(
          children: [

            Positioned(
              top: screenHeight * 0.1,
              left : -88,
              child: Container(
                height: 166,
                width: 166,
                decoration: BoxDecoration(
                  color: Constants.kPinkColor,
                  shape: BoxShape.circle,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
                 child: Container(
                  height: 166,
                  width: 166,
                 ) ),
              )
            ),

            Positioned(
              top: screenHeight * 0.3,
              right : -88,
              child: Container(
                height: 200,
                width: 200,
                decoration:const BoxDecoration(
                  color: Constants.kGreenColor,
                  shape: BoxShape.circle,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
                 child: Container(
                  height: 200,
                  width: 200,
                 ) ),
              )
            ),  

            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment:CrossAxisAlignment.center,
                children: [

                  SizedBox(height: screenHeight * 0.05),

                  CustomOutline(
                    strokeWidth: 4, 
                    radius: screenWidth * 0.8, 
                     padding:const EdgeInsets.all(4),
                     gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Constants.kPinkColor,
                        Constants.kPinkColor.withOpacity(0),
                        Constants.kGreenColor.withOpacity(0.1),
                        Constants.kGreenColor,
                      ],
                      stops: const [0.2,0.4, 0.6, 1],
                    ), 
                     
                    child: Container(
                      decoration:const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/img-onboarding.png'),
                          fit: BoxFit.cover,
                          alignment: Alignment.bottomLeft
                        ),
                      ),
                    ),

                    width: screenWidth * 0.7,
                    height: screenWidth * 0.7, 

                    ),

                  SizedBox(height: screenHeight * 0.09),

                  Text(
                    'Watch movies in \n virtul reality',
                    textAlign: TextAlign.center,  
                    style: TextStyle(
                      color: Constants.kWhiteColor.withOpacity(0.8),
                      fontSize: screenHeight<= 660 ? 18 : 34,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.05),

                  Text(
                    'Download and watch offline \n wherever you are',
                    textAlign: TextAlign.center,  
                    style: TextStyle(
                      color: Constants.kWhiteColor.withOpacity(0.75),
                      fontSize: screenHeight<= 660 ? 12 : 16,
                      fontWeight: FontWeight.w200,
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.03),

                  GestureDetector(

                    onTap: () => Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => const HomeScreen())),
                    child: CustomOutline (
                      strokeWidth: 3,
                      radius: 20,
                      padding: const EdgeInsets.all(3),
                      gradient:const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Constants.kPinkColor,
                          Constants.kGreenColor,
                        ],
                        
                      ),
                      
                      child: Center(
                        child: Text(
                          'Sign Up',
                          textAlign: TextAlign.center,  
                          style: TextStyle(
                            color: Constants.kWhiteColor,
                            fontSize: screenHeight<= 660 ? 11 : 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      width: 160,
                      height: 38,
                    ),
                  ),

                  const Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, 
                    (index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                          color: index == 0 
                          ? Constants.kGreenColor 
                          :index==1
                          ?Constants.kWhiteColor.withOpacity(0.5)
                          :Constants.kWhiteColor.withOpacity(0.5),
                          shape: BoxShape.circle,
                        ),
                      );
                    }
                    ),
                  ),
                    SizedBox(height: screenHeight * 0.03),
                  
                  
                ],
              ),
            ) 
          
          
          ],
        ),
      ),

    );
  }
}
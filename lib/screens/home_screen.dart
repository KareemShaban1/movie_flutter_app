import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:movie_app_ui/components/masked_image.dart';
import 'package:movie_app_ui/components/search_field.dart';
import 'package:movie_app_ui/constants.dart';
import 'package:movie_app_ui/models/movie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constants.kBlackColor,
      extendBody: true,
      body: SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: Stack(
          children: [

              Positioned(
              top: -100,
              left : -100,
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  color: Constants.kGreenColor.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 150, sigmaY: 100),
                 child: Container(
                  height: 120,
                  width: 120,
                  color: Colors.transparent,
                 ) ),
              )
            ),

            Positioned(
              bottom: -100,
              left : -100,
              child: Container(
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                  color: Constants.kGreenColor.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
                 child: Container(
                  height: 180,
                  width: 180,
                  color: Colors.transparent,
                 ) ),
              )
            ),


            Positioned(
              top: screenHeight * 0.4,
              right : -88,
              child: Container(
                height: 166,
                width: 166,
                decoration: BoxDecoration(
                  color: Constants.kPinkColor.withOpacity(0.5),
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

            SafeArea(
              bottom: false,
              
              child: ListView(
                primary: true,
                children: [

                  const SizedBox(
                    height: 24,
                    ),

                    const Text(
                      'What Would You \n Like To Watch?',
                      
                      style: TextStyle(
                        color: Constants.kWhiteColor,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: 30,),

                    SearchField(padding: EdgeInsets.symmetric(horizontal: 20),),

                    SizedBox(height: 40,),

                    const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child:  Text(
                      'Popular Movies',
                      style: TextStyle(
                        color: Constants.kWhiteColor,
                        fontSize: 17,
                      ),
                    ),
                    ),

                    SizedBox(height: 37,),


                    SizedBox(
                      height: 160,
                      
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: newMovies.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index){
                          String mask;
                          if(index == 0){
                            mask = 'assets/mask/mask_firstIndex.png';
                            }else if(index == newMovies.length - 1){
                              mask = 'assets/mask/mask_lastIndex.png';}
                            else{
                              mask = 'assets/mask/mask.png';
                            }  

                          return GestureDetector(
                            child: Container(
                              margin: EdgeInsets.only(left: index == 0 ? 20.0 : 0.0,),
                              height: 160,
                              width: 142,
                              child: MaskedImage(
                                asset: newMovies[index].moviePoster, 
                                mask: mask,
                                ),
                            ),
                          );



                      }),
                      ),

                      SizedBox(height: 40,),

                    const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Upcoming Movies',
                      style: TextStyle(
                        color: Constants.kWhiteColor,
                        fontSize: 17,
                      ),
                    ),
                    ),

                    SizedBox(height: 37,),


                    SizedBox(
                      height: 160,
                      
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: newMovies.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index){
                          String mask;
                          if(index == 0){
                            mask = 'assets/mask/mask_firstIndex.png';
                            }else if(index == newMovies.length - 1){
                              mask = 'assets/mask/mask_lastIndex.png';}
                            else{
                              mask = 'assets/mask/mask.png';
                            }  

                          return GestureDetector(
                            child: Container(
                              margin: EdgeInsets.only(
                                left: index == 0 ? 20.0 : 0.0,
                                bottom: 20
                                ),
                              height: 160,
                              width: 142,
                              child: MaskedImage(
                                asset: upcomingMovies[index].moviePoster, 
                                mask: mask,
                                ),
                            ),
                          );

                          

                      }),
                      ),

                ],
              ),
            ),


          ],

        ),
      ),

      floatingActionButton: Container(
        height: 54,
        width: 54,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              Constants.kGreenColor.withOpacity(0.2),
              Constants.kPinkColor.withOpacity(0.2),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Container(
        height: 50,
        width: 50,
        padding: const EdgeInsets.all(4),
        decoration:const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              Constants.kGreenColor,
              Constants.kPinkColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: RawMaterialButton(
          onPressed: (){},
          shape: const CircleBorder(),
          fillColor: const Color(0xff404c57),
          child: SvgPicture.asset(Constants.kIconPlus),
          )
          ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      
      bottomNavigationBar: GlassmorphicContainer(
        width: screenWidth,
        height: 40,
        borderRadius: 0,
        blur: 100,
        border: 0,
        borderGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Constants.kGreenColor.withOpacity(0.2),
            Constants.kPinkColor.withOpacity(0.2),
          ],
        ),
        
        linearGradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Constants.kWhiteColor.withOpacity(0.1),
            Constants.kWhiteColor.withOpacity(0.1),
          ],
          stops: [0.1, 1],
        ),
       
        child: BottomAppBar(
          color: Colors.transparent.withOpacity(0.1),
          notchMargin: 20,
          elevation: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Expanded(child: IconButton(
               
                icon: SvgPicture.asset(
                  Constants.kIconHome,
                  color: Constants.kWhiteColor,
                  height: 18,
                  width: 18,
                  ),
                onPressed: (){},
                ),
              ),

              Expanded(child: IconButton(
                iconSize: 7.0,
                icon: SvgPicture.asset(
                  Constants.kIconPlayOnTv,
                  color: Constants.kWhiteColor,
                  height: 18,
                  width: 18,
                  ),
                onPressed: (){},
                ),
              ),

              const Expanded(child: Text('')),

              Expanded(child: IconButton(
                iconSize: 7.0,
                icon: SvgPicture.asset(
                  Constants.kIconCategories,
                  color: Constants.kWhiteColor,
                  height: 18,
                  width: 18,
                  ),
                onPressed: (){},
                ),
              ),

              Expanded(child: IconButton(
                iconSize: 7.0,
                icon: SvgPicture.asset(
                  Constants.kIconDownload,
                  color: Constants.kWhiteColor,
                  height: 18,
                  width: 18,
                  ),
                onPressed: (){},
                ),
              ),

            ],
          ),
        ),
        ),
      


      );

  }
}
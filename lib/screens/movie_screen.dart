import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app_ui/components/masked_image.dart';
import 'package:movie_app_ui/constants.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(

        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black,
              Color.fromARGB(255, 0, 0, 0),
            ],
          ),
        ),
        child: Stack(
          children: [
            
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                height: screenHeight * 0.55,
                width: screenWidth,
                child: Container(
                  decoration: const BoxDecoration(
                    image:  DecorationImage(
                        fit: BoxFit.cover,
                      
                        image: AssetImage(
                            "assets/movie-posters/eternals.png")),
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.05,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(width: 2, color: Colors.white),
                      ),
                      child: SvgPicture.asset(
                        'assets/svg/icon-back.svg',
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(width: 2, color: Colors.white),
                      ),
                      child: SvgPicture.asset(
                        'assets/svg/icon-menu.svg',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 20,
              top: screenHeight * 0.42,
              child: Container(
                width: 50,
                height: 40,
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xffFE53BB),
                      Color(0xFF09FBD3),
                    ],
                  ),
                ),
                child: Container(
                  decoration:const  BoxDecoration(
                    shape: BoxShape.circle,
                    color: Constants.kBlackColor,
                  ),
                  child: const Icon(
                    Icons.play_arrow,
                    color: Constants.kWhiteColor,
                  ),
                ),
              ),
            ),

            // Movie Details
            Positioned(
              bottom: -30,
              left: 0,
              right: 0,
              child: Container(
                
                height: screenHeight * 0.5,
                transform:Matrix4.translationValues(0, -screenHeight * 0.05, 0),
                  
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    SizedBox(
                      width: screenWidth * 0.8,
                      child: Column(
                        children: [
                          Text(
                            'Eternals',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Constants.kWhiteColor.withOpacity(
                                0.85,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: screenHeight <= 667 ? 7 : 14,
                          ),
                          Text(
                            '2021•Action-Adventure-Fantasy•2h36m',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              color: Constants.kWhiteColor.withOpacity(
                                0.75,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),

                          RatingBar.builder(
                            itemSize: 14,
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 1),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Constants.kYellowColor,
                            ),
                            onRatingUpdate: (rating) {
                              debugPrint(rating.toString());
                            },
                            unratedColor: Constants.kWhiteColor,
                          ),

                          const SizedBox(
                            height: 8,
                          ),
                          
                          Text(
                            'The saga of the Eternals, a race of immortal \nbeings who lived on Earth and shaped its\n history and civilizations.',
                            textAlign: TextAlign.center,
                            maxLines: screenHeight <= 667 ? 3 : 4,
                            style: TextStyle(
                              fontSize: 13,
                              color: Constants.kWhiteColor.withOpacity(
                                0.75,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),

                    Container(
                      height: 2,
                      width: screenWidth * 0.6,
                      color: Constants.kWhiteColor.withOpacity(0.15),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),


                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 23,
                        ),
                        
                        
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: const [
                                  Text(
                                    'Cast',
                                    style: TextStyle(
                                      color: Constants.kWhiteColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            
                            SizedBox(
                              height: screenHeight <= 667 ? 14: 18,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                CircleAvatar(
                                  backgroundColor: Colors.orange,
                                  minRadius: 16,
                                  maxRadius: screenWidth <= 375 ? 16 : 25,
                                   backgroundImage: const AssetImage('assets/cast/img1.jpg')
                                ),
                                
                                Expanded(
                                  child: Container(
                                    
                                    constraints: const BoxConstraints(
                                      maxHeight: 25,
                                      maxWidth: 100,
                                    ),
                                    transform:
                                        Matrix4.translationValues(-6, 0, 0),
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: const [

                                        MaskedImage(
                                          asset: 'assets/mask/mask_cast.png',
                                          mask: Constants.kMaskCast,
                                        ),
                                        
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 16.0,
                                          ),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Angelina  Jolie',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                              ),
                                              maxLines: 2,
                                            ),
                                          ),
                                        )

                                      ],
                                    ),
                                  ),
                                ),
                                
                            
                                 CircleAvatar(
                                  backgroundColor: Colors.orange,
                                  minRadius: 14,
                                  maxRadius: screenWidth <= 375 ? 16 : 25,
                                  backgroundImage: const AssetImage('assets/cast/img2.png')
                                ),
                                Expanded(
                                  child: Container(
                                    constraints: const BoxConstraints(
                                      maxHeight: 25,
                                      maxWidth: 100,
                                    ),
                                    transform:
                                        Matrix4.translationValues(-6, 0, 0),
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: const [
                                        MaskedImage(
                                          asset: Constants.kMaskCast,
                                          mask: Constants.kMaskCast,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 16.0,
                                          ),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Salma Hayek',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                              ),
                                              maxLines: 2,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                            
                              ],
                            ),
                           
                            const SizedBox(
                              height: 10,
                            ),
                         
                         
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.orange,
                                  minRadius: 16,
                                  maxRadius: screenWidth <= 375 ? 18 : 25,
                                   backgroundImage: const AssetImage('assets/cast/img3.png')
                                ),
                                Expanded(
                                  child: Container(
                                    constraints: const BoxConstraints(
                                      maxHeight: 25,
                                      maxWidth: 100,
                                    ),
                                    transform:
                                        Matrix4.translationValues(-6, 0, 0),
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: const [
                                        MaskedImage(
                                          asset: Constants.kMaskCast,
                                          mask: Constants.kMaskCast,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 16.0,
                                          ),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Gemma Chan',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                              ),
                                              maxLines: 2,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                            
                                 CircleAvatar(
                                  backgroundColor: Colors.orange,
                                  minRadius: 14,
                                  maxRadius: screenWidth <= 375 ? 16 : 25,
                                   backgroundImage: const AssetImage('assets/cast/img4.png')
                                ),
                                Expanded(
                                  child: Container(
                                    constraints: const BoxConstraints(
                                      maxHeight: 25,
                                      maxWidth: 100,
                                    ),
                                    transform:
                                        Matrix4.translationValues(-6, 0, 0),
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: const [
                                        MaskedImage(
                                          asset: Constants.kMaskCast,
                                          mask: Constants.kMaskCast,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 16.0,
                                          ),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Richard Madden',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                              ),
                                              maxLines: 2,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                            
                              ],
                            ),
                           
                          ],
                        ),
                      ),
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
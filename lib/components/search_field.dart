import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app_ui/constants.dart';

class SearchField extends StatelessWidget {

  const SearchField({Key? key , required this.padding}) : super(key: key);

  final EdgeInsetsGeometry padding;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,

      child: Container(
        height: 35,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Constants.kGreyColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),

        child: Row(
          children: [
            const SizedBox(width: 10),

            SvgPicture.asset('assets/svg/icon-search.svg'),
            
            const SizedBox(width: 10),
            
            Expanded(
              child: TextField(
                style:  TextStyle(
                  color: Constants.kWhiteColor.withOpacity(0.6),
                  fontSize: 17,
                  letterSpacing: -0.41,
                  ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  isDense: true,
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    color: Constants.kWhiteColor.withOpacity(0.5),
                    fontSize: 15,
                    letterSpacing: -0.41,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 8,),

            SvgPicture.asset('assets/svg/icon-mic.svg'),

            const SizedBox(width: 8,),


          ],
        ),
      ),
    );
  }
}
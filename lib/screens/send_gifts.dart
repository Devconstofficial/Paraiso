import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paraiso/util/theme/theme_constants.dart';
import 'package:paraiso/widgets/primary_button.dart';
import 'package:velocity_x/velocity_x.dart';

class SendGifts extends StatefulWidget {
  const SendGifts({Key? key}) : super(key: key);

  @override
  State<SendGifts> createState() => _SendGiftsState();
}

class _SendGiftsState extends State<SendGifts> {
  int number = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: neutralColor,
        leading: IconButton(
          icon: Container(
              height: 53.h,
              width: 53.h,
              decoration: BoxDecoration(
                  color: softBlack, borderRadius: BorderRadius.circular(50)),
              padding: EdgeInsets.only(left: 10.w),
              child: const Icon(Icons.arrow_back_ios)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Center(
          child: Text(
            'Send Gifts',
            style: TextStyle(
              color: Color(0xFFE4E4E4),
              fontSize: 25.sp,
              fontFamily: 'Recoleta',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        actions: [
          44.horizontalSpace,
        ],
      ),
      body: ListView(
        children: [
          Text(
            'Select Gift',
            style: TextStyle(
              color: Color(0xFFE4E4E4),
              fontSize: 23.sp,
              fontFamily: 'Recoleta',
              fontWeight: FontWeight.w700,
            ),
          ).pLTRB(25.w, 0.h, 25.w, 25.h),
          //grid here
          GridView(
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 11.w,
              mainAxisSpacing: 16.5.h,
              childAspectRatio: 0.95,
            ),
            children: [
              FoodGiftTile(
                  image: "Send Gifts_burger 1_346_10807.png", owned: 0),
              FoodGiftTile(image: "Send Gifts_pizza 1_346_11093.png", owned: 0),
              FoodGiftTile(image: "coconut.png", owned: 0),
              FoodGiftTile(image: "Send Gifts_float 1_352_11143.png", owned: 0),
              FoodGiftTile(
                  image: "Send Gifts_buritto 1_352_11140.png", owned: 0),
              FoodGiftTile(
                  image: "Send Gifts_ice cream 1_352_11144.png", owned: 0),
            ],
          ).pLTRB(25.w, 0.h, 25.w, 16.h).h(350.h),

          // MORE Button
          InkWell(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "More",
                  style: TextStyle(
                    color: Color(0xFFE4E4E4),
                    fontSize: 23.sp,
                    fontFamily: 'Recoleta',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                4.horizontalSpace,
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Color(0xFFE4E4E4),
                  size: 20,
                ),
              ],
            ).pLTRB(25.w, 0.h, 25.w, 0.h),
          ),

          Divider(
            color: softGray,
            thickness: .5.h,
            // indent: 25,
            // endIndent: 25,
          ),
          28.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Quantity",
                style: context.titleLarge?.copyWith(
                    color: onPrimaryColor, fontWeight: FontWeight.bold),
              ),
              //  choice chips flutter material 3 multiple
              HStack([
                //   minus btn
                ElevatedButton(
                    // no content padding style
                    style: ElevatedButton.styleFrom(
                      primary: softBlack,
                      foregroundColor: onPrimaryColor,
                      padding: EdgeInsets.zero,
                      shape: const CircleBorder(),
                    ),
                    onPressed: () {
                      setState(() {
                        if (number > 1) {
                          number--;
                        }
                      });
                    },
                    child: Icon(Icons.remove)),
                8.horizontalSpace,
                //   nmbr
                Text(
                  "$number",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                8.horizontalSpace,
                //  plus button
                ElevatedButton(
                    // no content padding style
                    style: ElevatedButton.styleFrom(
                      primary: softBlack,
                      foregroundColor: onPrimaryColor,
                      padding: EdgeInsets.zero,
                      shape: const CircleBorder(),
                    ),
                    onPressed: () {
                      setState(() {
                        number++;
                      });
                    },
                    child: Icon(Icons.add)),
              ])
            ],
          ).pLTRB(25.w, 0.h, 10.h, 0.h),
          24.verticalSpace,
          Divider(
            color: softGray,
            thickness: .5.h,
            // indent: 25,
            // endIndent: 25,
          ),
          72.verticalSpace,
          Center(
            child: PrimaryButton(
              text: "Send now",
              onPressed: () {},
            ),
          )
        ],
      ),
      //friends list
    );
  }
}

class FoodGiftTile extends StatefulWidget {
  final String image;
  final int owned;

  const FoodGiftTile({super.key, required this.image, required this.owned});

  @override
  State<FoodGiftTile> createState() => _FoodGiftTileState();
}

class _FoodGiftTileState extends State<FoodGiftTile> {
  bool toggled = false;

  @override
  Widget build(BuildContext context) {
    // on tap at end
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 150.h,
        minHeight: 124.h,
      ),
      child: Container(
        width: 119.w,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(22),
            ),
            side: BorderSide(
                width: toggled ? 1.5 : .5,
                strokeAlign: BorderSide.strokeAlignCenter,
                color: toggled ? primaryColor : softGray),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/${widget.image}",
              width: 78.h,
              height: 78.h,
            ),
            7.5.verticalSpace,
            Divider(
              color: softGray,
              thickness: .5.h,
            ),
            4.verticalSpace,
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Owned ',
                    style: TextStyle(
                      color: Color(0xFFBDBDBD),
                      fontSize: 13,
                      fontFamily: 'Recoleta',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: widget.owned.toString(),
                    style: TextStyle(
                      color: widget.owned == 0 ? primaryColor : onNeutralColor,
                      fontSize: 13,
                      fontFamily: 'Recoleta',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ).onTap(() {
        setState(() {
          toggled = !toggled;
        });
      }),
    );
  }
}

class CustomDropdown extends StatefulWidget {
  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _selectedValue,
      onChanged: (String? newValue) {
        setState(() {
          _selectedValue = newValue;
        });
      },
      dropdownColor: Colors.black,
      elevation: 0,
      focusColor: Colors.pink,
      iconDisabledColor: Colors.white,
      iconEnabledColor: Colors.white,
      isDense: true,
      itemHeight: 60,
      selectedItemBuilder: (BuildContext context) {
        return [
          Text(
            'More',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Recoleta',
              fontWeight: FontWeight.w400,
            ),
          ),
        ];
      },
      items: [
        DropdownMenuItem<String>(
          value: 'Food1',
          child: Text(
            'Food1',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Recoleta',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        DropdownMenuItem<String>(
          value: 'Food3',
          child: Text(
            'Food1',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Recoleta',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        DropdownMenuItem<String>(
          value: 'Food2',
          child: Text(
            'Food1',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Recoleta',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        // Add more DropdownMenuItems as needed
      ],
    );
  }
}

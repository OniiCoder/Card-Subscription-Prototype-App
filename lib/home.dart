import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:sebiomo/models/debits.dart';

const darkBrown = Color(0xffD78776);
const lightBrown = Color(0xffE5BAAB);
const textGrey = Color(0xff455A64);
const darkGrey = Color(0xff263238);
const lightGrey = Color(0xffE0E0E0);
const bg = Color(0xffF7F7F7);
const lightPink = Color(0xffFCE5E7);
const pink = Color(0xffE8505B);
const cardsBg = Color(0xffF0F0F0);
const lightOrange = Color(0xffFDF1E8);
const deepOrange = Color(0xffF2A365);
const lightPurple = Color(0xffE9EDF2);
const deepPurple = Color(0xff6983AA);
const lightCyan = Color(0xffF0FBFC);
const deepCyan = Color(0xff97E5EF);
const lightBlue = Color(0xffDBE3EB);
const deepBlue = Color(0xff084177);

const workSans = 'WorkSans-Regular';
const workSansBold = 'WorkSans-Bold';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Debits> upcomingDebits = [
    Debits(companyName: 'Netflix', date: '1-May-2021', amount: '3,400', lastCardDigits: '8898', avatarForeground: pink, avatarBackground: lightPink),
    Debits(companyName: 'Udacity', date: '5-May-2021', amount: '18,200', lastCardDigits: '8898', avatarForeground: deepOrange, avatarBackground: lightOrange),
    Debits(companyName: 'MusicBed', date: '12-May-2021', amount: '4,500', lastCardDigits: '8898', avatarForeground: deepPurple, avatarBackground: lightPurple),
    Debits(companyName: 'Swift Internet', date: '15-May-2021', amount: '3,400', lastCardDigits: '5766', avatarForeground: deepCyan, avatarBackground: lightCyan),
    Debits(companyName: 'PiggyVest', date: '19-May-2021', amount: '52,000', lastCardDigits: '5766', avatarForeground: deepBlue, avatarBackground: lightBlue),
  ];

  int selectedItem = -1;
  double height = 90;

  AnimatedContainer debitListItem({String companyName, String date, String amount, String lastCardDigits, Color avatarForeground, Color avatarBackground, Color cardBg, Color textColor, Widget actionSection, double height}) {
    return AnimatedContainer(
      height: height,
      duration: Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(20),

      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: avatarBackground,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                            child: Text(
                              companyName.substring(0,1),
                              style: TextStyle(
                                color: avatarForeground,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              companyName,
                              style: TextStyle(
                                color: textColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              date,
                              style: TextStyle(
                                color: textColor,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text('NGN ${amount}',
                          style: TextStyle(
                            color: darkBrown,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('**** ${lastCardDigits}',
                          style: TextStyle(
                            color: textColor,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            (actionSection != null) ? actionSection : SizedBox(height: 0,),
          ],
        ),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
//            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                SizedBox(height: 40,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Your Cards',
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: workSansBold,
                            fontWeight: FontWeight.w800,
                            color: textGrey
                        ),
                      ),
                      FlatButton.icon(
                        onPressed: () {},
                        color: darkBrown,
                        shape: RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        icon: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Icon(Icons.add, color: Colors.white,),
                        ),
                        label: Text('Add Card', style: TextStyle(color: Colors.white, fontFamily: workSans,),),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: double.infinity,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal ,
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 20,),
                        Container(
                          margin: EdgeInsets.fromLTRB(0,0,10,0),
                          width: 310,
                          height: 150,
                          decoration: BoxDecoration(
                            color: darkGrey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '**** **** **** 8898',
                                style: TextStyle(
                                  color: lightBrown,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: workSans,
                                ),
                              ),
                              SizedBox(height: 2,),
                              Text(
                                'EXP: 08/21',
                                style: TextStyle(
                                  color: lightBrown,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: workSans,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0,0,10,0),
                          width: 310,
                          height: 150,
                          decoration: BoxDecoration(
                            color: lightBrown,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '**** **** **** 5766',
                                style: TextStyle(
                                  color: darkGrey,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: workSans,
                                ),
                              ),
                              SizedBox(height: 2,),
                              Text(
                                'EXP: 06/23',
                                style: TextStyle(
                                  color: darkGrey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: workSans,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10,),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Upcoming Debits',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: workSans,
                            fontWeight: FontWeight.bold,
                            color: textGrey
                        ),
                      ),
                      FlatButton.icon(
                        onPressed: () {},
                        color: lightGrey,
                        shape: RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        icon: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Icon(Icons.keyboard_arrow_down, color: textGrey,),
                        ),
                        label: Text('Current Month', style: TextStyle(color: textGrey, fontFamily: workSans, fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 500,
                  child: ListView.builder(
                    itemCount: upcomingDebits.length,
                    itemBuilder: (BuildContext context, index){
                      return Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              print('tapped: ${upcomingDebits[index].companyName}');

                              if(selectedItem == -1) {
                                setState(() {
                                  selectedItem = index;
                                });
                              } else if (selectedItem == index) {
                                setState(() {
                                  selectedItem = -1;
                                });
                              } else {
                                setState(() {
                                  selectedItem = index;
                                });
                              }

                              print(selectedItem);
                            },
                            child: debitListItem(
                              height: (selectedItem == index) ? 140 : height,
                              companyName: upcomingDebits[index].companyName,
                              date: upcomingDebits[index].date,
                              amount: upcomingDebits[index].amount,
                              lastCardDigits: upcomingDebits[index].lastCardDigits,
                              avatarForeground: upcomingDebits[index].avatarForeground,
                              avatarBackground: upcomingDebits[index].avatarBackground,
                              cardBg: (selectedItem == index) ? darkGrey : cardsBg,
                              textColor: (selectedItem == index) ? Colors.white : textGrey,
                              actionSection: (selectedItem == index) ?

                              DelayedDisplay(
                                delay: Duration(milliseconds: 100),
                                child: AnimatedContainer(
                                  duration: Duration(seconds: 3),
                                  height: 50,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Expanded(
                                        flex: 6,
                                        child: Row(
                                          children: <Widget>[
                                            Icon(Icons.access_time, color: Colors.grey[400], size: 14,),
                                            SizedBox(width: 2,),
                                            Text(
                                              'Set disconnection date',
                                              style: TextStyle(
                                                color: Colors.grey[400],
                                                fontSize: 12,
                                                fontFamily: workSans,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 6,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: <Widget>[
                                            Icon(Icons.close, color: pink, size: 14,),
                                            SizedBox(width: 2,),
                                            Text(
                                              'Disconnect Now',
                                              style: TextStyle(
                                                color: pink,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                fontFamily: workSans,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              )



                                  : null,
                            ),
                          ),
                          SizedBox(height: 20,),
                        ],
                      );
                    },
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}

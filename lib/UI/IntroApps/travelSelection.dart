import 'package:booking_hotel_firebase/Library/Multiple_Language/Language_Library/lib/easy_localization_delegate.dart';
import 'package:booking_hotel_firebase/Library/Multiple_Language/Language_Library/lib/easy_localization_provider.dart';
import 'package:flutter/material.dart';
import 'package:booking_hotel_firebase/Library/SupportingLibrary/Animation/FadeAnimation.dart';
import 'package:booking_hotel_firebase/UI/Bottom_Nav_Bar/bottomNavBar.dart';

class mainSelection extends StatefulWidget {
  final String userID;
  mainSelection({this.userID});

  @override
  _mainSelectionState createState() => _mainSelectionState();
}

class _mainSelectionState extends State<mainSelection> {
  @override

  ///
  ///
  /// Bool to set true or false color button
  ///
  ///
  bool button1 = true;
  bool button2 = true;
  bool button3 = true;
  bool button4 = true;
  bool button5 = true;
  bool button6 = true;

  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    return EasyLocalizationProvider(
      data: data,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              FadeAnimation(
                0.1,
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    AppLocalizations.of(context).tr('chooseFavorite'),
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Sofia",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                      onTap: () {
                        setState(() {
                          if (button1 == true) {
                            button1 = false;
                          } else {
                            button1 = true;
                          }
                        });
                      },
                      child: FadeAnimation(
                        0.9,
                        button1
                            ? itemCard(
                                image:
                                    "assets/image/destinationPopuler/destination1.png",
                                title:
                                    AppLocalizations.of(context).tr('museum'),
                              )
                            : itemCardSelected(
                                image:
                                    "assets/image/destinationPopuler/destination1.png",
                                title:
                                    AppLocalizations.of(context).tr('museum'),
                                sizeFont: 25.0,
                              ),
                      )),
                  InkWell(
                      onTap: () {
                        setState(() {
                          if (button2 == true) {
                            button2 = false;
                          } else {
                            button2 = true;
                          }
                        });
                      },
                      child: FadeAnimation(
                        1.7,
                        button2
                            ? itemCard(
                                image:
                                    "assets/image/destinationPopuler/destination5.jpg",
                                title: AppLocalizations.of(context).tr('park'),
                              )
                            : itemCardSelected(
                                image:
                                    "assets/image/destinationPopuler/destination5.jpg",
                                title: AppLocalizations.of(context).tr('park'),
                                sizeFont: 25.0,
                              ),
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                      onTap: () {
                        setState(() {
                          if (button3 == true) {
                            button3 = false;
                          } else {
                            button3 = true;
                          }
                        });
                      },
                      child: FadeAnimation(
                        2.4,
                        button3
                            ? itemCard(
                                image:
                                    "assets/image/destinationPopuler/populer2.png",
                                title: AppLocalizations.of(context).tr('beach'),
                              )
                            : itemCardSelected(
                                image:
                                    "assets/image/destinationPopuler/populer2.png",
                                title: AppLocalizations.of(context).tr('beach'),
                                sizeFont: 22.0,
                              ),
                      )),
                  InkWell(
                      onTap: () {
                        setState(() {
                          if (button4 == true) {
                            button4 = false;
                          } else {
                            button4 = true;
                          }
                        });
                      },
                      child: FadeAnimation(
                        3.2,
                        button4
                            ? itemCard(
                                image:
                                    "assets/image/destinationPopuler/destination4.jpg",
                                title:
                                    AppLocalizations.of(context).tr('mountain'),
                              )
                            : itemCardSelected(
                                image:
                                    "assets/image/destinationPopuler/destination4.jpg",
                                title:
                                    AppLocalizations.of(context).tr('mountain'),
                                sizeFont: 25.0,
                              ),
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                      onTap: () {
                        setState(() {
                          if (button5 == true) {
                            button5 = false;
                          } else {
                            button5 = true;
                          }
                        });
                      },
                      child: FadeAnimation(
                        4.0,
                        button5
                            ? itemCard(
                                image: "assets/image/homeImage/hotel.png",
                                title: AppLocalizations.of(context).tr('hotel'),
                              )
                            : itemCardSelected(
                                image: "assets/image/homeImage/hotel.png",
                                title: AppLocalizations.of(context).tr('hotel'),
                                sizeFont: 25.0,
                              ),
                      )),
                  InkWell(
                      onTap: () {
                        setState(() {
                          if (button6 == true) {
                            button6 = false;
                          } else {
                            button6 = true;
                          }
                        });
                      },
                      child: FadeAnimation(
                        4.8,
                        button6
                            ? itemCard(
                                image: "assets/image/homeImage/experience.png",
                                title: AppLocalizations.of(context)
                                    .tr('experience'),
                              )
                            : itemCardSelected(
                                image: "assets/image/homeImage/experience.png",
                                title: AppLocalizations.of(context)
                                    .tr('experience'),
                                sizeFont: 25.0,
                              ),
                      )),
                ],
              ),
              SizedBox(
                height: 70.0,
              ),
              FadeAnimation(
                5.5,
                button1 && button2 && button3 && button4 && button5 && button6
                    ? Container(
                        height: 55.0,
                        width: double.infinity,
                        margin:
                            EdgeInsets.only(left: 20.0, right: 20.0, top: 0.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey,
                        ),
                        child: Center(
                          child: Text(
                            AppLocalizations.of(context).tr('next'),
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Sofia",
                                fontWeight: FontWeight.w500,
                                fontSize: 19.5,
                                letterSpacing: 1.2),
                          ),
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          setState(() {
                            if (button1 == false) {
                              Navigator.of(context).pushReplacement(
                                  PageRouteBuilder(
                                      pageBuilder: (_, __, ___) =>
                                          new bottomNavBar(
                                            userID: widget.userID,
                                          ),
                                      transitionDuration:
                                          Duration(milliseconds: 600),
                                      transitionsBuilder: (_,
                                          Animation<double> animation,
                                          __,
                                          Widget child) {
                                        return Opacity(
                                          opacity: animation.value,
                                          child: child,
                                        );
                                      }));
                            } else if (button2 == false) {
                              Navigator.of(context).pushReplacement(
                                  PageRouteBuilder(
                                      pageBuilder: (_, __, ___) =>
                                          new bottomNavBar(
                                            userID: widget.userID,
                                          ),
                                      transitionDuration:
                                          Duration(milliseconds: 600),
                                      transitionsBuilder: (_,
                                          Animation<double> animation,
                                          __,
                                          Widget child) {
                                        return Opacity(
                                          opacity: animation.value,
                                          child: child,
                                        );
                                      }));
                            } else if (button3 == false) {
                              Navigator.of(context).pushReplacement(
                                  PageRouteBuilder(
                                      pageBuilder: (_, __, ___) =>
                                          new bottomNavBar(
                                            userID: widget.userID,
                                          ),
                                      transitionDuration:
                                          Duration(milliseconds: 600),
                                      transitionsBuilder: (_,
                                          Animation<double> animation,
                                          __,
                                          Widget child) {
                                        return Opacity(
                                          opacity: animation.value,
                                          child: child,
                                        );
                                      }));
                            } else if (button4 == false) {
                              Navigator.of(context).pushReplacement(
                                  PageRouteBuilder(
                                      pageBuilder: (_, __, ___) =>
                                          new bottomNavBar(
                                            userID: widget.userID,
                                          ),
                                      transitionDuration:
                                          Duration(milliseconds: 600),
                                      transitionsBuilder: (_,
                                          Animation<double> animation,
                                          __,
                                          Widget child) {
                                        return Opacity(
                                          opacity: animation.value,
                                          child: child,
                                        );
                                      }));
                            } else if (button5 == false) {
                              Navigator.of(context).pushReplacement(
                                  PageRouteBuilder(
                                      pageBuilder: (_, __, ___) =>
                                          new bottomNavBar(
                                            userID: widget.userID,
                                          ),
                                      transitionDuration:
                                          Duration(milliseconds: 600),
                                      transitionsBuilder: (_,
                                          Animation<double> animation,
                                          __,
                                          Widget child) {
                                        return Opacity(
                                          opacity: animation.value,
                                          child: child,
                                        );
                                      }));
                            } else if (button6 == false) {
                              Navigator.of(context).pushReplacement(
                                  PageRouteBuilder(
                                      pageBuilder: (_, __, ___) =>
                                          new bottomNavBar(
                                            userID: widget.userID,
                                          ),
                                      transitionDuration:
                                          Duration(milliseconds: 600),
                                      transitionsBuilder: (_,
                                          Animation<double> animation,
                                          __,
                                          Widget child) {
                                        return Opacity(
                                          opacity: animation.value,
                                          child: child,
                                        );
                                      }));
                            }
                          });
                        },
                        child: Container(
                          height: 55.0,
                          width: double.infinity,
                          margin: EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 0.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(colors: [
                                Color(0xFF09314F),
                                Color(0xFF7F53AC)
                              ])),
                          child: Center(
                            child: Text(
                              AppLocalizations.of(context).tr('next'),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Sofia",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 19.5,
                                  letterSpacing: 1.2),
                            ),
                          ),
                        ),
                      ),
              ),
              SizedBox(
                height: 30.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}

///
/// Create item card
///
class itemCard extends StatelessWidget {
  final String image, title;
  itemCard({this.image, this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0, bottom: 10.0),
      child: Container(
        height: 85.0,
        width: 165.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        child: Material(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFABABAB).withOpacity(0.7),
                  blurRadius: 4.0,
                  spreadRadius: 3.0,
                ),
              ],
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                color: Colors.black12.withOpacity(0.1),
              ),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    shadows: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.7),
                          blurRadius: 10.0,
                          spreadRadius: 2.0)
                    ],
                    color: Colors.white,
                    fontFamily: "Sofia",
                    fontWeight: FontWeight.w800,
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

///
/// Create item card
///
class itemCardSelected extends StatelessWidget {
  final String image, title;
  final double sizeFont;
  itemCardSelected({this.image, this.title, this.sizeFont});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0, bottom: 10.0),
      child: Container(
        height: 85.0,
        width: 165.0,
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xFF09314F), Color(0xFF7F53AC)]),
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        child: Material(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFABABAB).withOpacity(0.7),
                  blurRadius: 4.0,
                  spreadRadius: 3.0,
                ),
              ],
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                gradient: LinearGradient(colors: [
                  Color(0xFF09314F).withOpacity(0.5),
                  Color(0xFF7F53AC).withOpacity(0.5),
                ]),
              ),
              child: Center(
                child: Text(
                  AppLocalizations.of(context).tr('selected'),
                  style: TextStyle(
                    shadows: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.7),
                          blurRadius: 10.0,
                          spreadRadius: 2.0)
                    ],
                    color: Colors.white,
                    fontFamily: "Sofia",
                    fontWeight: FontWeight.w800,
                    fontSize: 25.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:booking_hotel_firebase/Library/Multiple_Language/Language_Library/lib/easy_localization_delegate.dart';
import 'package:booking_hotel_firebase/Library/Multiple_Language/Language_Library/lib/easy_localization_provider.dart';
import 'package:booking_hotel_firebase/UI/B1_Home/Hotel/Hotel_Detail_Concept_2/TopChoiceDetail.dart';
import 'package:booking_hotel_firebase/UI/B1_Home/Hotel/Hotel_Detail_Concept_2/hotelDetail_concept_2.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:booking_hotel_firebase/Library/SupportingLibrary/Ratting/Rating.dart';

class LosAngeles extends StatefulWidget {
  final String title, userId;
  LosAngeles({this.title, this.userId});

  @override
  _LosAngelesState createState() => _LosAngelesState();
}

class _LosAngelesState extends State<LosAngeles> {
  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;

    var _appBar = PreferredSize(
      preferredSize: Size.fromHeight(45.0),
      child: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(widget.title,
            style: TextStyle(fontFamily: "Sofia", color: Colors.black)),
      ),
    );

    var _description = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
          child: Text(
            widget.title,
            style: TextStyle(
                fontFamily: "Sofia",
                fontWeight: FontWeight.w700,
                fontSize: 20.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 10.0, bottom: 30.0),
          child: Container(
              width: MediaQuery.of(context).size.width - 10.0,
              child: Text(
                AppLocalizations.of(context).tr('losAngelesDesc'),
                style: TextStyle(
                    fontFamily: "Sofia",
                    fontWeight: FontWeight.w300,
                    fontSize: 14.5,
                    color: Colors.black45),
                overflow: TextOverflow.clip,
                textAlign: TextAlign.justify,
              )),
        ),
      ],
    );

    var _topLosAngeles = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
          child: Text(
            AppLocalizations.of(context).tr('topChoice'),
            style: TextStyle(
                fontFamily: "Sofia",
                fontSize: 20.0,
                fontWeight: FontWeight.w700),
          ),
        ),
        SizedBox(height: 5.0),
        Container(
          height: 320.0,
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("discover")
                .where("location", isEqualTo: 'Los Angeles')
                .snapshots(),
            builder: (BuildContext ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return new Container(
                  height: 190.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://images2.imgbox.com/a9/7e/JkiFnCo3_o.png"))),
                );
              }
              return snapshot.hasData
                  ? new card(
                      dataUser: widget.userId,
                      list: snapshot.data.docs,
                    )
                  : Container(
                      height: 10.0,
                    );
            },
          ),
        ),
        SizedBox(
          height: 25.0,
        ),
      ],
    );

    var _recommended = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 22.0, right: 20.0),
          child: Text(
            AppLocalizations.of(context).tr('hotelsLosAngeles'),
            style: TextStyle(
                fontFamily: "Sofia",
                fontSize: 20.0,
                fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 5.0),
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("hotel")
                .where('location', isEqualTo: 'Los Angeles')
                .snapshots(),
            builder: (BuildContext ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return new Container(
                  height: 190.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://images2.imgbox.com/a9/7e/JkiFnCo3_o.png"))),
                );
              }
              return snapshot.hasData
                  ? new cardList(
                      dataUser: widget.userId,
                      list: snapshot.data.docs,
                    )
                  : Container(
                      height: 10.0,
                    );
            },
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
      ],
    );

    Future getCarouselWidget() async {
      var firestore = FirebaseFirestore.instance;
      QuerySnapshot qn = await firestore
          .collection("banner")
          .where("location", isEqualTo: "Los Angeles")
          .get();
      return qn.docs;
    }

    return EasyLocalizationProvider(
      data: data,
      child: Scaffold(
        appBar: _appBar,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 250.0,
                child: new Carousel(
                  boxFit: BoxFit.cover,
                  dotColor: Colors.white.withOpacity(0.8),
                  dotSize: 5.5,
                  dotSpacing: 16.0,
                  dotBgColor: Colors.transparent,
                  showIndicator: true,
                  overlayShadow: true,
                  overlayShadowColors: Colors.white.withOpacity(0.9),
                  overlayShadowSize: 0.9,
                  images: [0, 1, 2].map((i) {
                    return FutureBuilder(
                        future: getCarouselWidget(),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (!snapshot.hasData) {
                            return new Container(
                              height: 190.0,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "https://images2.imgbox.com/a9/7e/JkiFnCo3_o.png"),
                                      fit: BoxFit.cover)),
                            );
                          }

                          return InkWell(
                            onTap: () {},
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: FractionalOffset(0.0, 0.0),
                                  end: FractionalOffset(0.0, 1.0),
                                  stops: [0.0, 1.0],
                                  colors: <Color>[
                                    Color(0x00FFFFFF),
                                    Color(0xFFFFFFFF),
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 9.0,
                                      spreadRadius: 7.0,
                                      color: Colors.black12.withOpacity(0.03))
                                ],
                                image: DecorationImage(
                                    image: NetworkImage(
                                        snapshot.data[i].data()["imageBanner"]),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          );
                        });
                  }).toList(),
                ),
              ),

              SizedBox(
                height: 20.0,
              ),

              /// Description
              _description,

              /// Top LosAngeles
              _topLosAngeles,

              /// Recommended
              _recommended,
            ],
          ),
        ),
      ),
    );
  }
}

class card extends StatelessWidget {
  final String dataUser;
  final List<DocumentSnapshot> list;
  card({this.dataUser, this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        primary: false,
        itemCount: list.length,
        itemBuilder: (context, i) {
          List<String> photo = List.from(list[i].data()['photo']);
          List<String> service = List.from(list[i].data()['service']);
          List<String> description = List.from(list[i].data()['description']);
          String title = list[i].data()['title'].toString();
          String type = list[i].data()['type'].toString();
          num rating = list[i].data()['rating'];
          String location = list[i].data()['location'].toString();
          String image = list[i].data()['image'].toString();
          String id = list[i].data()['id'].toString();
          num price = list[i].data()['price'];
          num latLang1 = list[i].data()['latLang1'];
          num latLang2 = list[i].data()['latLang2'];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (_, __, ___) => new TopChoiceDetail(
                              userId: dataUser,
                              titleD: title,
                              idD: id,
                              imageD: image,
                              latLang1D: latLang1,
                              latLang2D: latLang2,
                              locationD: location,
                              priceD: price,
                              descriptionD: description,
                              photoD: photo,
                              ratingD: rating,
                              serviceD: service,
                              typeD: type,
                            ),
                        transitionDuration: Duration(milliseconds: 600),
                        transitionsBuilder:
                            (_, Animation<double> animation, __, Widget child) {
                          return Opacity(
                            opacity: animation.value,
                            child: child,
                          );
                        }));
                  },
                  child: Hero(
                    tag: 'hero-tag-${id}',
                    child: Material(
                      child: Container(
                        height: 220.0,
                        width: 160.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(image), fit: BoxFit.cover),
                            color: Colors.black12,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 5.0,
                                  color: Colors.black12.withOpacity(0.1),
                                  spreadRadius: 2.0)
                            ]),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  title,
                  style: TextStyle(
                      fontFamily: "Sofia",
                      fontWeight: FontWeight.w600,
                      fontSize: 17.0,
                      color: Colors.black87),
                ),
                SizedBox(
                  height: 2.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      size: 18.0,
                      color: Colors.black12,
                    ),
                    Text(
                      location,
                      style: TextStyle(
                          fontFamily: "Sofia",
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0,
                          color: Colors.black26),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      size: 18.0,
                      color: Colors.yellow,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0),
                      child: Text(
                        rating.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: "Sofia",
                            fontSize: 13.0),
                      ),
                    ),
                    SizedBox(
                      width: 35.0,
                    ),
                    Container(
                      height: 27.0,
                      width: 82.0,
                      decoration: BoxDecoration(
                          color: Color(0xFF09314F),
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      child: Center(
                        child: Text("\$ " + price.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 13.0)),
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        });
  }
}

class cardList extends StatelessWidget {
  final String dataUser;
  final List<DocumentSnapshot> list;

  final _txtStyleTitle = TextStyle(
    color: Colors.black87,
    fontFamily: "Gotik",
    fontSize: 17.0,
    fontWeight: FontWeight.w800,
  );

  final _txtStyleSub = TextStyle(
    color: Colors.black26,
    fontFamily: "Gotik",
    fontSize: 12.5,
    fontWeight: FontWeight.w600,
  );

  cardList({
    this.dataUser,
    this.list,
  });
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        primary: false,
        itemCount: list.length,
        itemBuilder: (context, i) {
          List<String> photo = List.from(list[i].data()['photo']);
          List<String> service = List.from(list[i].data()['service']);
          List<String> description = List.from(list[i].data()['description']);
          String title = list[i].data()['title'].toString();
          String type = list[i].data()['type'].toString();
          num rating = list[i].data()['rating'];
          String location = list[i].data()['location'].toString();
          String image = list[i].data()['image'].toString();
          String id = list[i].data()['id'].toString();
          num price = list[i].data()['price'];
          num latLang1 = list[i].data()['latLang1'];
          num latLang2 = list[i].data()['latLang2'];

          return Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (_, __, ___) => new hotelDetail2(
                          userId: dataUser,
                          titleD: title,
                          idD: id,
                          imageD: image,
                          latLang1D: latLang1,
                          latLang2D: latLang2,
                          locationD: location,
                          priceD: price,
                          descriptionD: description,
                          photoD: photo,
                          ratingD: rating,
                          serviceD: service,
                          typeD: type,
                        ),
                    transitionDuration: Duration(milliseconds: 600),
                    transitionsBuilder:
                        (_, Animation<double> animation, __, Widget child) {
                      return Opacity(
                        opacity: animation.value,
                        child: child,
                      );
                    }));
              },
              child: Container(
                height: 250.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12.withOpacity(0.1),
                          blurRadius: 3.0,
                          spreadRadius: 1.0)
                    ]),
                child: Column(children: [
                  Hero(
                    tag: 'hero-tag-${id}',
                    child: Material(
                      child: Container(
                        height: 165.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10.0),
                              topLeft: Radius.circular(10.0)),
                          image: DecorationImage(
                              image: NetworkImage(image), fit: BoxFit.cover),
                        ),
                        alignment: Alignment.topRight,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                  width: 220.0,
                                  child: Text(
                                    title,
                                    style: _txtStyleTitle,
                                    overflow: TextOverflow.ellipsis,
                                  )),
                              Padding(padding: EdgeInsets.only(top: 5.0)),
                              Row(
                                children: <Widget>[
                                  ratingbar(
                                    starRating: rating,
                                    color: Color(0xFF09314F),
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 5.0)),
                                  Text(
                                    "(" + rating.toString() + ")",
                                    style: _txtStyleSub,
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.9),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.location_on,
                                      size: 16.0,
                                      color: Colors.black26,
                                    ),
                                    Padding(padding: EdgeInsets.only(top: 3.0)),
                                    Text(location, style: _txtStyleSub)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 13.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "\$" + price.toString(),
                                style: TextStyle(
                                    fontSize: 25.0,
                                    color: Color(0xFF09314F),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Gotik"),
                              ),
                              Text(AppLocalizations.of(context).tr('perNight'),
                                  style: _txtStyleSub.copyWith(fontSize: 11.0))
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            ),
          );
        });
  }
}

class cardCountry extends StatelessWidget {
  final Color colorTop, colorBottom;
  final String image, title;
  cardCountry({this.colorTop, this.colorBottom, this.title, this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 105.0,
            width: 105.0,
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(blurRadius: 8.0, color: Colors.black12)],
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              gradient: LinearGradient(
                  colors: [colorTop, colorBottom],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    image,
                    height: 60,
                    color: Colors.white,
                  )),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Sofia",
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}

/// Component item Menu icon bellow a Description
class CategoryIconValue extends StatelessWidget {
  final String icon1, icon2, icon3, icon4, title1, title2, title3, title4;
  final GestureTapCallback tap1, tap2, tap3, tap4;

  CategoryIconValue(
      {this.icon1,
      this.tap1,
      this.icon2,
      this.tap2,
      this.icon3,
      this.tap3,
      this.icon4,
      this.tap4,
      this.title1,
      this.title2,
      this.title3,
      this.title4});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        InkWell(
          onTap: tap1,
          child: Column(
            children: <Widget>[
              Image.asset(
                icon1,
                height: 30.2,
                fit: BoxFit.cover,
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Text(
                title1,
                style: TextStyle(
                  fontFamily: "Sans",
                  fontSize: 11.5,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
        InkWell(
          onTap: tap2,
          child: Column(
            children: <Widget>[
              Image.asset(
                icon2,
                height: 32.2,
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Text(
                title2,
                style: TextStyle(
                  fontFamily: "Sans",
                  fontSize: 11.5,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
        InkWell(
          onTap: tap3,
          child: Column(
            children: <Widget>[
              Image.asset(
                icon3,
                height: 32.2,
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Text(
                title3,
                style: TextStyle(
                  fontFamily: "Sans",
                  fontSize: 11.5,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
        InkWell(
          onTap: tap4,
          child: Column(
            children: <Widget>[
              Image.asset(
                icon4,
                height: 32.2,
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Text(
                title4,
                style: TextStyle(
                  fontFamily: "Sans",
                  fontSize: 11.5,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

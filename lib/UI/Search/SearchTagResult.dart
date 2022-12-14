import 'package:booking_hotel_firebase/Library/Multiple_Language/Language_Library/lib/easy_localization_delegate.dart';
import 'package:booking_hotel_firebase/Library/Multiple_Language/Language_Library/lib/easy_localization_provider.dart';
import 'package:booking_hotel_firebase/Library/SupportingLibrary/Ratting/Rating.dart';
import 'package:booking_hotel_firebase/UI/B1_Home/Hotel/Hotel_Detail_Concept_2/hotelDetail_concept_2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchTagResult extends StatefulWidget {
  final String userID, type, data;
  SearchTagResult({this.userID, this.data, this.type});

  @override
  _SearchTagResultState createState() => _SearchTagResultState();
}

class _SearchTagResultState extends State<SearchTagResult> {
  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    return EasyLocalizationProvider(
      data: data,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context).tr('searchTag'),
            style: TextStyle(fontFamily: "Sofia", color: Colors.black),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("hotel")
                      .where(widget.type, isEqualTo: widget.data)
                      .snapshots(),
                  builder: (BuildContext ctx,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
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
                            dataUser: widget.userID,
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
          ),
        ),
      ),
    );
  }
}

class cardList extends StatelessWidget {
  final String dataUser;
  final List<DocumentSnapshot> list;

  @override
  cardList({
    this.dataUser,
    this.list,
  });

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
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12.withOpacity(0.1),
                        blurRadius: 1.0,
                        spreadRadius: 1.0)
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    Hero(
                      tag: 'hero-tag-${id}',
                      child: Material(
                        child: Container(
                          height: 180.0,
                          width: 120.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(image), fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 174.0,
                            child: Text(
                              title,
                              style: TextStyle(
                                fontFamily: "Sofia",
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                width: 5.0,
                              ),
                              Container(
                                width: 150.0,
                                child: Text(
                                  "\$ " + price.toString() + "/Night",
                                  style: TextStyle(
                                    fontFamily: "Sofia",
                                    fontSize: 16.0,
                                    color: Color(0xFF09314F),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(
                                Icons.pin_drop,
                                size: 16.0,
                                color: Colors.black38,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Container(
                                width: 150.0,
                                child: Text(
                                  location,
                                  style: TextStyle(
                                    fontFamily: "Sofia",
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(
                                Icons.star,
                                size: 17.0,
                                color: Colors.yellow,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15.0),
                                child: Text(
                                  rating.toString(),
                                  style: TextStyle(
                                    fontFamily: "Sans",
                                    fontSize: 15.0,
                                    color: Colors.yellow,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

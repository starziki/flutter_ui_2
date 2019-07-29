import 'package:adidas_shoes_ecommerce_app_ui/data.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'utils.dart';
import 'data.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xFF696D77),
            Color(0xFF292c36),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.clamp,
        )),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  size: screenAwareSize(20.0, context),
                ),
                onPressed: () {},
              ),
              title: Text(
                "Energy Cloud",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenAwareSize(18.0, context),
                ),
              ),
              centerTitle: true,
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    size: screenAwareSize(20.0, context),
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            body: Column(
              children: <Widget>[
                ProductScreenTopPart(),
                ProductScrrenBottomPart()
              ],
            )));
  }
}

class ProductScreenTopPart extends StatefulWidget {
  @override
  _ProductScreenTopPartState createState() => new _ProductScreenTopPartState();
}

class _ProductScreenTopPartState extends State<ProductScreenTopPart> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: screenAwareSize(245.0, context),
        child: Stack(
          children: <Widget>[
            Stack(children: <Widget>[
              Container(
                  child: Image.asset("assets/adidas.png",
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover)),
              Padding(
                  padding: const EdgeInsets.only(top: 60, right: 35),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                        width: screenAwareSize(50.0, context),
                        height: screenAwareSize(50.0, context),
                        decoration: BoxDecoration(
                            color: Colors.black26, shape: BoxShape.circle),
                        child: Image.asset("assets/360.png")),
                  ))
            ]),
            Positioned(
                left: screenAwareSize(10.0, context),
                bottom: screenAwareSize(10.0, context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Rating",
                        style: TextStyle(
                            color: Color(0xFF949598),
                            fontSize: screenAwareSize(10.0, context),
                            fontFamily: "Montserrat-SemiBold")),
                    SizedBox(
                      height: screenAwareSize(8.0, context),
                    ),
                    Row(children: <Widget>[
                      SizedBox(
                        width: 8.0,
                      ),
                      Icon(Icons.star, color: Color(0xFFFFE600)),
                      SizedBox(width: screenAwareSize(5.0, context)),
                      Text("4.5", style: TextStyle(color: Color(0xFFFFE600))),
                      SizedBox(
                        width: screenAwareSize(5.0, context),
                      ),
                      Text("(378 People)",
                          style: TextStyle(color: Colors.white)),
                    ])
                  ],
                ))
          ],
        ));
  }
}

class ProductScrrenBottomPart extends StatefulWidget {
  @override
  _ProductScrrenBottomPartState createState() =>
      _ProductScrrenBottomPartState();
}

class _ProductScrrenBottomPartState extends State<ProductScrrenBottomPart> {
  bool isExpeneded = false;

  int currrentSizeIndex = 0;

  void _expand() {
    setState(() {
      isExpeneded ? isExpeneded = false : isExpeneded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(left: screenAwareSize(18.0, context)),
              child: Text(
                "Product Description",
                style: TextStyle(
                  color: Color(0xFF949598),
                  fontSize: screenAwareSize(10.0, context),
                  fontFamily: "Montserrat-SemiBold",
                ),
              )),
          SizedBox(height: screenAwareSize(8.0, context)),
          Padding(
            padding: EdgeInsets.only(
                left: screenAwareSize(26.0, context),
                right: screenAwareSize(18, context)),
            child: AnimatedCrossFade(
                firstChild: Text(
                  desc,
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenAwareSize(10, context),
                    fontFamily: "Montserrat-Medium",
                  ),
                ),
                secondChild: Text(
                  desc,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenAwareSize(10, context),
                    fontFamily: "Montserrat-Medium",
                  ),
                ),
                crossFadeState: isExpeneded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: kThemeAnimationDuration),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenAwareSize(26.0, context),
                right: screenAwareSize(18.0, context)),
            child: GestureDetector(
                onTap: _expand,
                child: Text(isExpeneded ? "less" : "more",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFFB382F)))),
          ),
          SizedBox(height: screenAwareSize(12.0, context)),
          Padding(
            padding: EdgeInsets.only(
                left: screenAwareSize(15, context),
                right: screenAwareSize(75, context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Size",
                  style: TextStyle(
                    color: Color(0xFF949598),
                    fontSize: screenAwareSize(10.0, context),
                    fontFamily: "Montserrat-SemiBold",
                  ),
                ),
                Text(
                  "Quantity",
                  style: TextStyle(
                    color: Color(0xFF949598),
                    fontSize: screenAwareSize(10.0, context),
                    fontFamily: "Montserrat-SemiBold",
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: screenAwareSize(30, context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: screenAwareSize(30.0, context),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: sizeNumlist.map((item) {
                      var index = sizeNumlist.indexOf(item);
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            currrentSizeIndex = index;
                          });
                        },
                        child:
                            sizeItem(item, index == currrentSizeIndex, context),
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                      width: screenAwareSize(100, context),
                      height: screenAwareSize(30, context),
                      decoration: BoxDecoration(
                        color: Color(0xFF525663),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Flexible(
                            flex: 3,
                            child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                    height: double.infinity,
                                    child: Center(
                                        child: Text("-",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontFamily:
                                                    "Montserrat-Bold"))))),
                          ),
                          diver(),
                          Flexible(
                            flex: 3,
                            child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                    height: double.infinity,
                                    child: Center(
                                        child: Text("1",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontFamily:
                                                    "Montserrat-Bold"))))),
                          ),
                          diver(),
                          Flexible(
                            flex: 3,
                            child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                    height: double.infinity,
                                    child: Center(
                                        child: Text("-",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontFamily:
                                                    "Montserrat-Bold"))))),
                          ),
                        ],
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget sizeItem(String size, bool isSelected, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 15.0),
    child: Container(
        width: screenAwareSize(30.0, context),
        height: screenAwareSize(30.0, context),
        decoration: BoxDecoration(
            color: isSelected ? Color(0xFFFC3930) : Color(0xFF525663),
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                  color: isSelected
                      ? Colors.black.withOpacity(0.5)
                      : Colors.black12,
                  offset: Offset(0.0, 10.0),
                  blurRadius: 10.0)
            ]),
        child: Center(
          child: Text(size,
              style: TextStyle(
                  color: Colors.white, fontFamily: "Montserrat-Bold")),
        )),
  );
}
Widget diver(){
  return Padding(padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4.0),
  child: Container (width: 0.8, color: Colors.black));
}
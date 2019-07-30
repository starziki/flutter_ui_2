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
  int _counter = 0;
  int currentColorIndex = 0;

  void _increase() {
    setState(() => _counter++);
  }

  void _decrease() {
    setState(() => (--_counter < 0) ? ++_counter : _counter);
  }

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
            Padding(
              padding: EdgeInsets.only(
                  left: screenAwareSize(20, context),
                  right: screenAwareSize(10, context)),
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
                          child: sizeItem(
                              item, index == currrentSizeIndex, context),
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
                                  onTap: _decrease,
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
                                          child: Text("$_counter",
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
                                  onTap: _increase,
                                  child: Container(
                                      height: double.infinity,
                                      child: Center(
                                          child: Text("+",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontFamily:
                                                      "Montserrat-Bold"))))),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: screenAwareSize(18, context)),
              child: Text("Select Color",
                  style: TextStyle(
                      color: Color(0xFF949598),
                      fontSize: screenAwareSize(10.0, context),
                      fontFamily: "Montserrat-SemiBold")),
            ),
            SizedBox(
              height: screenAwareSize(8.0, context),
            ),
            Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: screenAwareSize(20, context)),
                height: screenAwareSize(34.0, context),
                child: Row(children: colorSelection())),
            SizedBox(
              height: screenAwareSize(6, context),
            ),
            Padding(
              padding: EdgeInsets.only(left: screenAwareSize(20.0, context)),
              child: Text("Price",
                  style: TextStyle(
                      color: Color(0xFF949598),
                      fontFamily: "Montserrat-SemiBold")),
            ),
            Container(
                width: double.infinity,
                height: screenAwareSize(100, context),
                child: Stack(alignment: Alignment.topCenter, children: <Widget>[
                  Container(
                      margin:
                          EdgeInsets.only(left: screenAwareSize(22.0, context)),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(
                                    left: screenAwareSize(18.0, context)),
                                child: Row(children: <Widget>[
                                  Text("\$",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Montserrat-Medium",
                                        fontSize: screenAwareSize(26, context),
                                      )),
                                  SizedBox(width: screenAwareSize(18, context)),
                                  Text("80",
                                      style: TextStyle(
                                          fontSize:
                                              screenAwareSize(26, context),
                                          color: Colors.white,
                                          fontFamily: "Montserrat-Medium")),
                                ])),
                            SizedBox(height: screenAwareSize(10.0, context)),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: MaterialButton(
                                color: Color(0xfffb382f),
                                padding: EdgeInsets.symmetric(
                                  vertical: screenAwareSize(14, context),
                                ),
                                onPressed: () {},

                                child: Padding(
                                  padding: EdgeInsets.only(left:screenAwareSize(35, context)),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    
                                    child:
                                    Text(
                                    "Add to Cart",
                                    textAlign: TextAlign.left,
                                    
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Montserrat-Medium",
                                        fontSize: screenAwareSize(18.0, context)),
                                  ),),
                                )
                              ),
                            )
                          ])),
                          Positioned(
                            right:-40.0,
                            bottom: -45.0,
                            child:Image.asset("assets/cart.png",
                              width: screenAwareSize(190, context),
                            height: screenAwareSize(155, context),
                            fit: BoxFit.cover,)
                          )
                ]))
          ],
        ));
  }

  List<Widget> colorSelection() {
    List<Widget> colorItemList = new List<Widget>();
    for (var i = 0; i < colors.length; i++) {
      colorItemList
          .add(colorItem(colors[i], i == currentColorIndex, context, () {
        setState(() {
          currentColorIndex = i;
        });
      }));
    }
    return colorItemList;
  }
}

Widget colorItem(
    Color color, bool isSelected, BuildContext context, VoidCallback _ontab) {
  return GestureDetector(
      onTap: _ontab,
      child: Padding(
          padding: EdgeInsets.only(
            left: screenAwareSize(10.0, context),
          ),
          child: Container(
              width: screenAwareSize(30, context),
              height: screenAwareSize(30.0, context),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: Colors.black.withOpacity(.8),
                          blurRadius: 10.0,
                          offset: Offset(0.0, 10.0),
                        )
                      ]
                    : [],
              ),
              child: ClipPath(
                clipper: MClipp(),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: color,
                ),
              ))));
}

class MClipp extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width * 0.2, size.height);
    path.lineTo(size.width, size.height * 0.2);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

Widget sizeItem(String size, bool isSelected, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 12.0),
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

Widget diver() {
  return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4.0),
      child: Container(width: 0.8, color: Colors.black));
}

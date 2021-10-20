import 'package:flutter/material.dart';

styledTextSelector(
    String textContent,
    double fontSizeValue,
    FontWeight fontWeightValue,
    Color fontColor,
    double paddingLeft,
    double paddingTop,
    double paddingRight,
    double paddingBottom) {
  return Align(
    alignment: Alignment.bottomLeft,
    child: Padding(
      padding: EdgeInsets.fromLTRB(
          paddingLeft, paddingTop, paddingRight, paddingBottom),
      child: Text(
        textContent,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: fontSizeValue,
            fontWeight: fontWeightValue,
            color: fontColor),
      ),
    ),
  );
}

categoryCard(String imageUrl, String text) {
  return Stack(children: <Widget>[
    InkWell(
      onTap: () {},
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          alignment: Alignment.bottomRight,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.network(
              imageUrl,
              height: 200,
            ),
          )),
    ),
    styledTextSelector(text, 28, FontWeight.normal, Colors.black, 20, 0, 0, 10),
  ]);
}

recomendationsItem({
  required String imageUrl,
  required String title,
  required String price,
}) {
  return InkWell(
    onTap: () {},
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0)),
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  imageUrl,
                  height: 210,
                )),
            styledTextSelector(
                title, 26, FontWeight.normal, Colors.black, 0, 20, 0, 10),
            styledTextSelector(
                price, 20, FontWeight.w400, Colors.grey.shade500, 0, 0, 0, 0),
          ],
        ),
      ),
    ),
  );
}

recommendationsList(List<List> data) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    height: 310,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        ...data.map((params) => recomendationsItem(
              imageUrl: params[0],
              title: params[1],
              price: params[2],
            ))
      ],
    ),
  );
}

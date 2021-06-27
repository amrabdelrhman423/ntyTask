import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nyt/Model/results_model.dart';

class ArticleItem extends StatelessWidget {
  final Results results;

  ArticleItem({Key? key, required this.results}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 2,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              Center(
                child: CarouselSlider.builder(
                  itemCount: results.multimedia!.length,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: NetworkImage(
                            results.multimedia![itemIndex].url!,
                          ),
                          fit: BoxFit.cover,
                        )),
                    width: double.infinity,
                  ),
                  options: CarouselOptions(
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 0.7,
                color: Colors.black,
              ),
              Container(
                height: 0.7,
              ),
              Container(
                height: 0.7,
                color: Colors.black,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Row(children: [
                  Text(
                    "Title : ",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Flexible(
                    child: Text(
                      results.title!,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                  )
                ]),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Abstract : ",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Flexible(
                          child: Text(
                        results.abstract!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        softWrap: true,
                      ))
                    ]),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text(
                    "Published Date : ",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Flexible(
                      child: Text(
                    results.publishedDate!.split("T")[0],
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    softWrap: true,
                  )),
                ]),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text(
                    "Created Date : ",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Flexible(
                      child: Text(
                    results.createdDate!.split("T")[0],
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    softWrap: true,
                  )),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

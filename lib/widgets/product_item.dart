import 'package:ecomerce/models/model.dart';
import 'package:ecomerce/widgets/network_image.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget{
  final String image;
  final String title;
  ProductItem({this.image, this.title});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              children: [
                Container(
                  height: 70,
                  child:  Row(
                    children: [
                      Container(
                        width: 5,
                        decoration: BoxDecoration(
                          color: Theme.of(context).hoverColor,
                        ),
                      ),
                      Container(
                          width: 80,
                          child: PNetworkImage(image,
                            width: 50,
                            height: 50,)
                      ),
                      Container(
                        width: 5,
                        decoration: BoxDecoration(
                          color: Theme.of(context).hoverColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(title)
              ],
            ),
            SizedBox(width: 10,),
            Column(
              children: [
                Container(
                  height: 70,
                  child:  Row(
                    children: [
                      Container(
                        width: 5,
                        decoration: BoxDecoration(
                          color: Theme.of(context).hoverColor,
                        ),
                      ),
                      Container(
                          width: 80,
                          child: PNetworkImage(image,
                            width: 50,
                            height: 50,)
                      ),
                      Container(
                        width: 5,
                        decoration: BoxDecoration(
                          color: Theme.of(context).hoverColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(title)
              ],
            ),
            SizedBox(width: 10,),
            Column(
              children: [
                Container(
                  height: 70,
                  child:  Row(
                    children: [
                      Container(
                        width: 5,
                        decoration: BoxDecoration(
                          color: Theme.of(context).hoverColor,
                        ),
                      ),
                      Container(
                          width: 80,
                          child: PNetworkImage(image,
                            width: 50,
                            height: 50,)
                      ),
                      Container(
                        width: 5,
                        decoration: BoxDecoration(
                          color: Theme.of(context).hoverColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(title)
              ],
            ),
          ],
        ),
        Row(
          children: [
            Column(
              children: [
                Container(
                  height: 70,
                  child:  Row(
                    children: [
                      Container(
                        width: 5,
                        decoration: BoxDecoration(
                          color: Theme.of(context).hoverColor,
                        ),
                      ),
                      Container(
                          width: 80,
                          child: PNetworkImage(image,
                            width: 50,
                            height: 50,)
                      ),
                      Container(
                        width: 5,
                        decoration: BoxDecoration(
                          color: Theme.of(context).hoverColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(title)
              ],
            ),
            SizedBox(width: 10,),
            Column(
              children: [
                Container(
                  height: 70,
                  child:  Row(
                    children: [
                      Container(
                        width: 5,
                        decoration: BoxDecoration(
                          color: Theme.of(context).hoverColor,
                        ),
                      ),
                      Container(
                          width: 80,
                          child: PNetworkImage(image,
                            width: 50,
                            height: 50,)
                      ),
                      Container(
                        width: 5,
                        decoration: BoxDecoration(
                          color: Theme.of(context).hoverColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(title)
              ],
            ),
            SizedBox(width: 10,),
          ],
        ),
      ],
    );
  }
}
import 'package:ecomerce/models/model.dart';
import 'package:flutter/material.dart';

class HomeMenu extends StatefulWidget {
  final Category category;
  const HomeMenu({Key key, this.category});
  @override
  _HomeMenuState createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: GridView.count(
        crossAxisCount: 4,
        physics: NeverScrollableScrollPhysics(),
        children: List.generate(categories.length, (index) {
          return GestureDetector(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 46,
                  height: 46,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: categories[index].color),
                  child: Icon(categories[index].icon, color: Colors.white),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 3, left: 2, right: 2),
                  child: Text(
                    categories[index].name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}

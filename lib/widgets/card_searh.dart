import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/common/shared_value.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/common/style.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/models/restaurant_search.dart';

class CardRestoSearch extends StatelessWidget {
  final Restaurantss restaurant;
  final List<Restaurantss> resto;
  final Function onTap;

  const CardRestoSearch(this.restaurant, this.resto, {this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Card(
        margin: EdgeInsets.fromLTRB(
            16, 12, 16, (restaurant == resto.last) ? 12 : 0),
        elevation: 1,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 6),
                  height: 100,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      image: DecorationImage(
                          image: (restaurant.pictureId != null)
                              ? NetworkImage(baseURL +
                                  'images/medium/' +
                                  restaurant.pictureId)
                              : AssetImage('assets/no-image.png'),
                          fit: BoxFit.cover)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 6, bottom: 10),
                        child: Text(
                          restaurant.name,
                          style: font1,
                        )),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.pin_drop,
                            color: Colors.grey,
                          ),
                          Text(
                            restaurant.city,
                            style: font2,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: List<Widget>.generate(
                                5,
                                (index) => Icon(
                                      (index < restaurant.rating.round())
                                          ? MdiIcons.star
                                          : MdiIcons.starOutline,
                                      size: 16,
                                      color: Colors.amber,
                                    )) +
                            [
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                restaurant.rating.toString(),
                                style: font2,
                              )
                            ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

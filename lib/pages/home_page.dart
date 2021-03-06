

import '../models/Product.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/catalog.dart';
import '../widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();

}
class _HomePageState extends State<HomePage>{
  // ignore: non_constant_identifier_names
  Widget build(BuildContext){

    print('build HomePage');

    // final productData = Provider.of<ProductDataProvider>(context);
    // *Для версии > 4.1.0
    final productData = context.watch<ProductDataProvider>();

    return Scaffold(
      backgroundColor: Colors.pink,
      body: SafeArea(
        child: Container(
            height: MediaQuery.of(context).size.height - 85,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                )
            ),
            child: ListView(
              padding: const EdgeInsets.all(10.0),
              children: <Widget>[

                Container(
                  child: ListTile(
                    title: Text(
                      'Delicious pizza ',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        'More than 100 kinds!',
                        style: TextStyle(fontSize: 16,)
                    ),
                    trailing: Icon(Icons.panorama_horizontal),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.all(5.0),
                  height: 290,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: productData.items.length,
                      itemBuilder: (context, int index) =>

                          ChangeNotifierProvider.value(
                            value: productData.items[index],
                            child: ItemCard(),
                          )

                    //ItemCard(product: productData.items[index]),

                  ),
                ),

                ...productData.items.map((value) {
                  return CatalogListTile(imgUrl: value.imgUrl);
                }).toList(),

              ],
            )
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
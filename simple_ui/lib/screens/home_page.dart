import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:simple_ui/data/data.dart';
import 'package:simple_ui/models/product.dart';
import 'package:simple_ui/widgets/notifiication_bag.dart';

import '../widgets/app_drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      backgroundColor: Color(0xfffbecd5),
      appBar: AppBar(
        leading: IconButton(
          color: Colors.white,
          onPressed: () {
            _scaffoldState.currentState!.openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Home Screen',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          //   IconButton(
          //       onPressed: () {},
          //       icon: const Icon(
          //         Icons.shopping_bag_rounded,
          //         color: Colors.white,
          //       ))
          const NotificationShoppingBag(),
        ],
      ),
      drawer: const AppDrawer(),
      body: const MyGridView(),
    );
  }
}

class MyGridView extends StatelessWidget {
  const MyGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          childAspectRatio: 1),
      itemBuilder: (context, index) => GridContainer(
        product: ProductList[index],
      ),
      itemCount: ProductList.length,
    );
  }
}

class GridContainer extends StatefulWidget {
  final Product product;
  const GridContainer({
    required this.product,
    Key? key,
  }) : super(key: key);

  @override
  State<GridContainer> createState() => _GridContainerState();
}

class _GridContainerState extends State<GridContainer> {
  final double editedRating = 1.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 180,
      width: 180,
      color: Colors.white,
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Text(
            widget.product.name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 3,
          ),
          RatingBar.builder(
              allowHalfRating: true,
              initialRating: widget.product.rating,
              minRating: 1.0,
              maxRating: 5.0,
              itemSize: 20,
              itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
              onRatingUpdate: (rating) {
                setState(() {
                  rating = rating;
                });
              }),
          const SizedBox(
            height: 3,
          ),
          Text(
            "\$${widget.product.lowerPrice.toInt()}-\$${widget.product.upperPrice.toInt()}",
            style: const TextStyle(
              color: Colors.black,
            ),
          )
        ]),
      ),
    );
  }
}

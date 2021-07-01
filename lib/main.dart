import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutterecommerce/components/horizontal_listview.dart';
import 'package:flutterecommerce/components/products.dart';
import 'package:flutterecommerce/components/vovolistview.dart';
import 'package:flutterecommerce/pages/cart.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/a.jpg'),
          AssetImage('images/b.jpg'),
          AssetImage('images/c.jpg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 2.0,
        dotBgColor: Colors.transparent,
      ),
    );
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.teal,
        title: Text('ActiveShop'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
          new IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Cart()));
              }),
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text('Muhammad Owais'),
              accountEmail: Text('Owaisraza2051@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: new BoxDecoration(color: Colors.teal),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Home page'),
                leading: Icon(
                  Icons.home,
                  color: Colors.teal,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My account'),
                leading: Icon(Icons.person, color: Colors.teal),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My orders'),
                leading: Icon(
                  Icons.shopping_basket,
                  color: Colors.teal,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Cart()));
              },
              child: ListTile(
                title: Text('Shopping Cart'),
                leading: Icon(
                  Icons.shopping_cart,
                  color: Colors.teal,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Favourites'),
                leading: Icon(
                  Icons.favorite,
                  color: Colors.teal,
                ),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help),
              ),
            ),
          ],
        ),
      ),
      body: new ListView(
        children: <Widget>[
          //image carousel begins here
          image_carousel,

          //padding widget
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text(
              'SHOP BY CATEGORY',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),

          //Horizontal list view begin here
          HorizontalList(),

          //padding widget
          new Padding(
            padding: const EdgeInsets.all(20.0),
            child: new Text(
              'RECENTLY VIEWED ITEMS',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),

          //Grid View
          Container(
            height: 380,
            child: Products(),
          ),

          //VovoList view begin here
          VovoList(),
        ],
      ),
    );
  }
}

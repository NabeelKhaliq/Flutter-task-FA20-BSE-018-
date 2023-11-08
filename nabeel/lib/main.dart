import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Map> items = [
    {"image": "https://images.pexels.com/photos/1426715/pexels-photo-1426715.jpeg?auto=compress&cs=tinysrgb&w=600", "title": "Breakfast Set", "price": 20},
    {"image": "https://images.pexels.com/photos/5745991/pexels-photo-5745991.jpeg?auto=compress&cs=tinysrgb&w=600", "title": "Veg Burger", "price": 30},
  ];
  final String address = "Vehari, Punjab";
  final String phone = "000000";
  final double total = 500;
  final double delivery = 100;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        body: PageView(
          children: [
            Stack(children: [
              Container(
                color: Colors.grey.withOpacity(.1),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 300, left: 25, right: 25),
                      child: TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            hintText: 'Enter your Email',
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white),
                            )
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 25, right: 25),
                      child: TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.key_rounded),
                            hintText: 'Password',
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white),
                            )
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 10),
                          child: Text('Forgot Password?'),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Container(height: 40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),gradient: LinearGradient(colors: [Colors.orangeAccent,Colors.deepOrangeAccent], begin: Alignment.centerLeft, end: Alignment.centerRight),),child: TextButton(onPressed: (){}, child: Text('Log In',style: TextStyle(fontWeight: FontWeight.bold),),style: TextButton.styleFrom(foregroundColor: Colors.white),)),
                        )),
                      ],
                    ),
                    Flexible(child: Align(alignment: Alignment.bottomCenter,child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: RichText(text: TextSpan(text: "Don't have an account ?",style: TextStyle(color: Colors.black),children: [TextSpan(text: ' Signup',style: TextStyle(color: Colors.deepOrangeAccent))]),),
                    )))
                  ],
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 450),
                  child: Container(
                    child: Align(alignment: Alignment.bottomRight,child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Text('Login',style: TextStyle(color: Colors.white, fontSize: 23),),
                    )),
                    decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.deepOrangeAccent, Colors.orangeAccent], begin: Alignment.topCenter, end: Alignment.bottomCenter),borderRadius: BorderRadius.only(bottomLeft: Radius.circular(120))),
                  ),
                ),
              ),
            ]),
            Stack(children: [
              Container(
                color: Colors.grey.withOpacity(.1),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 300, left: 25, right: 25),
                      child: TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            hintText: 'Fullname',
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white),
                            )
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 25, right: 25),
                      child: TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            hintText: 'Email',
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white),
                            )
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 25, right: 25),
                      child: TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            hintText: 'Phone Number',
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white),
                            )
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      child: TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.key),
                            hintText: 'Password',
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white),
                            )
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                          child: Container(height: 40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),gradient: LinearGradient(colors: [Colors.orangeAccent,Colors.deepOrangeAccent], begin: Alignment.centerLeft, end: Alignment.centerRight),),child: TextButton(onPressed: (){}, child: Text('Signup', style: TextStyle(fontWeight: FontWeight.bold),),style: TextButton.styleFrom(foregroundColor: Colors.white),)),
                        )),
                      ],
                    ),
                    Flexible(child: Align(alignment: Alignment.bottomCenter,child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 22),
                      child: RichText(text: TextSpan(text: "Already a member ?",style: TextStyle(color: Colors.black),children: [TextSpan(text: ' Signin',style: TextStyle(color: Colors.deepOrangeAccent))]),),
                    )))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 450),
                child: Container(
                  child: Align(alignment: Alignment.bottomRight,child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Text('Signup For Free',style: TextStyle(color: Colors.white, fontSize: 23),),
                  )),
                  decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.deepOrangeAccent, Colors.orangeAccent], begin: Alignment.topCenter, end: Alignment.bottomCenter),borderRadius: BorderRadius.only(bottomLeft: Radius.circular(120))),
                ),
              ),
            ]),
            Container(
              padding: const EdgeInsets.all(20.0),
              color: Colors.grey.shade800,
              child: ListView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 50,
                      ),
                      const SizedBox(
                        width: 200,
                        child: Image(image: AssetImage('Assets/polo.jpg')),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const ListTile(
                          title: TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                hintText: "Email address:",
                                hintStyle: TextStyle(color: Colors.white70),
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.email,
                                  color: Colors.white30,
                                )),
                          )),
                      Divider(
                        color: Colors.grey.shade600,
                      ),
                      const ListTile(
                          title: TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                hintText: "Password:",
                                hintStyle: TextStyle(color: Colors.white70),
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.lock,
                                  color: Colors.white30,
                                )),
                          )),
                      Divider(
                        color: Colors.grey.shade600,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.cyan,
                              ),
                              onPressed: () {},
                              child: const Text(
                                'Login',
                                style: TextStyle(color: Colors.white70, fontSize: 16.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Forgot your password?',
                        style: TextStyle(color: Colors.grey.shade500),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: Image(fit: BoxFit.cover, image: NetworkImage('https://images.pexels.com/photos/167703/pexels-photo-167703.jpeg?auto=compress&cs=tinysrgb&w=600',
                        )),),
                      Positioned(
                        bottom: 20.0,
                        left: 20.0,
                        right: 20.0,
                        child: Row(
                          children: const <Widget>[
                            Icon(
                              Icons.slideshow,
                              color: Colors.white,
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              "Technology",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            const Expanded(
                              child: Text("Oct 21, 2017"),
                            ),
                            IconButton(
                              icon: const Icon(Icons.share),
                              onPressed: () {},
                            )
                          ],
                        ),
                        Text(
                          "Lorem ipsum dolor sit amet",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: const <Widget>[
                            Icon(Icons.favorite_border),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text("20.2k"),
                            SizedBox(
                              width: 16.0,
                            ),
                            Icon(Icons.comment),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text("2.2k"),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Aperiam, ullam? Fuga doloremque repellendus aut sequi officiis dignissimos, enim assumenda tenetur reprehenderit quam error, accusamus ipsa? Officiis voluptatum sequi voluptas omnis. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Aperiam, ullam? Fuga doloremque repellendus aut sequi officiis dignissimos, enim assumenda tenetur reprehenderit quam error, accusamus ipsa? Officiis voluptatum sequi voluptas omnis.",
                          textAlign: TextAlign.justify,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                  SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: Image(fit: BoxFit.cover, image: NetworkImage('https://images.pexels.com/photos/167703/pexels-photo-167703.jpeg?auto=compress&cs=tinysrgb&w=600',
                    )),),
                  Container(
                    margin: const EdgeInsets.fromLTRB(16.0, 250.0, 16.0, 16.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0)),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Lorem ipsum dolor sit amet",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 10.0),
                        const Text("Oct 21, 2017 By DLohani"),
                        const SizedBox(height: 10.0),
                        const Divider(),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: const <Widget>[
                            Icon(Icons.favorite_border),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text("20.2k"),
                            SizedBox(
                              width: 16.0,
                            ),
                            Icon(Icons.comment),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text("2.2k"),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Aperiam, ullam? Fuga doloremque repellendus aut sequi officiis dignissimos, enim assumenda tenetur reprehenderit quam error, accusamus ipsa? Officiis voluptatum sequi voluptas omnis. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Aperiam, ullam? Fuga doloremque repellendus aut sequi officiis dignissimos, enim assumenda tenetur reprehenderit quam error, accusamus ipsa? Officiis voluptatum sequi voluptas omnis.",
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 10.0),
                        const Text(
                          "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Aperiam, ullam? Fuga doloremque repellendus aut sequi officiis dignissimos, enim assumenda tenetur reprehenderit quam error, accusamus ipsa? Officiis voluptatum sequi voluptas omnis. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Aperiam, ullam? Fuga doloremque repellendus aut sequi officiis dignissimos, enim assumenda tenetur reprehenderit quam error, accusamus ipsa? Officiis voluptatum sequi voluptas omnis.",
                          textAlign: TextAlign.justify,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30.0),
                      child: Text(
                        "CART",
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade700),
                      )),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(16.0),
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(
                          children: <Widget>[
                            Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(right: 30.0, bottom: 10.0),
                              child: Material(
                                borderRadius: BorderRadius.circular(5.0),
                                elevation: 3.0,
                                child: Container(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 80,
                                        child: Image(image: NetworkImage(items[index]["image"])),
                                      ),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              items[index]["title"],
                                              style: const TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 20.0,
                                            ),
                                            Text(
                                              "\$${items[index]['price']}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.0),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 20,
                              right: 15,
                              child: Container(
                                height: 30,
                                width: 30,
                                alignment: Alignment.center,
                                child: MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                  padding: const EdgeInsets.all(0.0),
                                  color: Colors.pinkAccent,
                                  child: const Icon(
                                    Icons.clear,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "Subtotal      \$50",
                          style:
                          TextStyle(color: Colors.grey.shade700, fontSize: 16.0),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          "Delivery       \$05",
                          style:
                          TextStyle(color: Colors.grey.shade700, fontSize: 16.0),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          "Cart Subtotal     \$55",
                          style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: MaterialButton(
                            height: 50.0,
                            color: Colors.pinkAccent,
                            child: Text(
                              "Secure Checkout".toUpperCase(),
                              style: const TextStyle(color: Colors.white),
                            ),
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              padding:
              const EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0, bottom: 10.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text("Subtotal"),
                      Text("Rs. $total"),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text("Delivery fee"),
                      Text("Rs. $delivery"),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Total",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text("Rs. ${total + delivery}",
                          style: Theme.of(context).textTheme.titleLarge),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                      color: Colors.grey.shade200,
                      padding: const EdgeInsets.all(8.0),
                      width: double.infinity,
                      child: Text("Delivery Address".toUpperCase())),
                  Column(
                    children: <Widget>[
                      RadioListTile(
                        selected: true,
                        value: address,
                        groupValue: address,
                        title: Text(address),
                        onChanged: (value) {},
                      ),
                      RadioListTile(
                        selected: false,
                        value: "New Address",
                        groupValue: address,
                        title: const Text("Choose new delivery address"),
                        onChanged: (value) {},
                      ),
                      Container(
                          color: Colors.grey.shade200,
                          padding: const EdgeInsets.all(8.0),
                          width: double.infinity,
                          child: Text("Contact Number".toUpperCase())),
                      RadioListTile(
                        selected: true,
                        value: phone,
                        groupValue: phone,
                        title: Text(phone),
                        onChanged: (value) {},
                      ),
                      RadioListTile(
                        selected: false,
                        value: "New Phone",
                        groupValue: phone,
                        title: const Text("Choose new contact number"),
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                      color: Colors.grey.shade200,
                      padding: const EdgeInsets.all(8.0),
                      width: double.infinity,
                      child: Text("Payment Option".toUpperCase())),
                  RadioListTile(
                    groupValue: true,
                    value: true,
                    title: const Text("Cash on Delivery"),
                    onChanged: (value) {},
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      onPressed: () => {},
                      child: const Text(
                        "Confirm Order",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            )
          ]
        ),
      ),
    );
  }
}





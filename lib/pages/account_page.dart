import 'package:flutter/material.dart';
import 'package:online_shop_app/json/constant.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: getBody(),
    );

  }

  Widget getBody() {
    return ListView(
      children: [

        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
          child: Row(
            children: [
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: NetworkImage(profileUrl), fit: BoxFit.cover))
                  ),
              const SizedBox(
                width: 20,
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                        "Joe Wittenbreder",
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "2-year member",
                      style: TextStyle(fontSize: 13, color: Colors.black.withOpacity(0.7))
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(16.0),
                        primary: Colors.white,
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () => {},
                      child: const Text('Edit profile', style: TextStyle(fontSize: 20, color: Colors.white))
                    )
                  ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.shopping_basket, size: 30),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Orders",
                    style: TextStyle(fontSize: 17),
                  )
                ],
              ),
              Row(
                children: const [
                  Icon(Icons.add_location_alt_outlined, size: 30),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "My Address",
                    style: TextStyle(fontSize: 17),
                  )
                ],
              ),
              Row(
                children: const [
                  Icon(Icons.settings, size: 30),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Settings",
                    style: TextStyle(fontSize: 17),
                  )
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const Divider(
          thickness: 1,
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
             children: List.generate(accountList.length, (index) {
                 return Padding(
                     padding: const EdgeInsets.only(bottom: 15),
                     child: Column(
                       children: [
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children:[
                           Text(
                             accountList[index],
                             style: const TextStyle(fontSize: 16),
                           ),
                             Icon(
                               Icons.arrow_forward_ios,
                               color: Colors.black.withOpacity(0.5),
                               size: 17,
                             )

                           ]
                         ),
                         const SizedBox(
                           height: 15,
                         ),
                         Divider(
                           color: Colors.grey.withOpacity(0.8),
                         )
                       ]
                     )
                 );
             }
        )
      )
        )
      ]
    );
  }
}

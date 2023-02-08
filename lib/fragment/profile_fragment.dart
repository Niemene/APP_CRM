import 'package:flutter/material.dart';
import 'package:new_app_wfn/main.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              const CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                    'https://img.icons8.com/bubbles/100/null/user.png'),
                backgroundColor: Colors.black,
              ),
             Divider(height: 20, color: Colors.teal, thickness: 2, indent: 40, endIndent: 40, ),
              Text(
               utente.firstname +" " + utente.lastname,
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                utente.email,
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),

            ],
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
              border: Border.all(width: 3),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'DATI PERSONALI',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  
                    SizedBox(
                      height: 10,
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    ListTile(
                      leading: Icon(Icons.email),
                      title: Text(utente.email),
                    ),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.black,
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text(utente.mobilePhone),
                    ),
                      
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.black,
                    ),
                    ListTile(
                      leading: Icon(Icons.location_on),
                      title: Text(utente.address),
                    ),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.black,
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text(utente.codfis.toUpperCase()),
                    ),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.black,
                    ),
                    ListTile(
                      leading: Icon(Icons.lock_open_outlined),
                      title: Text(utente.state.toUpperCase()),
                    ),



                  ],
                ),
              ),
            ),
          ),
        ],
      );
  
  }
}

class ReusableRow extends StatelessWidget {
  final String value;
  final IconData iconData;

  const ReusableRow({Key? key, required this.value, required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ListTile(
          // title: Text(title,style: Theme.of(context).textTheme.subtitle2,),
          leading: Icon(iconData),
          trailing: Text(value, style: Theme.of(context).textTheme.subtitle2),
        ),
        Divider(
          color: Colors.white,
        )
      ],
    );
  }
}

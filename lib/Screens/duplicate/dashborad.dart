import 'package:Hunarmand_signIn_Ui/BusinessLogic/services.dart';
import 'package:Hunarmand_signIn_Ui/Models/service_model.dart';
import 'package:Hunarmand_signIn_Ui/Screens/home/slider.dart';
import 'package:Hunarmand_signIn_Ui/Screens/home/top_worker.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/worker_card.dart';
import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:flutter/material.dart';

class HomeDashboard extends StatefulWidget {
  HomeDashboard({Key key}) : super(key: key);
  //double _rating = 4.0;

  @override
  _HomeDashboardState createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        _top(),
        SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Our Services",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              // Text(
              //   "view All",
              //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
              // ),
            ],
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Container(
          height: 200.0,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: services.length,
            itemBuilder: (context, index) {
              final service = services[index];

              return _gridItem(
                service: service,
                ontap: () {
                  Navigator.of(context).pushNamed('/services');
                },
              );
            },
            // children: <Widget>[
            //   _gridItem(Icons.airport_shuttle),
            //   _gridItem(Icons.airport_shuttle),
            //   _gridItem(Icons.airport_shuttle),
            //   _gridItem(Icons.airport_shuttle),
            //   _gridItem(Icons.airport_shuttle),
            //   _gridItem(Icons.airport_shuttle),
            // ],
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Top Rated Worker",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => WorkerCard()));
                },
                child: Text(
                  "view All",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Colors.deepOrange),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        TopWorkers(),
      ],
    ));
  }

  _gridItem({@required Services service, var ontap}) {
    return InkWell(
      onTap: ontap,
      child: Column(
        children: [
          Container(
            // padding: EdgeInsets.all(.0),
            height: 50,
            width: 50,
            //color: deepOrangeColor,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: deepOrangelightColor,
                image: DecorationImage(
                    image: AssetImage(service.serviceImage),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(service.title,
              style: TextStyle(
                color: Colors.grey[900],
                fontWeight: FontWeight.w700,
                fontSize: 14.0,
                //fontWeight: FontWeight.bold,
              ))
        ],
      ),
    );
  }

  _top() {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: deepOrangeColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
      ),
      child: Column(
        children: [
          Cslider(),
          SizedBox(
            height: 30.0,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: "Search",
              fillColor: Colors.white,
              filled: true,
              suffixIcon: Icon(Icons.filter_list),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            ),
          )
        ],
      ),
    );
  }
}

//  Icon(
//                         Icons.location_on,
//                         color: Colors.orange,
//                         size: 16,
//                       ),
//                       SizedBox(
//                         width: 8,
//                       ),
//                       Text(
//                         "user location",
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontFamily: 'Avenir',
//                           fontSize: 20.0,
//                         ),
//                       ),

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   children: [
//     Row(
//       children: [
//         CircleAvatar(
//           backgroundImage: AssetImage('assets/user_img.jpg'),
//         ),
//         SizedBox(
//           width: 10.0,
//         ),
//         Text(
//           "username",
//           style: TextStyle(
//             color: Colors.white,
//           ),
//         )
//       ],
//     ),
//     IconButton(
//       icon: Icon(
//         Icons.notifications,
//         color: Colors.white,
//       ),
//       onPressed: () => {},
//     ),
//   ],
// ),

//Padding(
//   padding: EdgeInsets.all(16.0),
//   child: Row(
//     children: [

//       // Container(
//       //   width: 100.0,
//       //   height: 100.0,
//       //   decoration: BoxDecoration(
//       //     image: DecorationImage(
//       //       image: AssetImage('assets/user_img.jpg'),
//       //       fit: BoxFit.cover,
//       //     ),
//       //     borderRadius: BorderRadius.circular(20.0),
//       //   ),
//       // ),
//       SizedBox(width: 20.0),
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'user name',
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
//           ),
//           SizedBox(
//             height: 10.0,
//           ),
//           Text(
//             'type',
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
//           ),
//           SizedBox(
//             height: 10.0,
//           ),
//           Text(
//             'description',
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
//           ),
//         ],
//       )
//     ],
//   ),
// ),

//Expanded(
//   flex: 4,
//   child: Column(
//     mainAxisSize: MainAxisSize.min,
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: <Widget>[
//       Text(
//         "user name",
//         style: TextStyle(
//             color: Colors.red,
//             // fontFamily: 'Avenir',
//             fontSize: 18.0,
//             fontWeight: FontWeight.w700),
//       ),
//       Text(
//         "user type",
//         style: TextStyle(
//           color: Colors.red,
//           fontFamily: 'Avenir',
//           fontSize: 18.0,
//         ),
//       ),
//     ],
//   ),
// ),

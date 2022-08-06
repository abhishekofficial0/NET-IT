import 'dart:ui';
import 'package:flutter/material.dart';
//import 'package:email_validator/email_validator.dart';
import 'memberlist.dart';
import 'package:net_it/widgets/dropdown_role.dart';
import 'package:net_it/widgets/datepicker.dart';
import 'package:net_it/dummy_data.dart';

class Totalmembersscreen extends StatefulWidget {
  @override
  _TotalmembersscreenState createState() => _TotalmembersscreenState();
}

String _countactive = '';
String _countinactive = '';
String _counthold = '';
String _countout = '';

class _TotalmembersscreenState extends State<Totalmembersscreen> {
  final _formKey = GlobalKey<FormState>();
  final initialDate = DateTime.now();
  String _userName = '';
  String _email = '';
  String dob = '';
  var countactive = DUMMY_MEMBERDATA
      .where((c) => c.categories == "Active")
      .toList()
      .length
      .toString();

  var countinactive = DUMMY_MEMBERDATA
      .where((c) => c.categories == "Inactive")
      .toList()
      .length
      .toString();

  var counthold = DUMMY_MEMBERDATA
      .where((c) => c.categories == "Hold")
      .toList()
      .length
      .toString();

  var countout = DUMMY_MEMBERDATA
      .where((c) => c.categories == "Out")
      .toList()
      .length
      .toString();
  var currentSelectedValue;
  bool trigger = false;

  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context)
        .unfocus(); //to ensure keyboard always closes after next
    if (isValid && rolevalidate && dobvalidate) {
      _formKey.currentState!.save();
      trigger = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            body: DefaultTabController(
              // To control the tabs.
              length: 4, // to split tabbar into 4
              child: NestedScrollView(
                // for sliver app and tab bar
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      leading: IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      expandedHeight: 120.0,
                      floating: false,
                      pinned:
                          true, // to pin the neccessary on top even after scrolling.
                      backgroundColor: Color(0xff6169BB),
                      flexibleSpace: FlexibleSpaceBar(
                        // Flexible space contents - space will expand and contract.
                        centerTitle: true,
                        title: const Text(
                          "DESIGN TEAM MEMBERS",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        background: Image.asset(
                          "assets/images/topbar.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SliverPersistentHeader(
                      // Persistent header call. function present at end of widget.
                      delegate: _SliverAppBarDelegate(
                        TabBar(
                          automaticIndicatorColorAdjustment: true,
                          labelColor: const Color(0xff777777),
                          labelStyle:
                              const TextStyle(fontWeight: FontWeight.w600),
                          unselectedLabelColor: const Color(0xff777777),
                          unselectedLabelStyle:
                              const TextStyle(fontWeight: FontWeight.w300),
                          labelPadding: const EdgeInsets.all(0),
                          indicator: const UnderlineTabIndicator(
                              borderSide: BorderSide(
                                  width: 6.0, color: Color(0xff6169BB)),
                              insets: EdgeInsets.symmetric(horizontal: 0.0)),
                          tabs: [
                            // To define tabs and also to show the count of list elements. Border is given to tabs as well as indicator.(4TABS)
                            Tab(
                              child: Container(
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 2.0, color: Colors.grey),
                                    right: BorderSide(
                                        width: 1.0, color: Colors.grey),
                                  ),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(top: 8),
                                        child: Text(
                                          "Active",
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 76),
                                        child: Text(
                                          countactive,
                                          style: const TextStyle(
                                            fontSize: 11,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Tab(
                              child: Container(
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 2.0, color: Colors.grey),
                                    right: BorderSide(
                                        width: 1.0, color: Colors.grey),
                                  ),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(top: 8),
                                        child: Text(
                                          "Inactive",
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 76),
                                        child: Text(
                                          countinactive,
                                          style: const TextStyle(
                                            fontSize: 11,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Tab(
                              child: new Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 2.0, color: Colors.grey),
                                    right: BorderSide(
                                        width: 1.0, color: Colors.grey),
                                  ),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 8),
                                        child: Text(
                                          "Hold",
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 76),
                                        child: Text(
                                          counthold,
                                          style: TextStyle(
                                            fontSize: 11,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Tab(
                              child: new Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 2.0, color: Colors.grey),
                                  ),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 8),
                                        child: Text(
                                          "Out",
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 76),
                                        child: Text(
                                          countout,
                                          style: TextStyle(
                                            fontSize: 11,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Text(
                                  //   "Out $countout",
                                  //   style: TextStyle(fontSize: 18),
                                  // ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      pinned: true,
                    ),
                  ];
                },
                body: Center(
                  child: Container(
                    height: 520,
                    width: double.infinity,
                    color: Colors.white,
                    child: TabBarView(
                      children: [
                        CategoryActive(),
                        CategoryInactive(), // Tabbar functions. To show what is displayed in each tabbar.
                        CategoryHold(),
                        CategoryOut(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: MediaQuery.of(context).size.height * 0.09,
            child: Container(
               height: MediaQuery.of(context).size.height * 0.0625,
              decoration: BoxDecoration(
                color: Colors.white, //panel color
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15.0),
                  topLeft: Radius.circular(15.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.22,
            right: MediaQuery.of(context).size.width * 0.22,
            bottom: 8,
            child: Container(
             height: MediaQuery.of(context).size.height * 0.0625,
              width: MediaQuery.of(context).size.width * 0.4,
              margin: const EdgeInsets.all(5),
              child: ElevatedButton.icon(
                onPressed: () {
                  enterdetailsDiagFunc(context);
                },
                label: Text(
                  'ADD MEMBER',
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      fontSize: 20),
                ),
                icon: Icon(Icons.person_add_alt),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff6169BB),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                  // textStyle: TextStyle(
                  //   color: Colors.black,
                  //   fontSize: 22,
                  // ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  enterdetailsDiagFunc(context) {
    // Dialogue function to add the details when add member is clicked.
    return showDialog(
        useRootNavigator: false,
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(1),
                child: Material(
                  type: MaterialType.transparency,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    height: MediaQuery.of(context).size.height * 0.95,
                    width: MediaQuery.of(context).size.width * 0.86,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Form(
                      key: _formKey,
                     // child: Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "ADD MEMBER",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Axiforma'),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              // Name form field
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Name:",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w300,
                                        fontFamily: 'Axiforma'),
                                  ),
                                ],
                              ),
                            ),
                            Material(
                              color: Colors.white,
                              child: Container(
                               // height:
                                 //   MediaQuery.of(context).size.height * 0.0625,
                                width: MediaQuery.of(context).size.width * 0.75,
                                child: TextFormField(
                                  
                                  validator: (value) {
                                    if (value!.isEmpty || value.length < 3) {
                                      return 'Please enter valid name';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    
                                    // labelText: 'Name',
                                    hintText: "e.g. John Krasenski",
                                    hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12,
                                        fontFamily: 'Axiforma'),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  onSaved: (value) {
                                    _userName = value.toString();
                                    print(_userName);
                                  },
                                ),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              // Email form field
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Email:",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w300,
                                        fontFamily: 'Axiforma'),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                             // height:
                                //  MediaQuery.of(context).size.height * 0.0625,
                              width: MediaQuery.of(context).size.width * 0.75,
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      value.length < 3 ||
                                      !value.contains("@") ||
                                      !value.contains(".com")) {
                                    return 'Please enter valid Email ID';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  hintText: "e.g. JohnKrasenski@example.com",
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12,
                                      fontFamily: 'Axiforma'),
                                  // labelText: 'Email',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                onSaved: (value) {
                                  _email = value.toString();
                                  print(_email);
                                },
                              ),
                            ),
                            Spacer(),
                            Padding(
                              // Date of birth button
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Date of Birth:",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w300,
                                        fontFamily: 'Axiforma'),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.0625,
                              width: MediaQuery.of(context).size.width * 0.75,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Datepicker(), // DATE PICKER widget
                            ),
                            Padding(
                              // Date of birth button
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Date of Joining",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w300,
                                        fontFamily: 'Axiforma'),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.0625,
                              width: MediaQuery.of(context).size.width * 0.75,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Datepicker(), // DATE PICKER widget
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Role:",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w300,
                                        fontFamily: 'Axiforma'),
                                  ),
                                ],
                              ),
                            ),

                            DropdownRole(),
                            //ROLE widget call
                            //Spacer(),
                            Padding(
                              // Buttons to cancel or submit
                              padding: const EdgeInsets.only(
                                top: 10,
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 117,
                                      height: 43,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                12), // <-- Radius
                                          ),
                                        ),
                                        child: Text(
                                          // cancel button
                                          "Cancel",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13,
                                              fontFamily: 'Axiforma',
                                              fontWeight: FontWeight.w400),
                                        ),
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 117,
                                      height: 43,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Color(0xff6169BB),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      12), // <-- Radius
                                            ),
                                          ),
                                          child: Text(
                                            // submit button
                                            "Add Member",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontFamily: 'Axiforma',
                                                fontWeight: FontWeight.w400),
                                          ),
                                          onPressed: () {
                                            _trySubmit(); // validation of fields check .Function above.
                                            if (trigger == true) {
                                              Navigator.of(context)
                                                  .pop(); // Pop after successfull submit.
                                              trigger = false;
                                            }
                                            return null;
                                          }),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
           // ),
          );
        });
  }
}

// persistent header sliver app bar. Also, to ensure that the text in appbar
//starts from flexible space and gets pinned to top after scroll up.
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      width: MediaQuery.of(context).size.width,
      child: _tabBar,
      color: Colors.white, // to ensure tabbar is white and not transparent
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

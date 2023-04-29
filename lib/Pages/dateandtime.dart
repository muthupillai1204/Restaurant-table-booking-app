// ignore_for_file: iterable_contains_unrelated_type
import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';
import '../utils/routes.dart';

class DtSelect extends StatefulWidget {
  const DtSelect({Key? key}) : super(key: key);

  @override
  State<DtSelect> createState() => _DtSelectState();
}

class _DtSelectState extends State<DtSelect> {
  // var isBooked
  var countSeatLeft = 3 * 10;
  var countSeatCenter = 4 * 10;
  var countSeatRight = 3 * 10;
  var listSeatLeft = [];
  var listSeatCenter = [];
  var listSeatRight = [];

  @override
  void initState() {
    //l for left, c for center , r for right
    //first param "listSeatLeft","listSeatCenter","listSeatRight" that similar like object temp that u want to save the data
    // second param is for like how many seat on every side
    // third param is for naming value every seat //look line 38
    initSeatValueToList(listSeatLeft, countSeatLeft, "l");
    initSeatValueToList(listSeatCenter, countSeatCenter, "c");
    initSeatValueToList(listSeatRight, countSeatRight, "r");
    setVisiblitySeat();
    super.initState();
  }

  initSeatValueToList(List data, count, side) {
    Map<String, dynamic> objectData;
    //init variable to save your object data
    for (int i = 0; i < count; i++) {
      objectData = {
        "id": side + "${i + 1}",
        "isBooked": false,
        "isAvailable": true,
        "isSelected": false,
        "isVisible": true,
      };
      //this format object for every seat has
      setState(() {
        data.add(objectData);
        //add object to list
      });
    }
    // print(data);
  }

  setVisiblitySeat() {
    setState(() {
      listSeatLeft[0]["isVisible"] = false; // left column index 0
      listSeatLeft[1]["isVisible"] = false; // left column index 1
      listSeatLeft[2]["isVisible"] = false; // left column index 0
      // listSeatLeft[3]["isVisible"] = false;
      listSeatRight[0]["isVisible"] = false;
      listSeatRight[1]["isVisible"] = false; // right column index 1
      listSeatRight[3]["isVisible"] = false; // right column index 2
      // listSeatRight[3]["isVisible"] = false; // right column index 5
      listSeatCenter[39]["isVisible"] = false;
    });
    //this function to set where's the position of the seat that should be invisible
  }

  setSelectedToBooked() {
    for (var seat in listSeatLeft) {
      if (seat["isSelected"]) {
        setState(() {
          seat["isBooked"] = true;
        });
      }
    }
    for (var seat in listSeatCenter) {
      if (seat["isSelected"]) {
        setState(() {
          seat["isBooked"] = true;
        });
      }
    }
    for (var seat in listSeatRight) {
      if (seat["isSelected"]) {
        setState(() {
          seat["isBooked"] = true;
        });
      }
    }
    //this function to loop every side of seat, from selected to booked, u also can this function to send to u'r serves side
  }

  DateTime _dateTime = DateTime.now();

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2023),
            lastDate: DateTime(2025))
        .then(
      (value) {
        setState(() {
          _dateTime = value!;
        });
      },
    );
  }

  String routeName = "";

  bool changeBtn1 = false;
  bool changeBtn2 = false;
  bool changeBtn3 = false;
  bool changeBtn4 = false;
  bool changeBtn5 = false;
  bool changeBtn6 = false;
  // buttonone(BuildContext context) async {
  //   setState(() {
  //     //if u want to change state we should create setState
  //     changeBtnColor = true;
  //   });
  //   await Future.delayed(const Duration(seconds: 2));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        title: const Text("Choose Date & Time"),
        backgroundColor: const Color.fromARGB(255, 173, 119, 209),
        automaticallyImplyLeading: false,
        shadowColor: const Color.fromARGB(255, 238, 223, 7),
        leading: IconButton(
          onPressed: () {
            setState(() {
              // Navigator.pop(context, MyRoutes.cartRoute);
              Navigator.pop(context, MyRoutes.cartRoute);
            });
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                height: 10.0,
              ),
              Text(
                "Current Date:\n " + _dateTime.toString(),
                style: const TextStyle(
                    fontSize: 20, color: Colors.deepPurpleAccent),
              ),
              const SizedBox(
                height: 35.0,
              ),
              ElevatedButton(
                onPressed: _showDatePicker,
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Choose Date",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              const Divider(
                height: 10,
                color: Color.fromARGB(255, 144, 121, 199),
                thickness: 20,
              ),
              const SizedBox(
                height: 25.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    "Please select Time slots: ",
                    style: TextStyle(
                        color: Color.fromARGB(255, 121, 19, 255),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(
                    height: 25.0,
                  ),
                  const SizedBox(
                    height: 10,
                    // color: Color.fromARGB(255, 144, 121, 199),
                    // thickness: 20,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.orange,
                      backgroundColor: changeBtn1
                          ? Colors.orange
                          : const Color.fromARGB(246, 160, 84, 223),
                      //  const Color.fromARGB(246, 160, 84, 223),
                      minimumSize: const Size(100, 50),
                      padding: const EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(29.0)),
                    ),
                    onPressed: () {
                      setState(() {
                        // Colors.orange;
                        changeBtn1 = true;
                      });
                    },
                    child: const Text(
                      "9-10am",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.orange,
                      backgroundColor: changeBtn2
                          ? Colors.orange
                          : const Color.fromARGB(246, 160, 84, 223),
                      minimumSize: const Size(100, 50),
                      padding: const EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(29.0)),
                    ),
                    onPressed: () {
                      // Navigator.pushNamed(context, MyRoutes.payRoute);
                      setState(() {
                        changeBtn2 = true;
                      });
                    },
                    child: const Text(
                      "10-11am",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.orange,
                      backgroundColor: changeBtn3
                          ? Colors.orange
                          : const Color.fromARGB(246, 160, 84, 223),
                      minimumSize: const Size(100, 50),
                      padding: const EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(29.0)),
                    ),
                    onPressed: () {
                      // Navigator.pushNamed(context, MyRoutes.payRoute);
                      setState(() {
                        changeBtn3 = true;
                      });
                    },
                    child: const Text(
                      "11-12am",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.orange,
                      backgroundColor: changeBtn4
                          ? Colors.orange
                          : const Color.fromARGB(246, 160, 84, 223),
                      minimumSize: const Size(100, 50),
                      padding: const EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(29.0)),
                    ),
                    onPressed: () {
                      // Navigator.pushNamed(context, MyRoutes.payRoute);
                      setState(() {
                        changeBtn4 = true;
                      });
                    },
                    child: const Text(
                      "12-1pm",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.orange,
                      backgroundColor: changeBtn5
                          ? Colors.orange
                          : const Color.fromARGB(246, 160, 84, 223),
                      minimumSize: const Size(100, 50),
                      padding: const EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(29.0)),
                    ),
                    onPressed: () {
                      // Navigator.pushNamed(context, MyRoutes.payRoute);
                      setState(() {
                        changeBtn5 = true;
                      });
                    },
                    child: const Text(
                      "1-2pm",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.orange,
                      backgroundColor: changeBtn6
                          ? Colors.orange
                          : const Color.fromARGB(246, 160, 84, 223),
                      minimumSize: const Size(100, 50),
                      padding: const EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(29.0)),
                    ),
                    onPressed: () {
                      // Navigator.pushNamed(context, MyRoutes.payRoute);
                      setState(() {
                        changeBtn6 = true;
                      });
                    },
                    child: const Text(
                      "2-3pm",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  const SizedBox(
                    height: 10,
                    // color: Color.fromARGB(255, 144, 121, 199),
                    // thickness: 20,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
              const SizedBox(
                height: 25.0,
              ),
              const Divider(
                height: 10,
                color: Color.fromARGB(255, 144, 121, 199),
                thickness: 20,
              ),
              const SizedBox(
                height: 25.0,
              ),
              const Text(
                "Please choose your seats...!",
                style: TextStyle(
                    color: Color.fromARGB(255, 111, 0, 255),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.brown,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: const Text(
                              "Booked",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.orange,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: const Text("Selected"),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            // color: Colors.grey,
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                width: 1,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: const Text("available"),
                          ),
                        ],
                      ),
                    ),

                    // Text("Kitchen")
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Kitchen",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                // height: 100,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widgetSeat(listSeatRight, false),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: widgetSeat(listSeatCenter, true),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    widgetSeat(listSeatLeft, false),
                  ],
                ),
              ),
              const Text(
                "Entry/Exit",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    setSelectedToBooked();
                  });
                },
                child: const Text(
                  "Booking",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SlideAction(
                  borderRadius: 12.0,
                  elevation: 0,
                  innerColor: Colors.deepPurple,
                  outerColor: Colors.deepPurple[200],
                  sliderButtonIcon: const Icon(
                    Icons.payment,
                    color: Colors.white,
                  ),
                  text: "Slide to Pay!",
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                  onSubmit: () {
                    Navigator.pushNamed(context, MyRoutes.payRoute);
                  },
                  sliderRotate: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget widgetSeat(List dataSeat, bool isCenter) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3.93,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isCenter ? 3 : 2,
          childAspectRatio: isCenter ? 1 : 1,
        ),
        itemCount: dataSeat.length,
        itemBuilder: (BuildContext context, int index) {
          return Visibility(
            visible: dataSeat[index]["isVisible"],
            child: GestureDetector(
              onTap: () {
                setState(() {
                  dataSeat[index]["isSelected"] =
                      !dataSeat[index]["isSelected"];
                  dataSeat[index]["isSelected"] = dataSeat[index]["isSelected"];
                });
              },
              child: Container(
                margin: const EdgeInsets.all(5),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: dataSeat[index]["isBooked"]
                      ? Colors.brown
                      : dataSeat[index]["isSelected"]
                          ? Colors.orange
                          : Colors.grey,
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';

class ToDoApp extends StatefulWidget {
  const ToDoApp({Key? key}) : super(key: key);

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  final List<Task> tasks = [];

  void addTask(Color color, String title) {
    Task task = new Task(color: color, name: title);
    tasks.add(task);
  }

  Color? selectedColor;

  final _formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Qaydnoma',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xffF2C94C),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[300],
                      ),
                      height: 60,
                      width: 500,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 23,
                              width: 13,
                              decoration: BoxDecoration(
                                  color: tasks[index].color!,
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Expanded(
                            flex: 9,
                            child: Text(
                              tasks[index].name!,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: Color(0xff6FB88E),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  )),
                              child: Icon(
                                Icons.done,
                                color: Colors.white,
                                size: 55,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedColor = Colors.green;
                                  });
                                },
                                child: CircleColors(
                                  color: Colors.green,
                                ),
                              ),
                              SizedBox(
                                width: 24,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedColor = Colors.red;
                                    });
                                  },
                                  child: CircleColors(
                                    color: Colors.red,
                                  )),
                              SizedBox(
                                width: 24,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedColor = Colors.yellow;
                                  });
                                },
                                child: CircleColors(
                                  color: Colors.yellow,
                                ),
                              ),
                              SizedBox(
                                width: 24,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedColor = Colors.blue;
                                  });
                                },
                                child: CircleColors(
                                  color: Colors.blue,
                                ),
                              ),
                              SizedBox(
                                width: 24,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedColor = Colors.amber;
                                  });
                                },
                                child: CircleColors(
                                  color: Colors.amber,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SafeArea(
                        child: Container(
                          height: 60,
                          width: 500,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 8,
                                child: TextFormField(
                                  controller: name,
                                  onSaved: (name) {},
                                  // validator: (value) {
                                  //   if (value == null || value.isEmpty) {
                                  //     return 'Please enter some text';
                                  //   }
                                  //   return null;
                                  // },
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding:
                                          EdgeInsets.only(left: 10)),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  height: 60,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20))),
                                  child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          final snackBar = SnackBar(
                                            width: 150,
                                            content:
                                                const Text('Rangni tanlang!'),
                                            behavior: SnackBarBehavior.floating,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(24),
                                            ),
                                            backgroundColor: Colors.red,
                                          );

                                          // Find the ScaffoldMessenger in the widget tree
                                          // and use it to show a SnackBar.
                                          selectedColor == null
                                              ? ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar)
                                              : addTask(
                                                  selectedColor!,
                                                  name.text,
                                                );
                                        });
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CircleColors extends StatelessWidget {
  CircleColors({
    required this.color,
  });
  Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 46,
      height: 46,
      decoration: BoxDecoration(
        color: color, shape: BoxShape.circle,
        
      ),
    );
  }
}

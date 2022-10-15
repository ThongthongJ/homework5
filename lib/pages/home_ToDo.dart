import 'package:flutter/material.dart';
import 'package:homework5/model/check_list.dart';

List<toDo_list> todo_list = [
  toDo_list(text: "ทำการบ้าน", check: false),
  toDo_list(text: "อ่านหนังสือ", check: false)
];

class home_toDo extends StatefulWidget {
  const home_toDo({Key? key}) : super(key: key);

  @override
  State<home_toDo> createState() => _home_toDoState();
}

class _home_toDoState extends State<home_toDo> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xC3D9D6D6),
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.check_box),
            SizedBox(width: 10),
            Text("My ToDo"),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView.builder(
          itemBuilder: (BuildContext context, int i) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Checkbox(
                        value: todo_list[i].check,
                        onChanged: (value) {
                          setState(() {
                            todo_list[i].check = value;
                          });
                        }),
                    Expanded(
                      child: !todo_list[i].check!
                          ? Text(todo_list[i].text)
                          : Text(
                              todo_list[i].text,
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough),
                            ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          todo_list.removeAt(i);
                        });
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: todo_list.length,
        ),
      ),
      bottomSheet: SizedBox(
        height: 60,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Flexible(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: "Enter new ToDo",
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    if (_controller.text.isEmpty) return;
                    todo_list
                        .add(toDo_list(text: _controller.text, check: false));
                    _controller.text = "";
                  });
                },
                child: Text(
                  "ADD",
                  style: TextStyle(color: Colors.blue),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

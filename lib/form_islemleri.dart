import 'package:flutter/material.dart';

class FormIslemleri extends StatefulWidget {
  //const FormIslemleri({ Key? key }) : super(key: key);

  @override
  _FormIslemleriState createState() => _FormIslemleriState();
}

class _FormIslemleriState extends State<FormIslemleri> {
  String girilenMetin = "";
  FocusNode _fNode;
  int maxLine = 1;
  TextEditingController textController1;

  @override
  void initState() {
    super.initState();
    _fNode = FocusNode();
    textController1 = TextEditingController(text: "");
    _fNode.addListener(() {
      setState(() {
        if (_fNode.hasFocus) {
          maxLine = 3;
        } else {
          maxLine = 1;
        }
      });
    });
  }

  @override
  void dispose() {
    _fNode.dispose();
    textController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("İnput İşlemleri"),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 24,
              height: 24,
              child: FloatingActionButton(
                backgroundColor: Colors.purple,
                child: Icon(
                  Icons.edit,
                  size: 17,
                ),
                onPressed: () {
                  textController1.text = "Butona basıldı";
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              child: Icon(Icons.edit),
              mini: true,
              backgroundColor: Colors.green,
              onPressed: () {
               debugPrint(textController1.text.toString()) ;
              },
            ),
            SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              child: Icon(Icons.edit),
              onPressed: () {
                FocusScope.of(context).requestFocus(_fNode);
              },
            ),
          ],
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                focusNode: _fNode,
                controller: textController1,
                maxLines: maxLine,
                // maxLength: 20,
                decoration: InputDecoration(
                  hintText: "Buraya yazın",
                  labelText: "Başlık",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  icon: Icon(Icons.edit),
                ),
                onChanged: (String s) {
                  girilenMetin = s;
                },
                onSubmitted: (String s) {
                  girilenMetin = s;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                //focusNode: _fNode,
                //controller: textController1,
                maxLines: maxLine,
                // maxLength: 20,
                decoration: InputDecoration(
                  hintText: "Buraya yazın",
                  labelText: "Başlık",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  icon: Icon(Icons.edit),
                ),
                onChanged: (String s) {
                  girilenMetin = s;
                },
                onSubmitted: (String s) {
                  girilenMetin = s;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(30),
              color: Colors.teal.shade400,
              width: double.infinity,
              height: 200,
              child:
                  Align(alignment: Alignment.center, child: Text(girilenMetin)),
            )
          ],
        ));
  }
}

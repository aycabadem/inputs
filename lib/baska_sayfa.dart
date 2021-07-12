import 'package:flutter/material.dart';
import 'package:inputs/form_islemleri.dart';

class TextForm extends StatefulWidget {
  //const TextForm({ Key? key }) : super(key: key);

  @override
  _TextFormState createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  String _ad, _email, _sifre;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(
          //  primaryColor: Colors.black,
          //accentColor: Colors.grey,

          ),
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.grey,
            onPressed: () {},
            child: Icon(Icons.save),
          ),
          appBar: AppBar(
            title: Text("Form ve TextFormField"),
          ),
          body: Padding(
            padding: EdgeInsets.all(20),
            child: Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.always,
                child: ListView(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.account_circle),
                        hintText: "Adınız ve Soyadınız",
                        labelText: "Ad Soyad",
                        border: OutlineInputBorder(),
                      ),
                      validator: (girilenVeri) {
                        if (girilenVeri.length < 6) {
                          return "Lütfen isminizi tam girin";
                        } else
                          return null;
                      },
                      onSaved: (deger) => _ad = deger,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        hintText: "E-mail Adresiniz",
                        labelText: "e-mail",
                        border: OutlineInputBorder(),
                      ),
                      validator: _emailKontrol,
                      onSaved: (deger) => _email = deger,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        hintText: "Şifreniz",
                        labelText: "şifre",
                        border: OutlineInputBorder(),
                      ),
                      validator: (girilenVeri) {
                        if (girilenVeri.length < 6) {
                          return "Şifre en az 6 karakter olmalı";
                        } else
                          return null;
                      },
                      onSaved: (deger) => _sifre = deger,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        _girisBilgileriniOnayla();
                      },
                      icon: Icon(Icons.save),
                      label: Text("KAYDET"),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0x8063ffda))),
                    ),
                  ],
                )),
          )),
    );
  }

  void _girisBilgileriniOnayla() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      debugPrint("Girilen isim $_ad , e-mail : $_email, şifre : $_sifre");
    }
    if (_email == "aycabadem12@gmail.com" &&
        _ad == "Ayça Badem" &&
        _sifre == "cemcemcem") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => FormIslemleri()));
    } else {
      
        // set up the button
        Widget okButton = TextButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.pop(context);
          },
        );

        // set up the AlertDialog
        AlertDialog alert = AlertDialog(
          title: Text("Hata"),
          content: Text("Bilgilerinizi Kontrol Edin"),
          actions: [
            okButton,
          ],
        );

        // show the dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          },
        );
      
    }
  }

  String _emailKontrol(String mail) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(mail))
      return "Geçersiz mail";
    else
      return null;
  }
}

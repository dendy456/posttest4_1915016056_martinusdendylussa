import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  Widget myLogo() {
    return Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/kail1.png"))));
  }

  Widget myContainer() {
    return Container(
      width: 30, //MediaQuery.of(context).size.width,
      height: 30,
      color: Colors.amber,
      margin: EdgeInsets.all(10),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Color.fromRGBO(0, 103, 120, 50),
        child: ListView(
          children: [
            Column(
              children: [
                myLogo(),
                Container(
                  margin: EdgeInsets.only(bottom: 60),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      // color: Color.fromARGB(87, 120, 192, 251),
                      ),
                  child: Column(
                    children: [
                      Image.asset("assets/font2.png"),
                      Text(
                        'Martinus Dendy Lussa',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Welcome To Kail Store',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 10, bottom: 25),
                  child: Text(
                    'Segala Kebutuhan Mancing Anda Terpenuhi Semuanya Di sini, Bagaikan Surga Bagi Para Angler... ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                      fontSize: 15,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      myContainer(),
                      myContainer(),
                      myContainer(),
                      myContainer(),
                      myContainer(),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => HalData(),
                        ));
                  },
                  child: const Text("Pesan Sekarang"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Hal2 extends StatelessWidget {
  const Hal2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class HalData extends StatefulWidget {
  const HalData({Key? key}) : super(key: key);

  @override
  State<HalData> createState() => _HalDataState();
}

enum Gender { Cowo, Cewe, Unknown }

class _HalDataState extends State<HalData> {
  bool setuju = false;
  String pembeli = "", alamat = "", noHp = "";
  final pembeliCtrl = TextEditingController();
  final alamatCtrl = TextEditingController();
  final noHpCtrl = TextEditingController();
  Gender gender = Gender.Unknown;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    pembeliCtrl.dispose();
    alamatCtrl.dispose();
    noHpCtrl.dispose();
    super.dispose();
  }

  String getGender(Gender? value) {
    if (value == Gender.Cowo) {
      return "Laki-Laki";
    } else if (value == Gender.Cewe) {
      return "Perempuan";
    }
    return "Tidak Bergender";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("KAIL STORE"),
      ),
      drawer: Drawer(
        backgroundColor: Colors.blueAccent,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Image.asset("assets/font2.png"),
              decoration: BoxDecoration(
                color: Colors.black45,
              ),
            ),
            ListTile(
              title: Text("Beranda"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Contact"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("About"),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Color.fromRGBO(0, 103, 120, 50),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 300,
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/font2.png'))),
                ),
                Text(
                    'Silahkan untuk mengisi data sebelum melakukan pembelian '),
                Text('di toko ini...'),
                const SizedBox(height: 20),
                TextField(
                  controller: pembeliCtrl,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nama Pembeli",
                    hintText: 'Isi Nama Anda',
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: alamatCtrl,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Alamat",
                    hintText: 'Isi Alamat Anda',
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: noHpCtrl,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nomor Hp",
                    hintText: 'Cth. 0813xxxxxxxx',
                  ),
                ),
                const SizedBox(height: 30),
                ListTile(
                  title: const Text("Laki-Laki"),
                  leading: Radio(
                    groupValue: gender,
                    value: Gender.Cowo,
                    onChanged: (Gender? value) {
                      setState(() {
                        gender = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text("Perempuan"),
                  leading: Radio(
                    groupValue: gender,
                    value: Gender.Cewe,
                    onChanged: (Gender? value) {
                      setState(() {
                        gender = value!;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),
                ListTile(
                  title: const Text(
                      "Saya menyetujui syarat, ketentuan, dan privasi Toko"),
                  leading: Checkbox(
                    value: setuju,
                    onChanged: (bool? value) {
                      setState(() {
                        setuju = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  pembeli = pembeliCtrl.text;
                  alamat = alamatCtrl.text;
                  noHp = noHpCtrl.text;
                });
              },
              child: const Text("Konfirmasi"),
            ),
          ],
        ),
      ),
    );
  }
}

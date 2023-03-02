import 'package:flutter/material.dart';
import 'package:flutter_provider/screen/modal/modaldata.dart';
import 'package:flutter_provider/screen/provider/home_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtId = TextEditingController();
  TextEditingController txtStd = TextEditingController();

  TextEditingController rtxtName = TextEditingController();
  TextEditingController rtxtId = TextEditingController();
  TextEditingController rtxtStd = TextEditingController();

  HomeProvider? homeProvider;

  @override
  Widget build(BuildContext context) {
    homeProvider = Provider.of<HomeProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("My Info", style: GoogleFonts.robotoSlab()),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                  controller: txtId,
                  decoration: InputDecoration(
                      labelText: "Enter Student Id",
                      labelStyle: GoogleFonts.lato())),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: txtName,
                decoration: InputDecoration(
                    labelText: "Enter Student Name",
                    labelStyle: GoogleFonts.lato()),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: txtStd,
                decoration: InputDecoration(
                    labelText: "Enter Student Std",
                    labelStyle: GoogleFonts.lato()),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Stddata s1 = Stddata(
                      id: txtId.text, name: txtName.text, std: txtStd.text);
                  homeProvider!.AddData(s1);
                },style: ElevatedButton.styleFrom(primary: Colors.black),
                child: Text("Add", style: GoogleFonts.arapey()),
              ),
              Consumer<HomeProvider>(
                builder: (context, value, child) => Expanded(
                  child: ListView.builder(
                    itemCount: homeProvider!.l1.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text("${homeProvider!.l1[index].id}"),
                        title: Text("${homeProvider!.l1[index].name}"),
                        subtitle: Text("${homeProvider!.l1[index].std}"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {
                                  homeProvider!.DeletData(index);
                                }, icon: Icon(Icons.delete,color: Colors.red,)),
                            IconButton(
                                onPressed: () {
                                  rtxtId = TextEditingController(
                                      text: homeProvider!.l1[index].id);
                                  rtxtName = TextEditingController(
                                      text: homeProvider!.l1[index].name);
                                  rtxtStd = TextEditingController(
                                      text: homeProvider!.l1[index].std);

                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextField(controller: rtxtId),
                                          SizedBox(height: 10),
                                          TextField(controller: rtxtName),
                                          SizedBox(height: 10),
                                          TextField(controller: rtxtStd),
                                          SizedBox(height: 10),
                                          ElevatedButton(
                                              onPressed: () {
                                                Stddata s1 = Stddata(
                                                  id: rtxtId.text,
                                                  name: rtxtName.text,
                                                  std: rtxtStd.text,
                                                );
                                                homeProvider!
                                                    .UpdateData(index, s1);

                                                Navigator.pop(context);
                                              },
                                              child: Text("Update"))
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                icon: Icon(Icons.edit,color: Colors.black,))
                          ],
                        ),
                      );
                    },
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

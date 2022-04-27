import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../Constants.dart';
import '../Services/Api.dart';
import 'mobile.dart';

class pdf extends StatefulWidget {
  const pdf({Key? key}) : super(key: key);

  @override
  _pdfState createState() => _pdfState();
}

class _pdfState extends State<pdf> {
  int index = 0;
  var api=new Api();
  List<String> name=[];
  List<String> service=[];
  List<String> service_type=[];
  List<String> u_remark=[];
  List<String> v_remark=[];
  List<String> location=[];
  List<String> slot=[];
  List<String> date=[];
  List<String> payment_method=[];
  List<String> price=[];
  List<String> status=[];
  List<String> plus_member=[];
  List<String> vendor_id=[];
  List<String> mobile_no=[];
  List<String> quantity=[];
  List<String> Job_Id=[];
//  get booking details
  getbookingDetails()async{
    var requestBody={
      "user_id":Constants.Id
    };
    dynamic res=await api.ApiCallingWithRequestBody("/common/booking_data.php", requestBody);
    if(res["message"]=="exist"){
      for(int i=0;i<res["data"].length;i++){
        setState(() {
          name.add(res["data"][i]["name"]);
          service.add(res["data"][i]["service"]);
          service_type.add(res["data"][i]["service_type"]);
          u_remark.add(res["data"][i]["u_remark"]);
          v_remark.add(res["data"][i]["v_remark"]);
          location.add(res["data"][i]["location"]);
          slot.add(res["data"][i]["slot"]);
          date.add(res["data"][i]["date"]);
          payment_method.add(res["data"][i]["payment_method"]);
          price.add(res["data"][i]["price"]);
          status.add(res["data"][i]["status"]);
          plus_member.add(res["data"][i]["plus_member"]);
          vendor_id.add(res["data"][i]["vendor_id"]);
          mobile_no.add(res["data"][i]["mobile_no"]);
          quantity.add(res["data"][i]["quantity"]);
          Job_Id.add(res["data"][i]["Id"]);
        });
        print(name[i]);

      }
    }else{
      Fluttertoast.showToast(msg: "No Bookings");
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    getbookingDetails();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("All Bookings")),
        actions: [Icon(Icons.add_alert)],
      ),
      body: Container(


        child: ListView.builder(itemCount:name.length,itemBuilder: (BuildContext context, index) {
          return ListTile(
            leading: Icon(Icons.list),
            title:Column(mainAxisAlignment: MainAxisAlignment.start,
                children:<Widget>[Text(name[index]),
                  Text(slot[index])]),
            subtitle: Column(
              children: <Widget>[
                Container( margin: EdgeInsets.all(5) ,alignment: Alignment.bottomCenter,height: 2, color: Colors.grey, child: Row()),
                Container(margin: EdgeInsets.all(1) ,
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                            children:<Widget>[Text("Service Type", style: TextStyle(fontWeight: FontWeight.w900,fontSize: 14),),
                              Text(service[index])]
                        ),
                        ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.black),
                          child: Text("Download"),
                          onPressed: _createPDF,
                        ),
                      ],
                    )),SizedBox(height: 5,
                  child: Container(
                    color: Colors.white,
                  ),
                ),
              ],
            ),

          );
        },

        ),
      ),
    );
  }

  Future<void> _createPDF() async {
    PdfDocument document = PdfDocument();
   // final page = document.pages.add();

    // page.graphics.drawString('Welcome to PDF Succinctly!',
    //     PdfStandardFont(PdfFontFamily.helvetica, 30));

    // page.graphics.drawImage(
    //     PdfBitmap(await _readImageData('Pdf_Succinctly.jpg')),
    //     Rect.fromLTWH(0, 100, 440, 550));

    PdfGrid grid = PdfGrid();
    grid.style = PdfGridStyle(
        font: PdfStandardFont(PdfFontFamily.helvetica, 30),
        cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2));

    grid.columns.add(count: 2);
    grid.headers.add(1);

    PdfGridRow header = grid.headers[0];
    header.cells[0].value = 'Name';
    header.cells[1].value = name[index];

    PdfGridRow row = grid.rows.add();
    row.cells[0].value = 'Service';
    row.cells[1].value = service[index];


    row = grid.rows.add();
    row.cells[0].value = 'Total Amount';
    row.cells[1].value = price[index];


    row = grid.rows.add();
    row.cells[0].value = 'Booking Date';
    row.cells[1].value = date[index];

    row = grid.rows.add();
    row.cells[0].value = 'Slot';
    row.cells[1].value = slot[index];

    row = grid.rows.add();
    row.cells[0].value = 'Payment Type';
    row.cells[1].value = payment_method[index];





    grid.draw(
        page: document.pages.add(), bounds: const Rect.fromLTWH(0, 0, 0, 0));

    List<int> bytes = document.save();
    document.dispose();

    saveAndLaunchFile(bytes, 'Output.pdf');
  }
}

Future<Uint8List> _readImageData(String name) async {
  final data = await rootBundle.load('images/$name');
  return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
}

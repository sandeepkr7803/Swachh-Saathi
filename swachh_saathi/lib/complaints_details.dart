import 'package:flutter/material.dart';

class ComplaintsDetails extends StatefulWidget {
  const ComplaintsDetails({super.key});

  @override
  State<ComplaintsDetails> createState() => _ComplaintsDetailsState();
}

class _ComplaintsDetailsState extends State<ComplaintsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 270,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                image: DecorationImage(
                  image: AssetImage('assets/images/illustration1.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, left: 15),
                    child: IconButton(
                      style: const ButtonStyle(
                        backgroundColor:
                        MaterialStatePropertyAll(Colors.white54),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            ListTile(
              leading: const Icon(Icons.location_on_outlined),
              title: Text(
                '5, Marine Beach, Goa',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.calendar_month_outlined),
              title: Text(
                '09-05-2024',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
            ListTile(
              leading:  const Icon(Icons.note_alt_outlined),
              title: Text(
                'In-process',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Description",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Description',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: ,
      // bottomNavigationBar: Container(
      //   // color: Colors.grey[200],
      //   decoration: const BoxDecoration(
      //     border: Border(
      //         top: BorderSide(
      //             color: Colors.grey, width: 1, style: BorderStyle.solid)),
      //   ),
      //   height: 70,
      //   width: double.maxFinite,
      //   padding: const EdgeInsets.only(
      //     left: 20,
      //     right: 20,
      //   ),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.end,
      //     children: [
      //       isProcessing?ElevatedButton(
      //         onPressed: () {
      //           setState(() {
      //             isProcessing = false;
      //             process = 'Completed';
      //           });
      //
      //         },
      //         // isExtended: true,
      //         style: ElevatedButton.styleFrom(
      //             backgroundColor: Colors.red,
      //             shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(8),
      //             )),
      //         child: const Text(
      //           'End Process',
      //           style: TextStyle(
      //             fontSize: 20,
      //             color: Colors.white,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //       ) : ElevatedButton(
      //         onPressed: () {
      //           setState(() {
      //             isProcessing = true;
      //             process = 'Pending';
      //           });
      //         },
      //         // isExtended: true,
      //         style: ElevatedButton.styleFrom(
      //             backgroundColor: themeColor,
      //             shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(8),
      //             )),
      //         child: const Text(
      //           'Start Process',
      //           style: TextStyle(
      //             fontSize: 20,
      //             color: Colors.white,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}


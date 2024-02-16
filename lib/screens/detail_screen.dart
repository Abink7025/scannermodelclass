import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scannermodelclass/provider/api_changenotifier.dart';
import 'package:scannermodelclass/utils/colors.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({
    super.key,
    required this.rollno,
  });
  final String rollno;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  getData() async {
    context.read<ScanNotifier>().profileNotifier(
          rollno: widget.rollno,
          context: context,
        );
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final dat = context.watch<ScanNotifier>();
    print('afabfbahuqhuiwhuqh292929');
    print(dat.data);
    return Scaffold(
      backgroundColor: Colors.green,
      body: dat.data != null
          ? Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    dat.data!.name.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: kColorwhite),
                  ),
                  Text(
                    dat.data!.rollno.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: kColorwhite),
                  ),
                  Text(
                    dat.data!.email.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: kColorwhite),
                  ),
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(
                color: Colors.amber,
              ),
            ),
    );
  }
}

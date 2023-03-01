import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_scanner_example/page/qr_create_page.dart';
import 'package:qr_code_scanner_example/page/qr_scan_page.dart';
import 'package:qr_code_scanner_example/widget/button_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'QRama PAMA';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          primaryColor: Colors.red,
          scaffoldBackgroundColor: Color(0x253b7d),
        ),
        home: MainPage(title: title),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    @required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.orangeAccent,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                text: 'Generate QR Code',
                onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => QRCreatePage(),
                )),
              ),
              const SizedBox(height: 32),
              ButtonWidget(
                text: 'Scan QR Code',
                onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => QRScanPage(),
                )),
              ),
            ],
          ),
        ),
        bottomNavigationBar: i(
          pageController: _pageController,
          bottomBarItems: [
            const BottomBarItem(
              inActiveItem: Icon(
                Icons.home_filled,
                color: Colors.blueGrey,
              ),
              activeItem: Icon(
                Icons.home_filled,
                color: Colors.blueAccent,
              ),
              itemLabel: 'Page 1',
            ),
            const BottomBarItem(
              inActiveItem: Icon(
                Icons.star,
                color: Colors.blueGrey,
              ),
              activeItem: Icon(
                Icons.star,
                color: Colors.blueAccent,
              ),
              itemLabel: 'Page 2',
            ),
          ],
        ),
      );
}

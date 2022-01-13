import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kart_racing_league/metamask.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MetaMaskProvider()..init(),
        builder: (context, child) {
          return Scaffold(
            // appBar: AppBar(
            //   title: Text(widget.title),
            // ),
            backgroundColor: Color(0xFF1c1143),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  CircleAvatar(
                    radius: 35.0,
                    backgroundColor: Color(0xFFffe125),
                  ),
                  SizedBox(
                    height: 7.0,
                  ),
                  Text(
                    'Kart Racing League',
                    style: GoogleFonts.teko(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    'BLIND MINT EVENT',
                    style: GoogleFonts.kanit(
                      fontSize: 37.0,
                      color: Color(0xFFffe125),
                      fontWeight: FontWeight.w800,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Spacer(),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //       image: AssetImage('assets/images/gift.jpg'),
                  //     ),
                  //     color: Color(0xFF1c1143),
                  //   ),
                  // ),

                  // Image.asset('assets/images/gift.jpg'),
                  Consumer<MetaMaskProvider>(
                    builder: (context, provider, child) {
                      String text = '';

                      if (provider.isConnected && provider.isInOperatingChain) {
                        text = 'Connected';
                      } else if (provider.isConnected &&
                          !provider.isInOperatingChain) {
                        text =
                            'Wrong Chain. Please connect to ${MetaMaskProvider.operatingChain}';
                      } else if (provider.isEnabled) {
                        text = '000';
                      } else {
                        text = 'Please use a Web3 supported browser';
                      }
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 13.0,
                            backgroundColor: Color(0xFFffe125),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            text,
                            style: GoogleFonts.kanit(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFffe125),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 28.0,
                              vertical: 10.0,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.file_copy_outlined,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  'Approve',
                                  style: GoogleFonts.teko(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      InkWell(
                        onTap: () => context.read<MetaMaskProvider>().connect(),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFffe125),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 20.0,
                              bottom: 10.0,
                              right: 20.0,
                              top: 9.0,
                            ),
                            child: Text(
                              'CONNECT WALLET',
                              style: GoogleFonts.kanit(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            ),
          );
        });
  }
}

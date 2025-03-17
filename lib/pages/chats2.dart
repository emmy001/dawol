import 'package:flutter/material.dart';

void main() {
  runApp(const Chats2());
}

class Chats2 extends StatelessWidget {
  const Chats2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(body: ListView(children: [MessagesScreen()])),
    );
  }
}

class MessagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 375,
          height: 812,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 24,
                top: 739,
                child: Container(
                  width: 327,
                  height: 1,
                  decoration: BoxDecoration(color: Color(0xFFEEEEEE)),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 375,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 88,
                        decoration: BoxDecoration(color: Color(0xFFEEEEEE)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16, top: 32),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Messages',
                                style: TextStyle(
                                  color: Color(0xFF343434),
                                  fontSize: 24,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Icon(Icons.search, size: 24),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 22),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          children: List.generate(
                            5,
                            (index) => Padding(
                              padding: const EdgeInsets.only(right: 11),
                              child: CircleAvatar(
                                radius: 38.5,
                                backgroundImage: NetworkImage(
                                  "https://placehold.co/77x77",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 22),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          'Chats',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22.48,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      ...List.generate(4, (index) => ChatItem()),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 295,
                top: 697,
                child: FloatingActionButton(
                  onPressed: () {},
                  child: Icon(Icons.edit, color: Colors.white),
                  backgroundColor: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ChatItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 83,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          decoration: BoxDecoration(color: Colors.white),
          child: Row(
            children: [
              CircleAvatar(
                radius: 31.75,
                backgroundImage: NetworkImage("https://placehold.co/63x63"),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'John Doe',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.9),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      'Hey would you please come...',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.9),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '02:11',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.9),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 9),
                  Container(
                    padding: const EdgeInsets.all(9.53),
                    decoration: BoxDecoration(
                      color: Color(0xFF348EFC),
                      borderRadius: BorderRadius.circular(40.02),
                    ),
                    child: Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13.34,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(height: 1, color: Color(0xFFEEEEEE)),
      ],
    );
  }
}

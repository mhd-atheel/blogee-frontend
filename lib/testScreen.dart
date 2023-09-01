import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
   late IO.Socket socket;

  @override
  void initState() {
    connect();
    super.initState();

    // Connect to your Socket.IO server

  }

  void connect(){
    socket = IO.io('https://192.168.8.100:8000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    // Define event listeners
    // socket.on('connect', (_) {
    //   print('Connected to server');
    // });
    socket.connect();
    socket.onConnect((data) => print("Connceted SuccessFully"));
    print(socket.connected);
    // socket.on('chat message', (data) {
    //   print('Received message: $data');
    // });
  }


  // @override
  // void dispose() {
  //   socket.disconnect();
  //   super.dispose();
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Socket.IO Connection Status: ${socket.connected ? "Connected" : "Disconnected"}'),
            ElevatedButton(
              onPressed: () {
                // Send a message to the server
                socket.emit('chat message', 'Hello, Server!');
              },
              child: Text('Send Message'),
            ),
          ],
        ),
      ),
    );
  }
}

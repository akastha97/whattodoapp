import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:whattodo_final/screens/basic.dart';
import 'package:whattodo_final/ui_components/custom_appbar.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
          backgroundColor: Colors.cyan,
        ),
        appBar: const CustomAppbar(
          isDisplay: false,
          showBackButton: false,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20.0),
              ElevatedButton(
                  child: Text('Basics'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TableEventsExample()));
                  }),
              const SizedBox(height: 12.0),
              ElevatedButton(
                child: Text('Range Selection'),
                onPressed: () {},
                // onPressed: () => Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (_) => TableRangeExample()),
                // ),
              ),
              const SizedBox(height: 12.0),
              ElevatedButton(
                child: Text('Events'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TableEventsExample()));
                },
              ),
              const SizedBox(height: 12.0),
              ElevatedButton(
                child: Text('Multiple Selection'),
                onPressed: () {},
              ),
              const SizedBox(height: 12.0),
              ElevatedButton(
                child: Text('Complex'),
                onPressed: () {},
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ));
  }
}

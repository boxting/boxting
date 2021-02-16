import 'package:boxting/data/network/response/event_response/event_response.dart';
import 'package:flutter/material.dart';

class EventItem extends StatelessWidget {
  final EventResponseData event;

  const EventItem({Key key, this.event}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListTile(
          leading: Column(
            children: [
              Icon(Icons.calendar_today),
              Text(event.startDate),
            ],
          ),
          title: Text(event.name),
          subtitle: Text(event.information),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
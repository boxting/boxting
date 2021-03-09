import 'package:boxting/data/network/response/event_response/event_response.dart';
import 'package:flutter/material.dart';

import 'detail/event_detail_screen.dart';

class EventItem extends StatelessWidget {
  final EventResponseData event;

  const EventItem({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => EventDetailScreen.navigate(context, event.id.toString()),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListTile(
            leading: Column(
              children: [
                Icon(Icons.calendar_today),
                Text(event.startDate.toShortDate()),
              ],
            ),
            title: Text(event.name),
            subtitle: Text(
              event.information,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ),
      ),
    );
  }
}

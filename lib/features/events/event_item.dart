import 'package:boxting/data/network/response/event_response/event_response.dart';
import 'package:boxting/features/events/detail/event_detail_screen.dart';
import 'package:boxting/widgets/styles.dart';
import 'package:flutter/material.dart';

class EventItem extends StatelessWidget {

  const EventItem({required this.event, super.key});
  final EventResponseData event;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => EventDetailScreen.navigate(context, event.id.toString()),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListTile(
            leading: Column(
              children: [
                const Icon(Icons.calendar_today),
                Text(event.startDate.toShortDate()),
              ],
            ),
            title: Text(event.name, style: subTitleTextStyle),
            subtitle: Text(
              event.information,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        ),
      ),
    );
  }
}

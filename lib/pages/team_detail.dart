// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:nba_flutter_app/models/teams.dart';

import 'package:nba_flutter_app/widgets/customAppBar.dart';

class TeamDetail extends StatelessWidget {
  final Team team;

  const TeamDetail({
    Key? key,
    required this.team,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: CustomAppBar(title: team.full_name),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 64.0,
                      height: 64.0,
                      child: Image.network(
                          width: 64.0,
                          height: 64.0,
                          fit: BoxFit.cover,
                          'https://sportteamslogo.com/api?key=f5606875fc004cb2be1e2f89e30d720b&size=medium&tid=3427'),
                    ),
                    SizedBox(
                      width: 240.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                team.name,
                                style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(team.abbreviation),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              const Text('City: ',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text(team.city)
                            ],
                          ),
                          Row(
                            children: [
                              const Text('Division: ',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text(team.division)
                            ],
                          ),
                          Row(
                            children: [
                              const Text('Conference: ',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text(team.conference)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

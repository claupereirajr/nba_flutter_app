import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:nba_flutter_app/pages/pages.dart';
import 'package:nba_flutter_app/models/teams.dart';
import 'package:nba_flutter_app/widgets/customAppBar.dart';

class Home extends StatelessWidget {
  final String title;
  Home({Key? key, required this.title}) : super(key: key);

  List<Team> teams = [];

  Future getTeams() async {
    try {
      var response = await Dio().get('https://www.balldontlie.io/api/v1/teams');
      for (var object in response.data['data']) {
        final team = Team(
            id: object['id'],
            abbreviation: object['abbreviation'],
            city: object['city'],
            conference: object['conference'],
            division: object['division'],
            full_name: object['full_name'],
            name: object['name']);
        teams.add(team);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      extendBody: true,
      appBar: CustomAppBar(title: title),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        child: FutureBuilder(
          future: getTeams(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: teams.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(
                          '${teams[index].abbreviation} ${teams[index].name}'),
                      subtitle: Text(teams[index].city),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TeamDetail(team: teams[index]),
                        ));
                      },
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

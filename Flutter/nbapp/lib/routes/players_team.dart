import 'package:flutter/material.dart';
import 'package:nbapp/models/jugador.dart';
import 'package:nbapp/util/httphelper.dart';

class PlayersPerTeam extends StatefulWidget {
  @override
  _PlayersPerTeamState createState() => _PlayersPerTeamState();
}

class _PlayersPerTeamState extends State<PlayersPerTeam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    "https://fsb.zobj.net/crop.php?r=5ffMHZijd77ZhtdvnK8KQSDouWWgul75phyX-GSpysrIxJPzGbPPlqA1Y4s6PAQxGw-IUaKEMwiQ7NYWbi91oIIC7-wxZbaBIctsMqCsC3dnX9_7SF17PA1HLmkROFIFG1Y0qKj_87ssONZ6iYGQNYAXPH_5rvHwlNFhwolZ2szWXe4Zug0DPyd825w",
                  ),
                  fit: BoxFit.fill)),
        ),
        Container(
          margin: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(15)),
          child: FutureBuilder<List<Jugador>>(
            future: HttpHelper().fetchJugadoresPorEquipo("heat"),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Jugador> jugadores = snapshot.data;
                return ListView.separated(
                    itemBuilder: (context, index) => ListTile(
                          title: Text(jugadores[index].displayName),
                        ),
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: jugadores.length);
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        )
      ],
    ));
  }
}

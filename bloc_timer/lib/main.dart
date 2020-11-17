import 'package:bloc_timer/bloc/timer_block.dart';
import 'package:bloc_timer/bloc/timer_event.dart';
import 'package:bloc_timer/bloc/timer_state.dart';
import 'package:bloc_timer/ticker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
          create: (context) => TimerBloc(ticker: Ticker()), child: Timer()),
    );
  }
}

class Timer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Timer"),
      ),
      body: Column(
        children: [
          Center(
            child: BlocBuilder<TimerBloc, TimerState>(
              builder: (context, state) => Text(
                state.duration.toString(),
                style: TextStyle(fontSize: 40),
              ),
            ),
          ),
          BlocBuilder<TimerBloc, TimerState>(
            builder: (context, state) => Actions(),
          ),
        ],
      ),
    );
  }
}

class Actions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: _mapStateToActionButtons(BlocProvider.of<TimerBloc>(context)),
    );
  }

  List<Widget> _mapStateToActionButtons(TimerBloc timerBloc) {
    if (timerBloc.state is TimerInitial) {
      return [
        FloatingActionButton(
          onPressed: () {
            timerBloc.add(TimerStarted(timerBloc.state.duration));
          },
          child: Icon(Icons.play_arrow),
        )
      ];
    } else if (timerBloc.state is TimerRunInProgress) {
      return [
        FloatingActionButton(
          onPressed: () {
            timerBloc.add(TimerPaused());
          },
          child: Icon(Icons.pause),
        ),
        FloatingActionButton(
          onPressed: () {
            timerBloc.add(TimerReset());
          },
          child: Icon(Icons.replay),
        )
      ];
    } else if (timerBloc.state is TimerRunPause) {
      return [
        FloatingActionButton(
          onPressed: () {
            timerBloc.add(TimerResumed());
          },
          child: Icon(Icons.play_arrow),
        ),
        FloatingActionButton(
          onPressed: () {
            timerBloc.add(TimerReset());
          },
          child: Icon(Icons.replay),
        )
      ];
    }
    if (timerBloc.state is TimerRunComplete) {
      return [
        FloatingActionButton(
          onPressed: () {
            timerBloc.add(TimerReset());
          },
          child: Icon(Icons.replay),
        )
      ];
    }
    return [];
  }
}

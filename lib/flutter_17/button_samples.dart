/*
 * @Author: Tan Dong 
 * @Date: 2019-02-22 22:29:15 
 * @Last Modified by:   Tan Dong 
 * @Last Modified time: 2019-02-22 22:29:15 
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ButtonSamples extends StatefulWidget {
  String title;
  String name;
  ButtonSamples({Key key, this.title, this.name}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ButtonSamplesState();
  }
}

class ButtonSamplesState extends State<ButtonSamples> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button'),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              Center(
                child: Column(
                  children: <Widget>[
                    BackButton(
                      color: Colors.orange,
                    ),
                    CloseButton(),
                    ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: Text('FLAT BUTTON',
                              semanticsLabel: 'FLAT BUTTON 1'),
                          onPressed: () {
                            // Perform some action
                          },
                        ),
                        FlatButton(
                          child: Text(
                            'DISABLED',
                            semanticsLabel: 'DISABLED BUTTON 3',
                          ),
                          onPressed: null,
                        ),
                      ],
                    ),
                    FlatButton.icon(
                      disabledColor: Colors.teal,
                      label:
                          Text('FLAT BUTTON', semanticsLabel: 'FLAT BUTTON 2'),
                      icon: Icon(Icons.add_circle_outline, size: 18.0),
                      onPressed: () {},
                    ),
                    FlatButton.icon(
                      icon: const Icon(Icons.add_circle_outline, size: 18.0),
                      label: const Text('DISABLED',
                          semanticsLabel: 'DISABLED BUTTON 4'),
                      onPressed: null,
                    ),
                    ButtonBar(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        OutlineButton(
                          onPressed: () {},
                          child: Text('data'),
                        ),
                        OutlineButton(
                          onPressed: null,
                          child: Text('data'),
                        ),
                      ],
                    ),
                    ButtonBar(
                      children: <Widget>[
                        OutlineButton.icon(
                          label: Text('OUTLINE BUTTON',
                              semanticsLabel: 'OUTLINE BUTTON 2'),
                          icon: Icon(Icons.add, size: 18.0),
                          onPressed: () {},
                        ),
                        OutlineButton.icon(
                          disabledTextColor: Colors.orange,
                          icon: const Icon(Icons.add, size: 18.0),
                          label: const Text('DISABLED',
                              semanticsLabel: 'DISABLED BUTTON 6'),
                          onPressed: null,
                        ),
                      ],
                    ),
                    ButtonBar(
                      children: <Widget>[
                        RaisedButton(
                          child: Text('RAISED BUTTON',
                              semanticsLabel: 'RAISED BUTTON 1'),
                          onPressed: () {
                            // Perform some action
                          },
                        ),
                        RaisedButton(
                          child: Text('DISABLED',
                              semanticsLabel: 'DISABLED BUTTON 1'),
                          onPressed: null,
                        ),
                      ],
                    ),
                    ButtonBar(
                      children: <Widget>[
                        RaisedButton.icon(
                          icon: const Icon(Icons.add, size: 18.0),
                          label: const Text('RAISED BUTTON',
                              semanticsLabel: 'RAISED BUTTON 2'),
                          onPressed: () {
                            // Perform some action
                          },
                        ),
                        RaisedButton.icon(
                          icon: const Icon(Icons.add, size: 18.0),
                          label: Text('DISABLED',
                              semanticsLabel: 'DISABLED BUTTON 2'),
                          onPressed: null,
                        ),
                      ],
                    ),
                    ButtonBar(
                      children: <Widget>[
                        MaterialButton(
                          child: Text('MaterialButton1'),
                          onPressed: () {
                            // Perform some action
                          },
                        ),
                        MaterialButton(
                          child: Text('MaterialButton2'),
                          onPressed: null,
                        ),
                      ],
                    ),
                    ButtonBar(
                      children: <Widget>[
                        RawMaterialButton(
                          child: Text('RawMaterialButton1'),
                          onPressed: () {
                            // Perform some action
                          },
                        ),
                        RawMaterialButton(
                          child: Text('RawMaterialButton2'),
                          onPressed: null,
                        ),
                      ],
                    ),
                    ButtonBar(
                      children: <Widget>[
                        FloatingActionButton(
                          child: const Icon(Icons.add),
                          heroTag: 'FloatingActionButton1',
                          onPressed: () {
                            // Perform some action
                          },
                          tooltip: 'floating action button1',
                        ),
                        FloatingActionButton(
                          child: const Icon(Icons.add),
                          onPressed: null,
                          heroTag: 'FloatingActionButton2',
                          tooltip: 'floating action button2',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

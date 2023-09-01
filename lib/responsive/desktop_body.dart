import 'package:flutter/material.dart';

class DesktopBody extends StatelessWidget {
  const DesktopBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  height: 300,
                  color: Colors.purple[300],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        color: Colors.purple[200],
                        height: 120,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 300,
          child: Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    color: Colors.purple[200],
                    height: 120,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

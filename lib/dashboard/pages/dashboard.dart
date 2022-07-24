import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_app_dashboard/core/models/random_word.dart';
import 'package:web_app_dashboard/dashboard/widgets/goals_list_widgets.dart';
import '../controller/providers.dart';
import '../widgets/current_progress_list_widget.dart';
import '../widgets/drawer_widget.dart';

class Dashboard extends StatelessWidget {
  final String username;
  final String email;

  const Dashboard({Key? key, required this.username, required this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DrawerWidget(),
          Expanded(
            flex: 2,
            child: Column(
              children: [
             SizedBox(height: 32,),
                // first 4 boxes in grid
                MainGoalsGridView(email: email,),
                CurrentProgressList(email: email,),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 32, left: 8, right: 8),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[200],
                      ),
                      child: RandomWordValue(),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[200],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}



class RandomWordValue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Consumer(
       builder: (context,  WidgetRef ref, child){


        final wordList = ref.watch(randomWordProvider);

        final word = wordList[0];
        return Column(children: [
          Text(word.value),
          IconButton(
             icon: Icon(Icons.delete),
           onPressed: () {
             RandomWordController controller =
             ref.read(randomWordProvider.notifier);
             controller.updateWord(word.id);
           },
          )
        ],);
      },
     );
   }
 }



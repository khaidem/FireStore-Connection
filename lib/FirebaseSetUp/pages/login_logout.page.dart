// Container(
//                   height: 400,
//                   // width: 20,
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: StreamBuilder<QuerySnapshot>(
//                     stream: user,
//                     builder: (
//                       BuildContext context,
//                       AsyncSnapshot<QuerySnapshot> snapshot,
//                     ) {
//                       if (!snapshot.hasData) {
//                         return const Text('Loading');
//                       }
//                       return ListView(
//                         children: snapshot.data!.docs.map((document) {
//                           Map<String, dynamic> data =
//                               document.data()! as Map<String, dynamic>;
//                           return ListTile(
//                             title: Text(data['Name']),
//                             subtitle: Text(data['age']),
//                           );
//                         }).toList(),
//                       );
//                     },
//                   ),
//                 )
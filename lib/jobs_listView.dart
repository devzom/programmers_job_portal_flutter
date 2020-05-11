import 'package:flutter/material.dart';
import 'job_api.dart';
import 'job_model.dart';

class JobsListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Job>>(
      future: fetchJobsApi(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Job> data = snapshot.data;

          return _jobsListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }

  ListView _jobsListView(data) {
    return ListView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data[index].position, style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20)),
                  Row(
                    children: [
                      Icon(Icons.business),
                      SizedBox(width: 10),
                      Text(data[index].location, style: TextStyle(fontWeight: FontWeight.w500)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text('Skills required:', style: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey)),
                ],
              ),
              subtitle: data[index].skillsRequired.length > 0
                  ? ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.all(2),
                      itemCount: data[index].skillsRequired.length,
                      itemBuilder: (context, subIndex) {
                        return Row(
                          children: [
                            Divider(height: 35),
                            Icon(Icons.arrow_forward_ios, color: Colors.grey),
                            SizedBox(width: 15),
                            Text(data[index].skillsRequired[subIndex]),
                          ],
                        );
                      })
                  : Text('No skills required', style: TextStyle(fontWeight: FontWeight.w500, color: Colors.green[300])),
//            Text(data[index].skillsRequired.toString()),
              leading: Icon(Icons.work, color: Colors.grey[500]),
            ),
          );
        });
  }

//  ListTile _tile(String title, String subtitle, IconData icon) => ListTile(
//        title: Text(title, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
//        subtitle: ListView.builder(itemBuilder: null),
//        leading: Icon(icon, color: Colors.blue[500]),
//      );

}

import 'package:flutter/material.dart';
import 'package:job_finder/components/compact_item.dart';
import 'package:job_finder/models/job.dart';

class Joblist extends StatelessWidget {
  List<Job> jobs;

  Joblist(this.jobs);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: this.jobs.length,
      itemBuilder: (context, index) => CompactItemJob(this.jobs[index]),
    );
  }
}
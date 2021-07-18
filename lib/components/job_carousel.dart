import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:job_finder/components/item_job.dart';
import 'package:job_finder/models/job.dart';

class JobCarousel extends StatelessWidget {
  List<Job> jobs;

  JobCarousel(this.jobs);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 230.0,
        reverse: false,
        enableInfiniteScroll: false,
        viewportFraction: 0.86,
      ),
      items: this.jobs.map((e) => ItemJob(e, themeDark: jobs.indexOf(e) == 0)).toList()
    );
  }
}
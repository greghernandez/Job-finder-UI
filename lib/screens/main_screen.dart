import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_finder/components/job_carousel.dart';
import 'package:job_finder/components/job_list.dart';
import 'package:job_finder/models/company.dart';
import 'package:job_finder/models/job.dart';

class MainScreen extends StatelessWidget {

  List<Job> forYouJobs = [
    Job(
      role: 'Product Designer',
      location: 'San Francisco, CA',
      company: Company(
        name: 'Google',
        urlLogo:
            'https://images.theconversation.com/files/93616/original/image-20150902-6700-t2axrz.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=1000&fit=clip',
      ),
      isFavorite: false,
    ),
    Job(
      role: 'Frontend Web',
      location: 'Miami',
      company: Company(
        name: 'Netflix',
        urlLogo:
            'https://i.pinimg.com/originals/8c/74/0b/8c740bc13bd5a0a19c24d28dff98cbdd.png',
      ),
      isFavorite: true,
    ),
    Job(
      role: 'Mobile Developer',
      location: 'New York',
      company: Company(
        name: 'Amazon',
        urlLogo:
            'https://www.cbc-network.org/wp-content/uploads/2017/11/Amazon-icon.png',
      ),
      isFavorite: false,
    ),
  ];

  List<Job> recentJobs = [
    Job(
      role: 'UX Enginner',
      location: 'Mountain View, CA',
      company: Company(
        name: 'Apple',
        urlLogo:
            'https://i.pinimg.com/originals/1c/aa/03/1caa032c47f63d50902b9d34492e1303.jpg',
      ),
      isFavorite: true,
    ),
    Job(
      role: 'Motion Designer',
      location: 'New York, NY',
      company: Company(
        name: 'AirBnb',
        urlLogo:
            'https://menorcaaldia.com/wp-content/uploads/2018/02/air.jpg',
      ),
      isFavorite: true,
    ),
    Job(
      role: 'Python Developer',
      location: 'New York',
      company: Company(
        name: 'Amazon',
        urlLogo:
            'https://www.cbc-network.org/wp-content/uploads/2017/11/Amazon-icon.png',
      ),
      isFavorite: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            _customAppBar(),
            _textHeader(context),
            _forYou(context),
            _recent(context),
            SizedBox(height: 50.0,)
          ],
        )
      ),
    );
  }

  Widget _customAppBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical:  4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/slider.svg',
              semanticsLabel: 'Slider',
            ),
            iconSize: 40.0,
            onPressed: (){},
          ),
          Row(
            children: <Widget>[
              IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/search.svg',
                  semanticsLabel: 'Slider',
                ),
                iconSize: 40.0,
                onPressed: (){},
              ),
              IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/settings.svg',
                  semanticsLabel: 'Slider',
                ),
                iconSize: 40.0,
                onPressed: (){},
              ),
            ],
          ),
      ],
    ),
  );
}

  Widget _textHeader(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      child: (
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Hide Jade',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              'Find your next',
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              'design job',
              style: Theme.of(context).textTheme.headline2,
            ),
          ]
        )
      )
    );
  }

  Widget _forYou(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Text(
            'For you',
            style: Theme.of(context).textTheme.bodyText1,
          )
        ),
        JobCarousel(this.forYouJobs)
      ],
    );
  }

  Widget _recent(context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 4.0, bottom: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                'Recent',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                'See All',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Joblist(this.recentJobs),
        ),
      ],
    );
  }
}
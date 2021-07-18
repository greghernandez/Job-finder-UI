import 'dart:io';

import 'package:flutter/material.dart';
import 'package:job_finder/models/job.dart';

class CompactItemJob extends StatefulWidget {
  Job job;

  CompactItemJob(this.job);

  @override
  _CompactItemJobState createState() => _CompactItemJobState();
}

class _CompactItemJobState extends State<CompactItemJob> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Container(
        decoration: _boxDecoration(),
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                _companyLogo(),
                __infoJobTexts(context)
              ]
            ),
            _favIcon()
          ],
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: <BoxShadow> [
        BoxShadow(
          color: Colors.black45,
          offset: Offset(2.0, 2.0),
          blurRadius: 8.0,
        )
      ]
    );
  }

  Widget _companyLogo() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Image.network(this.widget.job.company.urlLogo),
    );
  }

  Widget __infoJobTexts(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          this.widget.job.company.name,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Text(
          this.widget.job.role,
          style: Theme.of(context).textTheme.headline4,
        ),
        SizedBox(height: 4.0,),
        Row(
          children: <Widget>[
            Icon(
              Icons.location_on,
              color: Theme.of(context).highlightColor,
              size: 14.0,
            ),
            SizedBox(height: 4.0,),
            Text(
              this.widget.job.location,
              style: TextStyle(
                fontSize: 14.0,
                color: Theme.of(context).highlightColor
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _favIcon() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        child: Icon(
          this.widget.job.isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.grey,
        ),
        onTap: () {
          setState(() {
            this.widget.job.isFavorite = !this.widget.job.isFavorite;
          });
        }
      ),
    );
  }
}
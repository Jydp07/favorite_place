
import 'package:flutter/material.dart';

import '../models/place.dart';
import '../screen/place_detail.dart';

class PlacesList extends StatelessWidget{
  const PlacesList({super.key, required this.place});

  final List<Place> place;

  void _detailPlace(BuildContext context,Place place){
    Navigator.push(context, MaterialPageRoute(builder: (ctx) => PlaceDetailScreen(place: place),),);
  }
  @override
  Widget build(BuildContext context) {
    if(place.isEmpty){
      return Center(child: Text('No places add yet!',style: Theme.of(context).textTheme.titleMedium!.copyWith(
        color: Theme.of(context).colorScheme.onBackground,),),);
    }
    return ListView.builder(
        itemCount: place.length,itemBuilder: (ctx,index) => ListTile(
      leading: CircleAvatar(
        radius: 26,
        backgroundImage: FileImage(place[index].image!),
      ),
      title: Text(place[index].title,style: Theme.of(context).textTheme.titleSmall!.copyWith(
        color: Theme.of(context).colorScheme.onBackground
      ),),
        onTap: (){
          _detailPlace(context, place[index]);
        },
    ));
  }

}
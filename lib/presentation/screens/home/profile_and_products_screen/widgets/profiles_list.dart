import 'package:flutter/material.dart';

class ProfilesList extends StatelessWidget {
  const ProfilesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      sliver: SliverList.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return ProfileTile(isSelected: index == 0);
        },
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  final bool isSelected;
  const ProfileTile({super.key, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 1, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Color.fromRGBO(0, 0, 0, 0.45),
          width: 1,
        ),
      ),
      child: Card(
        elevation: 0,
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              tileColor: Color.fromRGBO(249, 249, 249, 0.55),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: Color.fromRGBO(237, 237, 237, 1),
                  width: 1,
                ),
              ),
              leading: Container(
                margin: EdgeInsets.only(left: 10),
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1757416654883-c73c67b3382b?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  ),
                ),
              ),
              title: Text(
                'Aleesha Haider',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                'aleeshahaider@gmail.com',
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.45),
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: isSelected
                  ? Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Icon(
                        Icons.check_circle,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    )
                  : null,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Activated Products',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

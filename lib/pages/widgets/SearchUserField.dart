import 'package:flutter/material.dart';
import 'package:get_profile_page/bloc/ProfileBloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchUserField extends StatelessWidget {

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
              ),
              child: TextField(
                onSubmitted: (value) => submitUserName(context, _controller.text),
                controller: _controller,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  hintText: 'Search User Here',
                  contentPadding: EdgeInsets.all(12),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void submitUserName(BuildContext context, String userName) {
    final profileBloc = context.read<ProfileBloc>();
    profileBloc.add(GetUser(userName));
  }

}

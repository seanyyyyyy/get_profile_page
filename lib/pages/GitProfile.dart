import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_profile_page/bloc/ProfileBloc.dart';
import 'package:get_profile_page/pages/widgets/BuildUserData.dart';
import 'package:get_profile_page/pages/widgets/SearchUserField.dart';

class GitProfile extends StatefulWidget {
  @override
  _GitProfileState createState() => _GitProfileState();
}

class _GitProfileState extends State<GitProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2BE1C8),
      appBar: AppBar(
        backgroundColor: Color(0xFF188991),
        title: Text('GITHUB PROFILE'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            height: 650,
            child: BlocConsumer<ProfileBloc, ProfileState>(
              builder: (context, state) {
                if(state is ProfileInitial) return buildInitialInputField();
                else if (state is ProfileLoading) return buildLoadingState();
                else if (state is ProfileLoaded) return buildUserData(state.profile);
                else return buildInitialInputField();
              },
              listener: (context,state) {
                if (state is ProfileError) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
                }
              },
            )
          ),
        ],
      ),
    );
  }

  Widget buildInitialInputField() {
    return Center(
      child: SearchUserField(),
    );
  }

  Widget buildLoadingState() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
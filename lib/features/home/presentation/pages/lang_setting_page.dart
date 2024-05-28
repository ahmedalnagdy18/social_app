import 'package:firebase_app/features/home/presentation/lang_cubit/locale_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LangSettingsPage extends StatelessWidget {
  const LangSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocConsumer<LocaleCubit, ChangeLocaleState>(
            listener: (context, state) {
              Navigator.of(context).pop();
            },
            builder: (context, state) {
              return DropdownButton<String>(
                value: state.locale.languageCode,
                icon:
                    const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                items: ['ar', 'en'].map((String items) {
                  return DropdownMenuItem<String>(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    context.read<LocaleCubit>().changeLanguage(newValue);
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

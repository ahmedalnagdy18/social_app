import 'package:firebase_app/features/home/presentation/cubit/lang_cubit/locale_cubit.dart';
import 'package:firebase_app/features/home/presentation/cubit/theme_cubit/theme_cubit.dart';
import 'package:firebase_app/features/home/presentation/cubit/theme_cubit/theme_state.dart';
import 'package:firebase_app/features/home/presentation/widgets/alret_dialog.dart';
import 'package:firebase_app/features/home/presentation/widgets/setting_widget.dart';
import 'package:firebase_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          S.of(context).setting,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.red,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BlocConsumer<LocaleCubit, ChangeLocaleState>(
                listener: (context, state) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        S.of(context).langSnakBar,
                      ),
                      backgroundColor: Colors.grey.shade800,
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
                builder: (context, state) {
                  return SettingWidget(
                    dropdown: DropdownButton<String>(
                      value: state.locale.languageCode,
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: Colors.black),
                      items: ['ar', 'en'].map((String items) {
                        return DropdownMenuItem<String>(
                          value: items,
                          child: Text(items == 'ar'
                              ? S.of(context).dropdown1
                              : S.of(context).dropdown2),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          context.read<LocaleCubit>().changeLanguage(newValue);
                        }
                      },
                    ),
                    icon: Icons.language_outlined,
                    title: S.of(context).language,
                    subtitle: S.of(context).changeLang,
                  );
                },
              ),
              const SizedBox(height: 20),
              //! Theme
              BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, themeState) {
                  return SettingWidget(
                    icon: Icons.color_lens_outlined,
                    title: S.of(context).theme,
                    subtitle: S.of(context).changeColor,
                    dropdown: Switch(
                      value: themeState.isDarkTheme,
                      onChanged: (value) {
                        context.read<ThemeCubit>().toggleTheme();
                      },
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              //! Logout
              SettingWidget(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialogWidget();
                    },
                  );
                },
                icon: Icons.logout,
                title: S.of(context).logout,
                subtitle: S.of(context).logoutFromApp,
                dropdown: const SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

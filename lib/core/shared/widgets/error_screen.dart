import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter_project/app/generated/app_localizations.dart';
import 'package:flutter_starter_project/app/language/language_cubit.dart';
import 'package:flutter_starter_project/app/language/language_state.dart';
import 'package:flutter_starter_project/app/theme/cubit/theme_cubit.dart';
import 'package:flutter_starter_project/app/theme/cubit/theme_state.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, this.error, this.onRetry});
  final Object? error;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();
    final languageCubit = context.read<LanguageCubit>();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                color: Theme.of(context).colorScheme.error,
                size: 80,
              ),
              const SizedBox(height: 24),
              Text(
                'Oops! Something went wrong.',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              if (error != null) ...[
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onErrorContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    error.toString(),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.refresh),
                    label: const Text('Retry'),
                    onPressed:
                        onRetry ?? () => Navigator.of(context).maybePop(),
                  ),
                  const SizedBox(width: 16),
                  OutlinedButton.icon(
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Back'),
                    onPressed: () => Navigator.of(context).maybePop(),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Divider(
                height: 32,
                thickness: 1,
                color: Theme.of(context).dividerColor.withAlpha(100),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<ThemeCubit, ThemeState>(
                    builder: (context, state) {
                      final isDark = state.themeMode == ThemeMode.dark;
                      return IconButton(
                        tooltip: 'Toggle Theme',
                        icon: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
                        onPressed: () async {
                          await themeCubit.switchTheme(
                            isDark ? ThemeMode.light : ThemeMode.dark,
                          );
                        },
                      );
                    },
                  ),
                  BlocBuilder<LanguageCubit, LanguageState>(
                    builder: (context, langState) {
                      return DropdownButton<Locale>(
                        value: langState.locale,
                        underline: const SizedBox(),
                        icon: const Icon(Icons.language),
                        onChanged: (Locale? newLocale) async {
                          if (newLocale != null) {
                            await languageCubit.switchLanguage(newLocale);
                          }
                        },
                        items: AppLocalizations.supportedLocales.map((locale) {
                          return DropdownMenuItem<Locale>(
                            value: locale,
                            child: Text(locale.toLanguageTag().toUpperCase()),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<Object?>('error', error))
      ..add(ObjectFlagProperty<VoidCallback?>.has('onRetry', onRetry));
  }
}

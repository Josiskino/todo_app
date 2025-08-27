import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'config/theme/theme.dart';
import 'core/constants/app_text_strings.dart';
import 'core/providers/theme_provider.dart';
import 'presentation/routes/app_router_go.dart';

class App extends ConsumerWidget {
  final String flavor;
  const App({super.key, required this.flavor});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "${AppTextStrings.appName} - $flavor",
      theme: TAppTheme.lightThemeData(context),
      darkTheme: TAppTheme.darkThemeData(context),
      themeMode: themeMode,
      routerConfig: AppRouterGo.router,
    );
  }
}

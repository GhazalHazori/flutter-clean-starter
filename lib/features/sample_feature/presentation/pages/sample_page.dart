import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../di/injection_container.dart';
import '../cubit/sample_cubit.dart';
import '../widgets/sample_list_item.dart';

class SamplePage extends StatelessWidget {
  const SamplePage({super.key});

  static const String routeName = '/sample';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SampleCubit>()..loadSamples(),
      child: const _SampleView(),
    );
  }
}

class _SampleView extends StatelessWidget {
  const _SampleView();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.tr('sample.title'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: BlocBuilder<SampleCubit, SampleState>(
          builder: (context, state) {
            switch (state.status) {
              case SampleStatus.initial:
              case SampleStatus.loading:
                return const Center(child: CircularProgressIndicator());
              case SampleStatus.failure:
                return Center(
                  child: Text(
                    l10n.tr('sample.error'),
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                );
              case SampleStatus.success:
                if (state.items.isEmpty) {
                  return Center(
                    child: Text(
                      l10n.tr('sample.empty'),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  );
                }
                return ListView.separated(
                  itemCount: state.items.length,
                  separatorBuilder: (_, __) =>
                      const SizedBox(height: AppSpacing.md),
                  itemBuilder: (context, index) {
                    final item = state.items[index];
                    return SampleListItem(entity: item);
                  },
                );
            }
          },
        ),
      ),
    );
  }
}



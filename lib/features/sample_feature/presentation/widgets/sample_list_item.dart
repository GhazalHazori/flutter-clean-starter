import 'package:flutter/material.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../domain/entities/sample_entity.dart';

class SampleListItem extends StatelessWidget {
  const SampleListItem({
    super.key,
    required this.entity,
  });

  final SampleEntity entity;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Row(
          children: [
            CircleAvatar(
              child: Text(
                entity.id.toString(),
                style: theme.textTheme.labelMedium,
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Text(
                entity.title,
                style: theme.textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



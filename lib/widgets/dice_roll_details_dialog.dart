import 'package:flutter/material.dart';

import 'package:theuniversedecides/l10n/generated/app_localizations.dart';
import 'package:theuniversedecides/theme/app_colors.dart';

/// Opens the scrollable breakdown of a settled dice roll: every die value,
/// the sum expression and the total.
///
/// The main dice screen only has room for a one-line summary, so large rolls
/// (e.g. 25d20) are verified here instead.
Future<void> showDiceRollDetailsDialog(
  BuildContext context, {
  required String notation,
  required List<int> results,
}) {
  return showDialog<void>(
    context: context,
    builder: (_) => DiceRollDetailsDialog(notation: notation, results: results),
  );
}

class DiceRollDetailsDialog extends StatelessWidget {
  const DiceRollDetailsDialog({
    super.key,
    required this.notation,
    required this.results,
  });

  final String notation;
  final List<int> results;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final total = results.fold(0, (sum, value) => sum + value);

    return AlertDialog(
      key: const Key('dice-details-dialog'),
      backgroundColor: AppColors.panelBackground,
      title: Text(
        l10n.diceDetailsTitle,
        style: const TextStyle(color: Colors.white),
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notation,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.6,
                        color: AppColors.textCaption,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        for (var i = 0; i < results.length; i++)
                          _DieValue(
                            key: Key('dice-details-value-$i'),
                            label: l10n.diceDetailsDie(i + 1, results[i]),
                            value: results[i],
                          ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      l10n.diceDetailsSumLabel,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.6,
                        color: AppColors.textCaption,
                      ),
                    ),
                    const SizedBox(height: 6),
                    SelectableText(
                      '${results.join(' + ')} = $total',
                      key: const Key('dice-details-sum'),
                      style: const TextStyle(
                        fontSize: 15,
                        height: 1.4,
                        color: AppColors.textSoft,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(height: 24, color: Color(0x24FFFFFF)),
            Text(
              l10n.diceTotal(total),
              key: const Key('dice-details-total'),
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.4,
                color: AppColors.gold1,
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          key: const Key('dice-details-close'),
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l10n.diceDetailsClose),
        ),
      ],
    );
  }
}

class _DieValue extends StatelessWidget {
  const _DieValue({super.key, required this.label, required this.value});

  final String label;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: label,
      excludeSemantics: true,
      child: Container(
        constraints: const BoxConstraints(minWidth: 44),
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0x0DFFFFFF),
          border: Border.all(color: const Color(0x24FFFFFF)),
        ),
        // widthFactor keeps the chip as narrow as its value inside the Wrap.
        child: Center(
          widthFactor: 1,
          child: Text(
            '$value',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

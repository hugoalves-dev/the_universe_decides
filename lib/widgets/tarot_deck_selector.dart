import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:theuniversedecides/l10n/generated/app_localizations.dart';
import 'package:theuniversedecides/services/tarot_deck_service.dart';
import 'package:theuniversedecides/theme/app_colors.dart';

class TarotDeckSelector extends ConsumerWidget {
  const TarotDeckSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final selectedStyle = ref.watch(tarotDeckStyleProvider);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (_) => _TarotDeckPickerSheet(selectedStyle: selectedStyle),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: const Color(0x1A7A4FFF),
            border: Border.all(color: const Color(0x597A4FFF)),
          ),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.runePurple.withValues(alpha: 0.7),
                ),
                child: const Icon(
                  Icons.auto_awesome,
                  size: 17,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.aboutTarotDeckTitle,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      _tarotDeckLabel(selectedStyle, l10n),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFD9CFFF),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.expand_more, color: AppColors.textDim),
            ],
          ),
        ),
      ),
    );
  }
}

class _TarotDeckPickerSheet extends ConsumerWidget {
  const _TarotDeckPickerSheet({required this.selectedStyle});

  final TarotDeckStyle selectedStyle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final bottomInset = MediaQuery.of(context).viewPadding.bottom;
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.7,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF15101F), Color(0xFF0D0A14)],
        ),
        borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
        border: Border(top: BorderSide(color: Color(0x1AFFFFFF))),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(22, 14, 22, bottomInset + 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0x33FFFFFF),
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Text(
              l10n.aboutTarotDeckTitle,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              l10n.aboutTarotDeckSubtitle,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textCaption,
              ),
            ),
            const SizedBox(height: 16),
            for (final style in TarotDeckStyle.values) ...[
              _TarotDeckOption(
                label: _tarotDeckLabel(style, l10n),
                selected: style == selectedStyle,
                onTap: () {
                  ref.read(tarotDeckStyleProvider.notifier).setStyle(style);
                  Navigator.of(context).pop();
                },
              ),
              if (style != TarotDeckStyle.values.last) const SizedBox(height: 10),
            ],
          ],
        ),
      ),
    );
  }
}

class _TarotDeckOption extends StatelessWidget {
  const _TarotDeckOption({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Material(
    color: Colors.transparent,
    child: InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: selected ? const Color(0x1A7A4FFF) : const Color(0x08FFFFFF),
          border: Border.all(color: selected ? const Color(0x597A4FFF) : const Color(0x14FFFFFF)),
        ),
        child: Row(
          children: [
            Icon(
              selected ? Icons.radio_button_checked : Icons.radio_button_off,
              size: 20,
              color: selected
                  ? const Color(0xFFD9CFFF)
                  : AppColors.textDim,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: selected ? Colors.white : AppColors.textSoft,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

String _tarotDeckLabel(TarotDeckStyle style, AppLocalizations l10n) =>
    switch (style) {
      TarotDeckStyle.universe => l10n.cardDeckUniverse,
      TarotDeckStyle.riderWaite => l10n.tarotDeckRiderWaite,
      TarotDeckStyle.jeanDodal => l10n.tarotDeckJeanDodal,
      TarotDeckStyle.vieville => l10n.tarotDeckVieville,
      TarotDeckStyle.solaBusca => l10n.tarotDeckSolaBusca,
      TarotDeckStyle.etteillaI => l10n.tarotDeckEtteilla,
    };

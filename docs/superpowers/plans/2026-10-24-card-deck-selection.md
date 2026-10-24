# Card Deck Selection Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Let users select the current card artwork or the linked CC0 playing-card deck with blue or red backs, and persist that choice locally.

**Architecture:** Bundle the linked deck's 52 face PNGs and two back PNGs as Flutter assets. A Riverpod notifier stores a stable `CardDeckStyle` identifier in SharedPreferences and exposes it to the About/settings screen and card draw screen. The selected style changes only card artwork; the existing 1–52 card mapping and draw behavior remain intact.

**Tech Stack:** Flutter, Dart, Riverpod 3, SharedPreferences, Flutter localization ARB files, bundled PNG assets.

**Spec:** `docs/superpowers/specs/2026-10-24-card-deck-selection-design.md`

## Global Constraints

- Keep the current Universe style as the default for missing or invalid preference values.
- Persist the choice locally under a stable identifier; do not store localized labels.
- Keep the current draw range at 1–52 and preserve card identity, history labels, and Tarot behavior.
- Bundle assets so they work on Android, iOS, and Web; do not load artwork from the network.
- Use the linked [Public-Domain-and-CC0-Playing-Cards](https://github.com/AustinGabriel/Public-Domain-and-CC0-Playing-Cards) artwork and retain its source URL and CC0 license note.
- Before finishing the feature, update `pubspec.yaml` from `2.7.0+100217` to `2.8.0+100217`, preserving the build number, and replace `CHANGELOG.xml` with the current feature notes in all supported locales.
- Keep CI path filters unchanged; `assets/**`, `pubspec.yaml`, and `lib/**` are already covered.

## Review Focus

- Missing, unknown, or invalid stored style resolves to the current Universe artwork.
- Changing a style updates the card draw presentation and saves the new stable identifier.
- All 52 standard card identities map to the correct face art; jokers are not added to the draw range.
- The blue and red choices use the same face set and the matching selected back.
- Card artwork keeps its rounded card shape and fits the existing card stage on narrow, wide, and browser layouts.

---

### Task 1: Bundle the linked CC0 deck artwork

**Files:**
- Create: `assets/cards/public_domain/faces/{suit}_{rank}.png` (52 standard faces)
- Create: `assets/cards/public_domain/back_blue.png`
- Create: `assets/cards/public_domain/back_red.png`
- Create: `assets/cards/ATTRIBUTION.md`
- Modify: `pubspec.yaml`

**Interfaces:**
- Produces: Normalized lowercase asset paths using `hearts`, `diamonds`, `clubs`, or `spades` and rank names `ace`, `2`–`10`, `jack`, `queen`, or `king`.

- [x] Copy the 52 standard-card PNG faces and the blue and red back PNGs from the linked repository into the normalized asset paths; resize them to 630×882 pixels for the 210×296 logical card stage at up to 3× density, preserve transparency, and omit its jokers.
- [x] Add the source repository URL and its stated CC0/public-domain license to `assets/cards/ATTRIBUTION.md`.
- [x] Declare both `assets/cards/public_domain/` and `assets/cards/public_domain/faces/` in `pubspec.yaml` so the back and face images are bundled on all supported platforms.

### Task 2: Add the persistent deck preference and settings selector

**Files:**
- Create: `lib/services/card_deck_service.dart`
- Modify: `lib/screens/about_me_screen.dart`
- Modify: `lib/l10n/app_{de,en,es,fr,hi,it,pt,tr,uk}.arb`
- Regenerate: `lib/l10n/generated/app_localizations*.dart`

**Interfaces:**
- Produces: `enum CardDeckStyle { universe, publicDomainBlue, publicDomainRed }`.
- Produces: `cardDeckStyleProvider`, a `NotifierProvider<CardDeckNotifier, CardDeckStyle>`.
- Produces: `CardDeckNotifier.setStyle(CardDeckStyle style)` and a stable SharedPreferences key `card_deck_style` whose values are the enum names.

- [x] Add the enum and notifier in `lib/services/card_deck_service.dart`; default to `universe`, load the stored enum name, and fall back to `universe` for an absent or invalid value.
- [x] Implement `setStyle` to update provider state and save `style.name` to SharedPreferences.
- [x] Add localized labels for the setting and its three choices to all nine ARB files, keeping the existing English ARB as the localization template.
- [x] Generate the localization Dart files with the configured generator when available; if the Flutter/Dart SDK is unavailable, keep the generated interface and locale implementations synchronized with the ARB files.
- [x] Add a selector directly below the Sound effects control in `AboutMeScreen`, bound to `cardDeckStyleProvider` and `setStyle`.

### Task 3: Render the selected deck in the card draw screen

**Files:**
- Modify: `lib/screens/card_draw_screen.dart`

**Interfaces:**
- Consumes: `CardDeckStyle` and `cardDeckStyleProvider` from `card_deck_service.dart`; `PlayingCard` and `CardSuit` from `card_draw_controller.dart`.
- Produces: `_publicDomainFaceAssetPath(PlayingCard card) -> String`, mapping each standard card to `assets/cards/public_domain/faces/{suit}_{rank}.png`; the rank names are `ace`, `2`–`10`, `jack`, `queen`, and `king`.

- [x] Watch `cardDeckStyleProvider` in `CardDrawScreen` and pass the selected style into `_CardFace`.
- [x] Preserve the existing custom Universe front and back for `CardDeckStyle.universe`.
- [x] For CC0 styles, display the mapped face PNG and select `back_blue.png` or `back_red.png` for the card back.
- [x] Keep card rank/suit, result history, animation timing, haptics, and random draw logic unchanged when the selected style changes.

### Task 4: Apply the feature release metadata

**Files:**
- Modify: `pubspec.yaml`
- Modify: `CHANGELOG.xml`

- [x] Set the semantic version to `2.8.0+100217`; preserve the build number exactly.
- [x] Replace all previous changelog notes with one concise card-deck selection note for each supported locale, using the existing required locale tags and order in `.claude/CLAUDE.md`.


# Selectable Tarot Deck Artwork Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add five persistent historic tarot artwork choices, preserve the current style as the default, and add shared upright/reversed card meanings to the existing 78-card tarot draw.

**Architecture:** Keep tarot selection and draw state separate from the playing-card deck selector. Model each card's identity, orientation, shared meaning, and per-deck optional asset path in focused tarot files; the draw screen renders selected artwork with a styled current-face fallback. Persist tarot deck preference with SharedPreferences and add selector controls to the existing About/settings surface. Keep the current app style as the default alongside the five historic decks.

**Tech Stack:** Flutter/Dart, Riverpod 3, SharedPreferences, Flutter gen-l10n ARB files, bundled assets.

**Spec:** `docs/superpowers/specs/2026-10-24-tarot-deck-artwork-design.md`

## Global Constraints

- Offer Rider–Waite, Jean Dodal, Viéville, Sola–Busca, and Etteilla I as persistent artwork choices.
- Keep the app's existing 78 card identities and shared concise upright/reversed meanings across artwork styles.
- Use locally bundled reusable images with attribution and license details; use the current illustrated face when no matching image exists.
- Do not copy Biddy Tarot descriptions; paraphrase public-domain source material from *The Pictorial Key to the Tarot* and cite it.
- Keep existing tarot draw/history behavior and support all nine app locales.
- Increment the semantic version's minor component, preserve the build number, and replace `CHANGELOG.xml` with localized notes.

## Review Focus

- A selected image path is missing or undecodable: render the current card face rather than an empty/broken card.
- A stored deck enum is absent or invalid: use the default artwork without crashing.
- A draw result is outside 1–78 or orientation data is absent: clamp the card identity as today and produce a valid orientation.
- A user draws again while a prior request is pending: preserve the existing in-flight guard and don't mismatch title, orientation, meaning, or art.
- A longer localized deck label or meaning overflows the current tarot layout: constrain text and retain the responsive card layout.

---

### Task 1: Add and attribute five tarot artwork collections

**Files:**
- Create: `assets/tarot/<deck-id>/...` for reusable card images selected from each linked Wikimedia Commons deck
- Create: `assets/tarot/ATTRIBUTION.md`
- Modify: `pubspec.yaml`

**Interfaces:**
- Produces asset IDs under `assets/tarot/<deck-id>/<card-number>.<ext>`; deck IDs are `rider_waite`, `jean_dodal`, `vieville`, `sola_busca`, and `etteilla_i`.
- Each bundled file records its Commons source page, creator where known, license/public-domain basis, and any image edits in `ATTRIBUTION.md`.

- [ ] Select matching reusable images for the shared 78 card positions from the five linked collections; do not bundle uncertain-license colorizations.
- [ ] Record source and license details for each selected collection/file and preserve gaps where the source has no verified match.
- [ ] Declare `assets/tarot/` in Flutter assets and confirm each declared asset path exists.

### Task 2: Extend tarot card data and random orientation

**Files:**
- Modify: `lib/controllers/tarot_draw_controller.dart`
- Create: `lib/data/tarot_card_meanings.dart`
- Create: `lib/services/tarot_artwork_service.dart`
- Modify: `test/widget_test.dart` to keep its existing Random.org request expectation aligned with the new 1–156 sample range
- Do not add or run tests unless the user asks for verification

**Interfaces:**
- `TarotCard` exposes `isReversed`, `uprightMeaning`, and `reversedMeaning` or a derived `meaning` matching its orientation.
- `TarotArtworkService.assetPathFor(CardDeckStyle style, int deckNumber) -> String?` returns a bundled asset or null for fallback.
- Tarot artwork styles are `riderWaite`, `jeanDodal`, `vieville`, `solaBusca`, and `etteillaI`.

- [ ] Add concise original upright/reversed paraphrases for all 78 shared identities, with source notes citing *The Pictorial Key to the Tarot*.
- [ ] Request one Random.org integer from 1–156 and decode it into a uniformly random card (1–78) plus upright/reversed orientation; keep the in-flight guard and random-service fallback behavior.
- [ ] Keep `TarotCard.fromDeckNumber` bounds and names unchanged; attach shared meaning and orientation to the drawn card.
- [ ] Map known matching assets through `TarotArtworkService`, returning null when a deck/card asset is unavailable.

### Task 3: Persist and localize the tarot artwork selector

**Files:**
- Create: `lib/services/tarot_deck_service.dart`
- Create: `lib/widgets/tarot_deck_selector.dart`
- Modify: `lib/screens/about_me_screen.dart`
- Modify: `lib/l10n/app_{de,en,es,fr,hi,it,pt,tr,uk}.arb`
- Regenerate: `lib/l10n/generated/app_localizations*.dart`

**Interfaces:**
- `tarotDeckStyleProvider` is a `NotifierProvider<TarotDeckNotifier, TarotDeckStyle>`.
- `TarotDeckStyle` has `universe`, `riderWaite`, `jeanDodal`, `vieville`, `solaBusca`, and `etteillaI`; default to `universe` and persist under `tarot_deck_style`.
- `TarotDeckNotifier.setStyle(TarotDeckStyle style) -> Future<void>` updates state and SharedPreferences.

- [ ] Add loading with the existing race-safe preference pattern and ignore unknown stored enum values.
- [ ] Add a six-choice selector (the existing app style plus five historic decks) matching the existing `CardDeckSelector` interaction and visual style.
- [ ] Add localized title/subtitle and all five style labels to each of the nine ARB catalogs; update generated localization APIs.

### Task 4: Render selected artwork, orientation, and meaning

**Files:**
- Modify: `lib/screens/tarot_draw_screen.dart`
- Modify: `test/screens/tarot_draw_layout_test.dart` (only if test additions are authorized)

**Interfaces:**
- `TarotDrawScreen` watches `tarotDeckStyleProvider`, and `_TarotCardFace` receives both `TarotCard?` and the selected `TarotDeckStyle`.
- Localization exposes upright/reversed labels and a short meaning label.

- [ ] Render selected bundled card image when `TarotArtworkService` returns a path; keep the existing styled card-face widget for unavailable art and the waiting state.
- [ ] Show localized upright/reversed orientation and the matching concise meaning after reveal.
- [ ] Preserve the flip animation, current card title, arcana label, button flow, random result history entry, and responsive layout.

### Task 5: Release metadata and source review

**Files:**
- Modify: `pubspec.yaml`
- Replace: `CHANGELOG.xml`

- [ ] Increment `2.8.0+100223` to the next minor semantic version while retaining build number `100223`.
- [ ] Replace the changelog contents with localized release notes for selectable tarot decks and upright/reversed meanings.
- [ ] Review all bundled image sources/licenses and confirm the fallback path covers unbundled mappings.
- [ ] Review the final diff and run `git diff --check`; do not run automated tests unless the user requests them.

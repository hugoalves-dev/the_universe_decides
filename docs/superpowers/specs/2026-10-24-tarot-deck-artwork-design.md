# Selectable tarot artwork design

## Intent

Let tarot users choose among the five historic decks linked from issue #77 while keeping the app's existing 78-card identities and shared concise meanings. This adds visual variety and beginner-friendly upright/reversed readings without making each deck a different reading system.

## Goals

- Offer Rider–Waite, Jean Dodal, Viéville, Sola–Busca, and Etteilla I as persistent artwork choices in the existing settings surface.
- Draw each of the 78 existing card identities upright or reversed and show a short original paraphrase for that orientation.
- Use locally bundled artwork with source/license attribution and work offline.
- Keep existing tarot draw/history behavior and the shared card naming system.

## Non-goals and constraints

- Do not redefine card identity or meanings for individual decks; the selected deck changes artwork only.
- Do not copy Biddy Tarot descriptions. Paraphrase public-domain source material from *The Pictorial Key to the Tarot* and cite it.
- Wikimedia category contents vary in coverage and naming. Use verified reusable files, map artwork to the shared card identity where possible, and fall back to the existing illustrated card face when a deck lacks a matching image.
- Preserve the existing shared tarot draw and results-history flow.

## Approaches

1. **Selectable artwork with shared card data (chosen):** add five persisted styles and map their artwork onto the existing 78-card model; use shared upright/reversed meanings. This matches the user's preference and avoids duplicating card data across historical decks.
2. **Independent deck systems:** each deck has its own naming and meanings. This better reflects historical differences but multiplies content, mapping, and translation work, and does not match the requested shared meanings.
3. **Artwork only:** add selectable decks without reversal or meanings. This is smaller but leaves the primary beginner-facing part of issue #77 incomplete.

## Experience and implementation

Add a tarot deck selector modeled on the existing playing-card deck selector in the About/settings screen. Persist the selected enum with SharedPreferences and default to the app's current tarot artwork. The draw screen uses the selected style for its card image, keeps the shared card title, and displays an orientation label plus a concise meaning. Reversal is randomized as part of each draw. Keep card identity selection uniformly random over the current 78-card deck and use the existing random service for both random values.

Bundle source images under a tarot asset directory. Keep per-source attribution and license details alongside the assets. Add localized labels and orientation/meaning UI strings for the app's nine supported locales, following current localization conventions.

## Release and verification

This is a user-facing feature: increment the semantic version's minor component, preserve its build number, and replace `CHANGELOG.xml` with localized notes for this feature. Add focused controller, settings persistence, card artwork mapping, and screen coverage. Run formatting, localization generation/consistency checks, `flutter analyze`, and relevant tarot tests when implementation is approved.

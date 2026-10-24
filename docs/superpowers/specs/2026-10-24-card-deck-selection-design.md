# Card deck selection design

## Intent

Let users choose the artwork used by the playing-card draw and keep that choice across launches, following the existing Sound effects preference pattern.

## Goals

- Add a card deck selector next to Sound effects on the About/settings screen.
- Offer the current Universe style and the linked CC0 deck with blue or red backs.
- Save the selected style locally and restore it on startup; a missing or invalid value uses the current Universe style.
- Use bundled artwork from [Public-Domain-and-CC0-Playing-Cards](https://github.com/AustinGabriel/Public-Domain-and-CC0-Playing-Cards), including its illustrated faces and selected back.
- Preserve the existing 52-card draw mapping, random request range, result labels, history, and card flip behavior.

## Non-goals and anti-goals

- User imports, downloads, or runtime network loading of deck artwork.
- Changing the separate Tarot feature or adding jokers to the current draw.
- Changing card selection, randomness, or history based on artwork.
- Making a deck choice per draw; it is a persistent app preference.

## Constraints

- The linked repository contains one illustrated 52-card face set, two jokers, and blue and red backs. The current feature draws only the 52 standard cards.
- The linked project has moved from the URL in the issue comment to the URL above. Its README describes all artwork as public domain / CC0.
- The app uses Flutter, Riverpod, and SharedPreferences. The Sound effects preference is shown on the About screen and stored locally.
- Bundled assets must work in Android, iOS, and Web builds.

## Approaches

1. **Simple persistent setting (selected):** Add a selector beside Sound effects with three choices: Universe style, CC0 deck with blue back, and CC0 deck with red back. Store a stable choice identifier locally and render the corresponding bundled artwork. This follows the existing settings pattern and fits the currently available artwork.
2. **Dedicated visual deck picker:** Add a separate picker screen with card previews. It is more visual and leaves room for more decks, but adds navigation and UI beyond the three current choices.

The simple setting was selected because it provides the requested choice and persistence in the existing settings surface.

## Behavior

- Keep the existing Universe style as the default for users without a saved preference.
- Changing the selector updates the selected deck in the card draw screen and persists it across restarts.
- Both CC0 choices use the linked 52 illustrated faces; the choice determines the card back.
- Card identity remains based on the current 1–52 mapping. The artwork is presentation only.
- Preserve the asset source URL and CC0 license information alongside the bundled assets or in the repository's existing asset attribution documentation.

## Builder decisions

- The choice is device/browser-local, like Sound effects; it does not sync between installations.
- The selector belongs on the existing About/settings screen, directly beside Sound effects.
- The implementation should use stable stored identifiers rather than localized labels as preference values.

/// Pure helpers for weighted List Draw picks.
///
/// Each item owns as many consecutive "tickets" as its weight. The
/// randomness service draws one ticket in `[0, totalWeight)`, and
/// [weightedIndexForTicket] maps it back to the item that owns it, so an
/// item with weight 2 is exactly twice as likely as one with weight 1.
library;

/// Sum of all [weights].
int totalWeight(List<int> weights) =>
    weights.fold(0, (sum, weight) => sum + weight);

/// Index of the item owning [ticket], given each item's [weights].
///
/// Out-of-range tickets are clamped to the first or last item so a
/// malformed service response can never produce an invalid index.
int weightedIndexForTicket(List<int> weights, int ticket) {
  assert(weights.isNotEmpty, 'weights must not be empty');
  if (ticket < 0) return 0;

  var upperBound = 0;
  for (var i = 0; i < weights.length; i++) {
    upperBound += weights[i];
    if (ticket < upperBound) return i;
  }
  return weights.length - 1;
}

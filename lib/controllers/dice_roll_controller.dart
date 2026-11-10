import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:theuniversedecides/dice/dice_roll_request.dart';
import 'package:theuniversedecides/services/random_org_service.dart';

const maxDiceCount = 100;

final diceRollProvider = NotifierProvider<DiceRollController, DiceRollState>(
  DiceRollController.new,
);

const _unset = Object();

class DiceRollState {
  const DiceRollState({
    this.diceCount = 1,
    this.selectedSides = 20,
    this.selectedDiceSides = const {20},
    this.isFetching = false,
    this.isRolling = false,
    this.activeRequestId,
    this.animationError,
    this.results = const [],
    this.rollRequest,
  });

  final int diceCount;
  final int selectedSides;
  final Set<int> selectedDiceSides;
  final bool isFetching;
  final bool isRolling;
  final String? activeRequestId;
  final String? animationError;
  final List<int> results;
  final DiceRollRequest? rollRequest;

  /// Kept for callers that only need a single loading indicator.
  bool get isLoading => isFetching;
  bool get isBusy => isFetching || isRolling;
  int get total => results.fold(0, (sum, result) => sum + result);

  DiceRollState copyWith({
    int? diceCount,
    int? selectedSides,
    Set<int>? selectedDiceSides,
    bool? isFetching,
    bool? isRolling,
    Object? activeRequestId = _unset,
    Object? animationError = _unset,
    List<int>? results,
    Object? rollRequest = _unset,
  }) {
    return DiceRollState(
      diceCount: diceCount ?? this.diceCount,
      selectedSides: selectedSides ?? this.selectedSides,
      selectedDiceSides: selectedDiceSides ?? this.selectedDiceSides,
      isFetching: isFetching ?? this.isFetching,
      isRolling: isRolling ?? this.isRolling,
      activeRequestId: identical(activeRequestId, _unset)
          ? this.activeRequestId
          : activeRequestId as String?,
      animationError: identical(animationError, _unset)
          ? this.animationError
          : animationError as String?,
      results: results ?? this.results,
      rollRequest: identical(rollRequest, _unset)
          ? this.rollRequest
          : rollRequest as DiceRollRequest?,
    );
  }
}

class DiceRollController extends Notifier<DiceRollState> {
  late final RandomOrgService _randomOrgService;
  var _requestSequence = 0;

  @override
  DiceRollState build() {
    _randomOrgService = ref.read(randomOrgServiceProvider);
    return const DiceRollState();
  }

  void setDiceCount(int value) {
    state = state.copyWith(
      diceCount: value.clamp(1, maxDiceCount).toInt(),
    );
  }

  void setSelectedSides(int value) {
    state = state.copyWith(
      selectedSides: value,
      selectedDiceSides: {value},
    );
  }

  void toggleSelectedSides(int value) {
    final selected = {...state.selectedDiceSides};
    if (!selected.add(value)) {
      if (selected.length == 1) return;
      selected.remove(value);
    }
    state = state.copyWith(
      selectedSides: selected.contains(value) ? value : selected.first,
      selectedDiceSides: selected,
    );
  }

  /// Fetches values once and creates the request the dice renderer must animate.
  Future<void> startRoll() async {
    if (state.isBusy) {
      return;
    }

    final diceCount = state.diceCount;
    final selectedSides = state.selectedDiceSides.toList()..sort();
    state = state.copyWith(isFetching: true, animationError: null);

    try {
      final resultsBySides = await Future.wait(
        selectedSides.map(
          (sides) => _randomOrgService.fetchIntegers(
            count: diceCount,
            min: 1,
            max: sides,
          ),
        ),
      );
      final results = resultsBySides.expand((values) => values).toList();
      final notation = selectedSides
          .map((sides) => '${diceCount}d$sides')
          .join('+');
      final requestId = _nextRequestId();
      final request = DiceRollRequest(
        requestId: requestId,
        notation: notation,
        results: results,
      );
      state = state.copyWith(
        isFetching: false,
        isRolling: true,
        activeRequestId: requestId,
        results: results,
        rollRequest: request,
      );
    } catch (_) {
      state = state.copyWith(
        isFetching: false,
        animationError: 'Unable to fetch dice values.',
      );
    }
  }

  /// Legacy entry point while callers migrate to [startRoll].
  Future<void> roll() => startRoll();

  void completeAnimation(String requestId) {
    if (!_isActiveRequest(requestId)) {
      return;
    }
    state = state.copyWith(isRolling: false, activeRequestId: null);
  }

  void failAnimation(String requestId, String error) {
    if (!_isActiveRequest(requestId)) {
      return;
    }
    state = state.copyWith(
      isRolling: false,
      activeRequestId: null,
      animationError: error,
    );
  }

  void timeoutAnimation(String requestId) {
    failAnimation(requestId, 'Dice animation timed out.');
  }

  bool _isActiveRequest(String requestId) {
    return state.isRolling && state.activeRequestId == requestId;
  }

  String _nextRequestId() {
    _requestSequence++;
    return '${DateTime.now().microsecondsSinceEpoch}-$_requestSequence';
  }
}

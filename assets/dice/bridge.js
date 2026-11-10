(function () {
  'use strict';

  function emit(event) {
    if (window.DiceBridgeChannel && window.DiceBridgeChannel.postMessage) {
      window.DiceBridgeChannel.postMessage(JSON.stringify(event));
    }
  }

  function validRoll(roll) {
    if (!roll || typeof roll.requestId !== 'string' || !roll.requestId ||
        typeof roll.notation !== 'string' || !Array.isArray(roll.results)) {
      return false;
    }
    var termPattern = /([1-9]\d{0,2})d(4|6|8|10|12|20|100)/g;
    var terms = [];
    var match;
    while ((match = termPattern.exec(roll.notation)) !== null) {
      terms.push({ count: Number(match[1]), sides: Number(match[2]) });
    }
    if (!terms.length || terms.map(function (term) {
      return term.count + 'd' + term.sides;
    }).join('+') !== roll.notation) return false;
    var resultIndex = 0;
    return terms.every(function (term) {
      if (term.count > 100 || resultIndex + term.count > roll.results.length) return false;
      for (var i = 0; i < term.count; i++, resultIndex++) {
        var result = roll.results[resultIndex];
        if (!Number.isInteger(result) || result < 1 || result > term.sides) return false;
      }
      return true;
    }) && resultIndex === roll.results.length;
  }

  var diceBox = new DICE.dice_box(document.body);
  var activeRequestId = null;
  var activeResults = null;
  var completionTimer = null;
  var maximumRollDurationMs = 10000;

  function completeActiveRoll() {
    if (activeRequestId === null) return;
    var requestId = activeRequestId;
    var results = activeResults;
    activeRequestId = null;
    activeResults = null;
    if (completionTimer !== null) {
      clearTimeout(completionTimer);
      completionTimer = null;
    }
    emit({ event: 'rollCompleted', requestId: requestId, results: results });
  }

  window.addEventListener('resize', function () {
    diceBox.reinit(document.body);
  });

  window.DiceBridge = {
    roll: function (roll) {
      if (!validRoll(roll)) {
        emit({ type: 'error', requestId: roll && roll.requestId, message: 'Invalid roll' });
        return;
      }
      if (activeRequestId !== null) {
        emit({ type: 'error', requestId: roll.requestId, message: 'A roll is already active' });
        return;
      }
      activeRequestId = roll.requestId;
      activeResults = roll.results;
      emit({ type: 'rollStarted', requestId: roll.requestId });
      diceBox.setDice(roll.notation);
      diceBox.start_throw(function () {
        return roll.results;
      }, function () {
        completeActiveRoll();
      });
      completionTimer = setTimeout(function () {
        if (activeRequestId !== roll.requestId) return;
        diceBox.finish_roll();
        activeRequestId = null;
        activeResults = null;
        completionTimer = null;
      }, maximumRollDurationMs);
    },
    finish: function (requestId) {
      if (requestId !== activeRequestId) return;
      diceBox.finish_roll();
      completeActiveRoll();
    },
    pause: function () { diceBox.pause(); },
    resume: function () { diceBox.resume(); }
  };

  document.addEventListener('contextmenu', function (event) { event.preventDefault(); });
  emit({ type: 'ready' });
}());

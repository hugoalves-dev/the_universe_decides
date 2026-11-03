const fs = require('fs');
const vm = require('vm');
const assert = require('assert');
const context = vm.createContext({ THREE: { FlatShading: 1 }, console });
vm.runInContext(fs.readFileSync('assets/dice/dice.js', 'utf8') + '\nthis.DICE = DICE;', context);
const check = context.DICE.dice_box.prototype.check_if_throw_finished;
const body = () => ({ velocity: { x: 0, y: 0, z: 0 }, angularVelocity: { x: 0, y: 0, z: 0 } });
const box = { iteration: 1, dices: [{body: body()}, {body: body()}] };
for (box.iteration = 1; box.iteration < 20; box.iteration++) check.call(box);
box.dices[0].body.angularVelocity.x = 2;
assert.strictEqual(check.call(box), false, 'a die moving after a collision must prevent completion');
box.iteration = 1000;
assert.strictEqual(check.call(box), false, 'elapsed time must not mark moving dice as settled');
console.log('dice motion regression passed');
const vectors = context.DICE.dice_box.prototype.generate_vectors.call({w: 200, h: 300}, {set: ['d6','d6','d6','d6','d6']}, {x: 0.7, y: 0.7}, 100);
for (let i = 0; i < vectors.length; i++) for (let j = 0; j < i; j++) {
  const a = vectors[i].pos, b = vectors[j].pos;
  assert.ok(Math.hypot(a.x-b.x, a.y-b.y, a.z-b.z) >= 100, 'initial dice positions must be separated');
}

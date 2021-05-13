function maxValue(node, visited = new Set()) {
  if (visited.has(node)) return Number.NEGATIVE_INFINITY;

  visited.add(node);

  let neighborsMax = node.neighbors.map((n) => maxValue(n, visited));
  return Math.max(node.val, ...neighborsMax);
}

module.exports = {
  maxValue,
};


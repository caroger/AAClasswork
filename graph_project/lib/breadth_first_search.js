function breadthFirstSearch(startingNode, targetVal) {
  let q = [startingNode];
  let visited = new Set();

  while (q.length) {
    let curr = q.shift();
    //if not visited
    if (curr.val === targetVal) return curr;
    if (!visited.has(curr)) {
      visited.add(curr);
      q.push(...curr.neighbors);
    }
  }
  return null;
}

module.exports = {
  breadthFirstSearch,
};


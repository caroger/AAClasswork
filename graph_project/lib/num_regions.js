function numRegions(graph) {
  let visited = new Set();
  let count = 0;
  for (node in graph) {
    if (dfs(node, graph, visited)) count++;
  }

  return count;
}

const dfs = (node, graph, visited) => {
  if (visited.has(node)) return false;

  visited.add(node);
  graph[node].forEach((n) => dfs(n, graph, visited));
  return true;
};

module.exports = {
  numRegions,
};


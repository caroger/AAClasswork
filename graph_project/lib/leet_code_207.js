// View the full problem and run the test cases at:
//  https://leetcode.com/problems/course-schedule/

function canFinish(numCourses, prerequisites) {
  let preMap = new Map();
  for (prePair of prerequisites) {
    const [crs, pre] = prePair;
    if (preMap.has(crs)) {
      preMap.get(crs).push(pre);
    } else {
      preMap.set(crs, [pre]);
    }
  }

  let visitSet = new Set();
  function dfs(crs) {
    if (visitSet.has(crs)) return false;
    if (!preMap.has(crs)) return true;
    visitSet.add(crs);

    for (pre of preMap.get(crs)) {
      if (!dfs(pre)) return false;
    }
    visitSet.delete(crs);
    preMap.delete(crs);
    return true;
  }

  for (let i = 0; i < numCourses; i++) {
    if (!dfs(i)) return false;
  }
  return true;
}

console.log(
  canFinish(5, [
    [0, 1],
    [0, 2],
    [1, 3],
    [1, 4],
    [3, 4],
  ])
);

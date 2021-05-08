function depthFirstSearch(root, targetVal) {
  let stack = [root];

  while (stack.length) {
    let cur = stack.pop();
    if (cur.val === targetVal) return cur;
    if (cur.right) stack.push(cur.right);
    if (cur.left) stack.push(cur.left);
  }

  return null;
}

module.exports = {
  depthFirstSearch,
};


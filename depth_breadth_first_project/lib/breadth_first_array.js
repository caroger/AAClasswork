function breadthFirstArray(root) {
  let q = [root];
  let res = [];

  while (q.length) {
    let cur = q.shift();
    res.push(cur.val);
    if (cur.left) q.push(cur.left);
    if (cur.right) q.push(cur.right);
  }
  return res;
}

module.exports = {
  breadthFirstArray,
};


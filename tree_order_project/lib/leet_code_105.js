// View the full problem and run the test cases at:
//  https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/

const { TreeNode } = require("./tree_node.js");

function buildTree(preorder, inorder) {
  if (preorder.length === 0 && inorder.length === 0) return null;

  let rootVal = preorder[0];
  let rootNode = new TreeNode(rootVal);

  let mid = 0;
  while (inorder[mid] !== rootVal && mid < inorder.length) mid++;

  let leftInorder = inorder.slice(0, mid);
  let rightInorder = inorder.slice(mid + 1);

  let leftPreorder = preorder.filter((x) => leftInorder.includes(x));
  let rightPreorder = preorder.filter((x) => rightInorder.includes(x));

  let leftNode = buildTree(leftPreorder, leftInorder);
  let rightNode = buildTree(rightPreorder, rightInorder);

  rootNode.left = leftNode;
  rootNode.right = rightNode;

  return rootNode;
}

let preorder = [3, 9, 20, 15, 7];
let inorder = [9, 3, 15, 20, 7];

console.log(buildTree(preorder, inorder));

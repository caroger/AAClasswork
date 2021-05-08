class TreeNode {
  constructor(val) {
    this.val = val;
    this.left = null;
    this.right = null;
  }
}

class BST {
  constructor() {
    this.root = null;
  }

  insert(val, root = this.root) {
    if (!this.root) {
      this.root = new TreeNode(val);
      return;
    }

    if (val < root.val) {
      if (!root.left) {
        root.left = new TreeNode(val);
      } else {
        this.insert(val, root.left);
      }
    } else {
      if (!root.right) {
        root.right = new TreeNode(val);
      } else {
        this.insert(val, root.right);
      }
    }
  }

  searchRecur(val, root = this.root) {
    if (!root) return false;

    if (val > root.val) {
      return this.searchRecur(val, root.right);
    } else if (val < root.val) {
      return this.searchRecur(val, root.left);
    } else if (val === root.val) return true;

    // return false;
  }

  searchIter(val) {
    if (!this.root) return false;

    let cur = this.root;
    while (cur !== null) {
      if (cur.val === val) return true;
      if (val < cur.val) cur = cur.left;
      else if (val > cur.val) cur = cur.right;
    }
    return false;
  }

  inOrderPrint(root = this.root) {
    if (!root) return;
    this.inOrderPrint(root.left);
    console.log(root.val);
    this.inOrderPrint(root.right);
  }
}

module.exports = {
  TreeNode,
  BST,
};

let tree = new BST();


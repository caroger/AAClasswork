// ============================================================================
// Implementation Exercise: Stack
// ============================================================================
//
// -------
// Prompt:
// -------
//
// Implement a Stack and all of its methods below!
//
// ------------
// Constraints:
// ------------
//
// Make sure the time and space complexity of each is equivalent to those
// in the table provided in the Time and Space Complexity Analysis section
// of your Stack reading!
//
// -----------
// Let's Code!
// -----------

class Node {
  constructor(value, next) {
    this.value = value ?? null;
    this.next = next ?? null;
  }
}

class Stack {
  constructor() {
    this.top = null;
    this.bottom = null;
    this.length = 0;
  }

  push(val) {
    let node = new Node(val);
    if (this.length === 0) {
      this.top = node;
      this.bottom = node;
    } else {
      node.next = this.top;
      this.top = node;
    }
    this.length++;
    return this.length;
  }

  pop() {
    if (this.length === 0) return null;

    let oldTop = this.top;
    if (this.length === 1) {
      this.top = null;
      this.bottom = null;
    }

    let newTop = oldTop.next;
    this.top = newTop;
    this.length--;
    return oldTop.value;
  }

  size() {
    return this.length;
  }
}

exports.Node = Node;
exports.Stack = Stack;

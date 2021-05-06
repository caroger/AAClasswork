// ============================================================================
// Implementation Exercise: Singly Linked List
// ============================================================================
//
// -------
// Prompt:
// -------
//
// Implement a Singly Linked List and all of its methods below!
//
// ------------
// Constraints:
// ------------
//
// Make sure the time and space complexity of each is equivalent to those
// in the table provided in the Time and Space Complexity Analysis section
// of your Linked List reading!
//
// -----------
// Let's Code!
// -----------

// TODO: Implement a Linked List Node class here
class Node {
  constructor(value, next) {
    this.value = value ?? 0;
    this.next = next ?? null;
  }
}

// TODO: Implement a Singly Linked List class here
class LinkedList {
  constructor(head, tail) {
    this.head = head ?? null;
    this.tail = tail ?? null;
    this.length = 0;
  }

  // TODO: Implement the addToTail method here
  addToTail(val) {
    let node = new Node(val);
    if (this.length === 0) {
      this.head = node;
      this.tail = this.head;
    } else {
      this.tail.next = node;
      this.tail = this.tail.next;
    }
    this.length += 1;
    return this;
  }

  // TODO: Implement the removeTail method here
  removeTail() {
    if (this.length === 0) {
      return undefined;
    }

    let oldTail = this.tail;

    if (this.length === 1) {
      this.head = null;
      this.tail = null;
      this.length = 0;
      return oldTail;
    }

    let newTail = this.head;

    while (newTail.next !== oldTail) {
      newTail = newTail.next;
    }
    newTail.next = null;
    this.tail = newTail;
    this.length -= 1;
    return oldTail;
  }

  // TODO: Implement the addToHead method here
  addToHead(val) {
    let node = new Node(val);
    if (this.length === 0) {
      this.head = node;
      this.tail = node;
    } else {
      node.next = this.head;
      this.head = node;
    }
    this.length += 1;

    return this;
  }

  // TODO: Implement the removeHead method here
  removeHead() {
    if (this.length === 0) return undefined;

    let oldHead = this.head;
    this.head = this.head.next;
    this.length -= 1;

    if (this.length === 0) {
      this.head = null;
      this.tail = null;
    }

    return oldHead;
  }

  // TODO: Implement the contains method here
  contains(target) {
    let cur = this.head;
    while (cur !== null) {
      if (cur.value === target) return true;
      cur = cur.next;
    }
    return false;
  }

  // TODO: Implement the get method here
  get(index) {
    if (index > this.length - 1 || index < 0) return null;
    let cur = this.head;
    let i = 0;
    while (i < index) {
      cur = cur.next;
      i++;
    }
    return cur;
  }

  // TODO: Implement the set method here
  set(index, val) {
    if (index > this.length - 1 || index < 0) return false;
    let node = this.get(index);
    node.value = val;
    return true;
  }

  // TODO: Implement the insert method here
  insert(index, val) {
    if (index < 0 || index >= this.length) return false;
    if (index === 0) return !!this.addToHead(val);
    if (index === this.length) !!this.addTotail(val);

    const node = new Node(val);
    const prev = this.get(index - 1);
    node.next = prev.next;
    prev.next = node;
    this.length++;
    return true;
  }

  // TODO: Implement the remove method here
  remove(index) {
    if (index < 0 || index >= this.length) return undefined;
    if (index === 0) return this.removeHead();
    if (index === this.length - 1) return this.removeTail();
    let prev = this.get(index - 1);
    let removed = prev.next;
    prev.next = prev.next.next;
    this.length--;
    return removed;
  }

  // TODO: Implement the size method here
  size() {
    return this.length;
  }
}

exports.Node = Node;
exports.LinkedList = LinkedList;

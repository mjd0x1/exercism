export const LINKED_LIST_HEAD = 0
export const LINKED_LIST_TAIL = 1
export const LINKED_LIST_BY_INDEX = 2

class Node {
  constructor(value) {
    this.previous = null
    this.next = null
    this.value = value
  }
}

export class LinkedList {
  constructor() {
    const start_node = new Node(null)
    const end_node = new Node(null)
    this._start_node = start_node
    this._end_node = end_node
    this._start_node.next = end_node
    this._end_node.previous = start_node

    this.head = null
    this.tail = null
    this.count_items = 0
  }

  is_empty = () => this.count_items == 0

  push = (value) => {
    this.insert_node_between(value, this._end_node.previous, this._end_node)
  }

  pop = () => {
    const value = this.tail.value
    this.remove_node(this.tail)
    return value
  }

  shift = () => {
    const value = this.head.value
    this.remove_node(this.head)
    return value
  }

  unshift = (value) => {
    this.insert_node_between(value, this._start_node, this._start_node.next)
  }

  delete = (value) => {
    const node = this.find_value(value)
    if (node != null) {
      this.remove_node(node)
    }
  }

  remove_node = (node) => {
    if (!this.is_empty()) {
      node.previous.next = node.next
      node.next.previous = node.previous
      this.update_head_tail()
      this.count_items -= 1
    }
  }

  count = () => this.count_items

  insert_node_between(value, node_pre, node_post) {
    const node = new Node(value)
    node.previous = node_pre
    node.next = node_post
    node_pre.next = node
    node_post.previous = node
    this.update_head_tail()
    this.count_items += 1
  }

  get_values = () => {
    let node = this.head
    const values = []
    while (node.value != null) {
      values.push(node.value)
      node = node.next
    }
    return values
  }

  find_value = (value) => {
    let node = this.head

    while (node != null) {
      if (node.value == value) {
        return node
      }
      node = node.next
    }
  }

  update_head_tail = () => {
    this.head = this._start_node.next
    this.tail = this._end_node.previous
  }
}

export class LinkedList2 {
  constructor() {
    this.head = null
    this.tail = null
    this.count_items = 0
  }

  is_empty = () => this.count_items == 0

  initialise_head_tail = (node) => {
    this.head = node
    this.tail = node
  }

  pop = () => {
    const value = this.tail.value
    this.remove_node(this.tail)
    return value
  }

  shift = () => {
    const value = this.head.value
    this.remove_node(this.head)
    return value
  }

  delete = (value) => {
    const node = this.find_value(value)
    if (node != null) {
      this.remove_node(node)
    }
  }

  unshift = (value) => {
    this.insert_node(value, LINKED_LIST_HEAD)
  }

  push = (value) => {
    this.insert_node(value, LINKED_LIST_TAIL)
  }

  count = () => this.count_items

  find_value = (value) => {
    let node = this.head

    while (node != null) {
      if (node.value == value) {
        return node
      }
      node = node.next
    }
  }

  find_node_at = (idx) => {
    let node = this.head
    let count = 0
    while (node != null) {
      if (count == idx) {
        return node
      }
      node = node.next
      count += 1
    }
    return null
  }

  get_values = () => {
    let node = this.head
    const values = []
    while (node != null) {
      values.push(node.value)
      node = node.next
    }
    return values
  }

  insert_node = (value, insert_id, idx = undefined) => {
    const node = new Node(value)

    let use_id = insert_id
    if (insert_id == LINKED_LIST_BY_INDEX && idx == 0) {
      use_id = LINKED_LIST_HEAD
    }

    if (this.is_empty()) {
      this.initialise_head_tail(node)
    } else {
      switch (use_id) {
        case LINKED_LIST_TAIL:
          node.previous = this.tail
          this.tail.next = node
          this.tail = node
          break
        case LINKED_LIST_HEAD:
          node.next = this.head
          this.head.previous = node
          this.head = node
          break
        case LINKED_LIST_BY_INDEX:
          const node_after = this.find_node_at(idx)
          if (node_after != null) {
            const node_before = node_after.previous
            node.next = node_after
            node_before.next = node
            node_after.previous = node
          }
        default:
      }
    }

    this.count_items += 1
  }

  remove_node = (node) => {
    if (!this.is_empty()) {
      if (node.previous != null) {
        node.previous.next = node.next
      }
      if (node.next != null) {
        node.next.previous = node.previous
      }
      if (node == this.tail) {
        this.tail = node.previous
      }
      if (node == this.head) {
        this.head = node.next
      }

      this.count_items -= 1
    }
  }
}

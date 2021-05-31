//
// This is only a SKELETON file for the 'Linked List' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

class Node {
  next  = {}
  previous ={}
  value  = 0
}

class LinkedList {
  root_node
  current_node
  count

  constructor(){
    this.root_node = {}
    this.current_node = {}
    this.count = 0 
  }
  
  push(val) {
     
     const n = new Node()
     n.value = val
     n.previous = this.current_node
     if (this.root_node == {}) { this.root_node = n}
     this.current_node.next = n
     this.current_node = this.current_node.next
     this.count +=1 
     
  }

  next() {
     this.current_node = this.current_node.next
     return this
  }

  get_root() {
    return this.root_node
  }

  previous() {
    this.current_node = this.current_node.previous
    return this
  }

  pop() {
     const val  = this.current_node.value
     this.current_node = this.current_node.previous
     this.current_node.next = {}
     this.count-=1
     return val
  }

  shift() {
    throw new Error('Remove this statement and implement this function');
  }

  unshift() {
    throw new Error('Remove this statement and implement this function');
  }

  delete(val) {
        
  }

  count() {
    return this.count
  }
}

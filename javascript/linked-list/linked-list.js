
class Node {

  constructor(p,n,v){
    this.previous = p
    this.next = n
    this.value = v
  }
}

 export class LinkedList {

  constructor(){
    this.head =  null
    this.tail = null
    this.count_items= 0
  }
  
  push(val) {
     const n  =  new Node(null,null,val)
     if (this.count_items == 0) {
       this.head= n
       this.tail = n
     } else {
       n.previous =  this.tail
       this.tail.next = n
       this.tail =  this.tail.next
     }
     this.count_items+=1
  }

  pop() {
    const value =  this.tail.value
    if (this.count_items > 1){ 
      this.tail.previous.next = null
      this.tail = this.tail.previous
    } else {
      this.head =  null
      this.tail = null
    }
    
    this.count_items-=1
    return value
  }


  shift() {
    const value  = this.head.value
    if (this.count_items > 1) {
      this.head.next.previous = null
      this.head = this.head.next
    } else { 
      this.head = null
      this.tail = null
    }
    this.count_items-=1
    return value
  }

  unshift(val) {
    const n  =  new Node(null,null,val)
    if (this.count_items == 0) {
      this.head= n
      this.tail = n
    } else {
      this.head.previous = n
      n.next = this.head
      this.head = n 
    }
   
    this.count_items+=1
   
  }
  count() {
    return this.count_items
  }

  delete(val){

    if (this.count_items > 1){
      let n = this.head
      while (n != null) {
        if (n.value  == val) {
          if (n.previous!= null) {
            n.previous.next = n.next
          }
          if (n.next != null) {
            n.next.previous = n.previous
          }

          if (n== this.tail) {
            this.tail=n.previous
          }

          this.count_items -=1
          return
        }

        n = n.next
      }
    } else {
      if (this.head.value == val){
        this.head= null
        this.tail = null
        this.count_items -=1
      }
    }
  }
}

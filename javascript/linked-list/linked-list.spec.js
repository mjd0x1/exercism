import { LinkedList, LinkedList2, LINKED_LIST_BY_INDEX } from "./linked-list"

describe("LinkedList", () => {
  test("pop gets last element from the list", () => {
    const list = new LinkedList()
    list.push(7)
    expect(list.pop()).toBe(7)
  })

  test("push/pop respectively add/remove at the end of the list", () => {
    const list = new LinkedList()
    list.push(11)
    list.push(13)
    expect(list.pop()).toBe(13)
    expect(list.pop()).toBe(11)
  })

  test("shift gets element from the list", () => {
    const list = new LinkedList()
    list.push(17)
    expect(list.shift()).toBe(17)
  })

  test("shift gets first element from the list", () => {
    const list = new LinkedList()
    list.push(23)
    list.push(5)
    expect(list.shift()).toBe(23)
    expect(list.shift()).toBe(5)
  })

  test("unshift adds element at the start of the list", () => {
    const list = new LinkedList()
    list.unshift(23)
    list.unshift(5)
    expect(list.shift()).toBe(5)
    expect(list.shift()).toBe(23)
  })

  test("pop, push, shift, and unshift can be used in any order", () => {
    const list = new LinkedList()
    list.push(1)
    list.push(2)
    expect(list.pop()).toBe(2)

    list.push(3)
    expect(list.shift()).toBe(1)

    list.unshift(4)
    list.push(5)
    expect(list.shift()).toBe(4)
    expect(list.pop()).toBe(5)
    expect(list.shift()).toBe(3)
  })

  test("count an empty list", () => {
    const list = new LinkedList()
    expect(list.count()).toBe(0)
  })

  test("count a list with items", () => {
    const list = new LinkedList()
    list.push(37)
    list.push(1)
    expect(list.count()).toBe(2)
  })

  test("count is correct after mutation", () => {
    const list = new LinkedList()
    list.push(31)
    expect(list.count()).toBe(1)
    list.unshift(43)
    expect(list.count()).toBe(2)
    list.shift()
    expect(list.count()).toBe(1)
    list.pop()
    expect(list.count()).toBe(0)
  })

  test("popping to empty doesn't break the list", () => {
    const list = new LinkedList()
    list.push(41)
    list.push(59)
    list.pop()
    list.pop()

    list.push(47)
    expect(list.count()).toBe(1)
    expect(list.pop()).toBe(47)
  })

  test("shifting to empty doesn't break the list", () => {
    const list = new LinkedList()
    list.push(41)
    list.push(59)
    list.shift()
    list.shift()

    list.push(47)
    expect(list.count()).toBe(1)
    expect(list.shift()).toBe(47)
  })

  test("deletes the only element", () => {
    const list = new LinkedList()
    list.push(61)
    list.delete(61)
    expect(list.count()).toBe(0)
  })

  test("deletes the element with the specified value from the list", () => {
    const list = new LinkedList()
    list.push(71)
    list.push(83)
    list.push(79)

    list.delete(83)

    expect(list.count()).toBe(2)
    expect(list.pop()).toBe(79)
    expect(list.shift()).toBe(71)
  })

  test("deletes the element with the specified value from the list, re-assigns tail", () => {
    const list = new LinkedList()
    list.push(71)
    list.push(83)
    list.push(79)

    list.delete(83)

    expect(list.count()).toBe(2)
    expect(list.pop()).toBe(79)
    expect(list.pop()).toBe(71)
  })

  test("deletes the element with the specified value from the list, re-assigns head", () => {
    const list = new LinkedList()
    list.push(71)
    list.push(83)
    list.push(79)

    list.delete(83)

    expect(list.count()).toBe(2)
    expect(list.shift()).toBe(71)
    expect(list.shift()).toBe(79)
  })

  test("deletes the first of two elements", () => {
    const list = new LinkedList()
    list.push(97)
    list.push(101)

    list.delete(97)

    expect(list.count()).toBe(1)
    expect(list.pop()).toBe(101)
  })

  test("deletes the second of two elements", () => {
    const list = new LinkedList()
    list.push(97)
    list.push(101)

    list.delete(101)

    expect(list.count()).toBe(1)
    expect(list.pop()).toBe(97)
  })

  test("delete does not modify the list if the element is not found", () => {
    const list = new LinkedList()
    list.push(89)
    list.delete(103)

    expect(list.count()).toBe(1)
  })

  test("deletes only the first occurence", () => {
    const list = new LinkedList()
    list.push(73)
    list.push(9)
    list.push(9)
    list.push(107)

    list.delete(9)

    expect(list.count()).toBe(3)

    expect(list.pop()).toBe(107)
    expect(list.pop()).toBe(9)
    expect(list.pop()).toBe(73)
  })

  test("shift changes the tail", () => {
    const list = new LinkedList()
    list.push(73)
    list.shift()

    expect(list.tail.value).toBe(null)
    expect(list.head.value).toBe(null)
    expect(list.count_items).toBe(0)
  })

  test("unshift changes the head/tail", () => {
    const list = new LinkedList()

    list.unshift(6)

    expect(list.head.value).toBe(6)
    expect(list.tail.value).toBe(6)
    expect(list.count_items).toBe(1)
  })

  test("find/remove", () => {
    const list = new LinkedList()
    list.push(26)
    const n = list.find_value(26)
    list.remove_node(n)
    list.remove_node(n)
    list.remove_node(n)
    list.push(48)
    list.unshift(26)

    expect(list.count_items).toBe(2)
    expect(list.head.value).toBe(26)
    expect(list.tail.value).toBe(48)
  })

  test("delete the head", () => {
    const list = new LinkedList()
    list.push(26)
    list.push(48)
    list.delete(26)

    expect(list.head.value).toBe(48)
    expect(list.tail.value).toBe(48)
  })

  test("delete the tail", () => {
    const list = new LinkedList()
    list.push(26)
    list.push(48)
    list.delete(48)

    expect(list.head.value).toBe(26)
    expect(list.tail.value).toBe(26)
  })

  test("delete the head and tail ", () => {
    const list = new LinkedList()
    list.push(26)
    list.delete(26)

    expect(list.count_items).toBe(0)
  })

  xtest("insert at index 3 ", () => {
    const list = new LinkedList()
    list.push(26)
    list.push(46)
    list.push(66)
    list.push(261)
    list.insert_node(105, LINKED_LIST_BY_INDEX, 3)

    expect(list.count_items).toBe(5)
    expect(list.get_values()).toEqual([26, 46, 66, 105, 261])
  })

  xtest("insert at index 10 ", () => {
    const list = new LinkedList()
    list.push(26)
    list.push(46)
    list.push(66)
    list.push(261)
    list.insert_node(105, LINKED_LIST_BY_INDEX, 10)

    expect(list.count_items).toBe(5)
    expect(list.get_values()).toEqual([26, 46, 66, 261])
  })

  xtest("insert at index 0 ", () => {
    const list = new LinkedList()
    list.push(26)
    list.push(46)
    list.push(66)
    list.push(261)
    list.insert_node(105, LINKED_LIST_BY_INDEX, 0)

    expect(list.count_items).toBe(5)
    expect(list.get_values()).toEqual([105, 26, 46, 66, 261])
  })

  test("get_values ", () => {
    const list = new LinkedList()
    list.push(26)
    list.push(46)
    list.push(66)
    list.push(261)
    list.push(4)

    expect(list.get_values()).toEqual([26, 46, 66, 261, 4])
  })

  xtest("find node at index 3", () => {
    const list = new LinkedList()
    list.push(26)
    list.push(46)
    list.push(66)
    list.push(261)
    list.push(4)

    expect(list.find_node_at(3).value).toBe(261)
  })
})

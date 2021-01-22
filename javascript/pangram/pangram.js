
export const isPangram = (word) => {
  const chars =  new Set("abcdefghijklmopqrsuvwxyz")
  const toTest = new Set([...word].map(x=>x.toLowerCase()))
  return [...chars].map(x=> toTest.has(x)).every(x => x==true)
}

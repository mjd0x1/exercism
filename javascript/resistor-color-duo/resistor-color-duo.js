"use strict";
export const decodedValue = (resistors) => {
  const colors = {"black": 0, "brown": 1 , "red": 2, "orange":3,"yellow": 4, "green":5, "blue":6 , "violet":7, "grey":8, "white":9}
  const [first,second] = resistors.map(x => colors[x].toString())
  return parseInt(first + second)
};

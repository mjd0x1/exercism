export const hey = (message ) => {
  const isQuestion  = (x) => x.trim()[x.trim().length-1] == '?'
  const hasLetter  = (x) => [...x].map(x => (new Set("ABCDEFGHIJKLMNOPQRSTUVWXYZ").has(x))).some(x => x==true)
  const isShout = (x) => x.toUpperCase() == x && hasLetter(x)
  const isSilence = (x) => x.trim() == ""

  if (isSilence(message)) return 'Fine. Be that way!'
  if (isShout(message) && isQuestion(message)) return "Calm down, I know what I'm doing!"
  if (isShout(message)) return 'Whoa, chill out!'
  if (isQuestion(message)) return 'Sure.'
  return 'Whatever.'
};

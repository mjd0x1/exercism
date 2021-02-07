const isLeapYear = (n: number) => n % 4 ==0 && !(n%100 == 0 && n%400 > 0)

export default isLeapYear

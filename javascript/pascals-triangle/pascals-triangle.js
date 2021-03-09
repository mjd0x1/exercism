export const rows = (row) => {
   let m = [[1],[1,1]]
   if (row == 0) return []
   if (row == 1) return [[1]]
   if (row == 2) return m
  
   let a = [1,1]
   for (let i = 0 ; i < row - 2  ; i ++){
      const [,...rest] =  a.map((x,i) => a[i-1]+x)
      a = [1,...rest,1]
      m = [...m,a]
   }
   return m

};

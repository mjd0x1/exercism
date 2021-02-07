export class Matrix {
  constructor(inputString) {
    const getRow =  row => row.split(' ').map(t => parseInt(t))
    const getCol =  (matrix,colID) => matrix.map(x=>x[colID])
    const allRows = inputString.split('\n').map(x => getRow(x)) 
    this.matrixcols =  Object.keys(allRows[0]).map(x => getCol(allRows,x))
    this.matrixrows = allRows
  }

  get rows() {
    return this.matrixrows
  }

  get columns() {
    return this.matrixcols
  }
}

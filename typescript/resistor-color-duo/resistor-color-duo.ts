import { stringify } from "querystring";

export class ResistorColor {
 
  private LABELS = ["black","brown","red","orange","yellow","green","blue","violet","grey","white"];
  private first:string = ""
  private second:string = ""

  constructor(colors: string[]) {

    [this.first,this.second] = colors
    if (this.second==undefined) throw("At least two colors need to be present");
  }

  value = (): number => {
   
    return parseInt(String(this.LABELS.indexOf(this.first)) + String(this.LABELS.indexOf(this.second)))
  }
}

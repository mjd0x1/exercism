import { COPYFILE_FICLONE_FORCE } from "constants";
import { stringify } from "querystring";

export class ResistorColor {
 
  private readonly labels = ["black","brown","red","orange","yellow","green","blue","violet","grey","white"];
  private readonly colors: string[]

  constructor(colors: string[]) {

    this.colors = colors
    if (colors.length < 2 ) throw("At least two colors need to be present");
  }

  value = (): number =>  this.labels.indexOf(this.colors[0]) * 10 + this.labels.indexOf(this.colors[1])
  
}

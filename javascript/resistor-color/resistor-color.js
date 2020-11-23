"use strict";
export const colorCode = (x) => {
    return x == "Colors" ? COLORS  : COLORS.indexOf(x)
};

export const COLORS = ["black",
"brown",
"red",
"orange",
"yellow",
"green",
"blue",
"violet",
"grey",
"white"];

"use strict";

const roundMeTwoDP  =  (x) => Math.round(x * 100.0)/100.0

export const age = (planet,seconds) => {
    const planets = {mercury: 0.2408467,
               venus:  0.61519726,
              earth:  1.0,
              mars: 1.8808158,
              jupiter:11.862615,
              saturn: 29.447498,
              uranus: 84.016846,
              neptune: 164.79132,
    }
    const secondsToYears = 1.0 / (3600.0 * 24.0 * (3.0 * 365.0 + 366.0)/4.0)
    
    return roundMeTwoDP(seconds *  secondsToYears *  1.0/planets[planet])

};

class Clock:

    def twentyfourh_clock(self,hour,minute):
        mins = minute % 60
        hours_minute = minute // 60
        return ((hour + hours_minute) % 24,mins)


    def __init__(self, hour, minute):
        self.hours, self.minutes   = self.twentyfourh_clock(hour,minute)
        
    def __repr__(self):
        return f"{self.hours:02d}" + ":" + f"{self.minutes:02d}"

    def __eq__(self, other):
        return self.hours  == other.hours and self.minutes == other.minutes

    def __add__(self, minutes):
        self.hours, self.minutes   = self.twentyfourh_clock(self.hours,self.minutes + minutes) 
        return self

    def __sub__(self, minutes):
        return self.__add__(-minutes)

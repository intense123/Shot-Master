import shot

class PracticeSession:
    shots = []
    fedbackMessages = []

    def __init__(self, dateAndTime, player) -> None:
        self.__dateAndTime = dateAndTime
        self.__player = player

    def conductASession(self):
        while(1):
            shot = shot.Shot()
            shot.conductAShot()
            self.shots.append(shot)

            # break when session ends

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

    def __shotTypeCount(self, session_summary, shot):
        if shot.get_type() == 'cut':
            session_summary['numberOfCutShots'] += 1
        elif shot.get_type() == 'pull':
            session_summary['numberOfPullShots'] += 1
        elif shot.get_type() == 'straitDrive':
            session_summary['numberOfStraitDriveShots'] += 1
        elif shot.get_type() == 'coverDrive':
            session_summary['numberOfCovelDriveShots'] += 1
        elif shot.get_type() == 'slog':
            session_summary['numberOfSlogShots'] += 1

        return session_summary
    
    def __summarizeImpactSpeed(self, session_summary):
        session_summary['avgImpactSepped'] = 0.0
        session_summary['minImpactSepped'] = 1000000.0
        session_summary['maxImpactSepped'] = 0.0

        for shot in self.shots:
            impactSpeed = shot.get_ImapctSpeed()
            session_summary['avgImpactSepped'] += impactSpeed
            if impactSpeed < session_summary['minImpactSepped']:
                session_summary['minImpactSepped'] = impactSpeed
            if impactSpeed > session_summary['maxImpactSepped']:
                session_summary['maxImpactSepped'] = impactSpeed

        session_summary['avgImpactSepped'] /= len(self.shots)

        return session_summary
    
    def __summarizeBackliftAngle(self, session_summary):
        session_summary['avgBackliftAngle'] = 0.0
        session_summary['minBackliftAngle'] = 1000000.0
        session_summary['maxBackliftAngle'] = 0.0

        for shot in self.shots:
            backliftAngle = shot.get_backlift_angle()
            session_summary['avgBackliftAngle'] += backliftAngle
            if backliftAngle < session_summary['minBackliftAngle']:
                session_summary['minBackliftAngle'] = backliftAngle
            if backliftAngle > session_summary['maxBackliftAngle']:
                session_summary['maxBackliftAngle'] = backliftAngle

        session_summary['avgBackliftAngle'] /= len(self.shots)

        return session_summary
    
    def __summarizeDownswingAngle(self, session_summary):
        session_summary['avgDownswingAngle'] = 0.0
        session_summary['minDownswingAngle'] = 1000000.0
        session_summary['maxDownswingAngle'] = 0.0

        for shot in self.shots:
            downswingAngle = shot.get_downswing_angle()
            session_summary['avgDownswingAngle'] += downswingAngle
            if downswingAngle < session_summary['minDownswingAngle']:
                session_summary['minDownswingAngle'] = downswingAngle
            if downswingAngle > session_summary['maxDownswingAngle']:
                session_summary['maxDownswingAngle'] = downswingAngle

        session_summary['avgDownswingAngle'] /= len(self.shots)

        return session_summary

    def __summarizeBatFaceAngle(self, session_summary):
        session_summary['avgBatFaceAngle'] = 0.0
        session_summary['minBatFaceAngle'] = 1000000.0
        session_summary['maxBatFaceAngle'] = 0.0

        for shot in self.shots:
            batFaceAngle = shot.get_bat_face_angle()
            session_summary['avgBatFaceAngle'] += batFaceAngle
            if batFaceAngle < session_summary['minBatFaceAngle']:
                session_summary['minBatFaceAngle'] = batFaceAngle
            if batFaceAngle > session_summary['maxBatFaceAngle']:
                session_summary['maxBatFaceAngle'] = batFaceAngle

        session_summary['avgBatFaceAngle'] /= len(self.shots)

        return session_summary

    def __summarizeBackliftDirection(self, session_summary):
        backlift_direction_counts = {}
        for shot in self.shots:
            backlift_direction = shot.get_backlift_direction()
            if backlift_direction in backlift_direction_counts:
                backlift_direction_counts[backlift_direction] += 1
            else:
                backlift_direction_counts[backlift_direction] = 1

        session_summary['backliftDirectionCounts'] = backlift_direction_counts

        return session_summary


    def summarizeSessionData(self):
        session_summary = {}
        
        for shot in self.shots:
            session_summary = self.__shotTypeCount(session_summary, shot)

        session_summary = self.__summarizeImpactSpeed(session_summary)
        session_summary = self.__summarizeBackliftAngle(session_summary)
        session_summary = self.__summarizeDownswingAngle(session_summary)
        session_summary = self.__summarizeBatFaceAngle(session_summary)
        session_summary = self.__summarizeBackliftDirection(session_summary)

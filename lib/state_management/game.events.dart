abstract class GameEvents {}

class GameStartedEvent extends GameEvents {}

class GameEndedEvent extends GameEvents {}

class UpdateGameBoardEvent extends GameEvents {}

class UpdateNextWidgetEvent extends GameEvents {}

class UpdateScoreWidgetEvent extends GameEvents {}

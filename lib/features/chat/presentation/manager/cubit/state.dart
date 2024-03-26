abstract class ChatStates {}

class ChatInitialState extends ChatStates {}
class GetModelsLoadingState extends ChatStates {}
class GetModelsSuccessState extends ChatStates {}
class GetModelsErrorState extends ChatStates {}


class SendMessageLoadingState extends ChatStates {}
class SendMessageSuccessState extends ChatStates {}
class SendMessageErrorState extends ChatStates {}
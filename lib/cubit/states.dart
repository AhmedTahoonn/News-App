abstract class NewsAppStates
{

}
class NewsAppInitialState extends NewsAppStates
{

}
class NewsAppChangeBottomNavigationBarState extends NewsAppStates
{

}
class NewsAppGetHealthSuccessState extends NewsAppStates
{

}
class NewsAppGetHealthErrorState extends NewsAppStates
{
 final String error;

  NewsAppGetHealthErrorState(this.error);
}
class NewsAppHealthLoadingsState extends NewsAppStates
{

}
class NewsAppGetSportsSuccessState extends NewsAppStates
{

}
class NewsAppGetSportsErrorState extends NewsAppStates
{
final String error;

NewsAppGetSportsErrorState(this.error);
}
class NewsAppGetSportsLoadingState extends NewsAppStates
{

}
class NewsAppGetScienceSuccessState extends NewsAppStates
{

}
class NewsAppGetScienceErrorState extends NewsAppStates
{
 final String error;

 NewsAppGetScienceErrorState(this.error);
}
class NewsAppGetScienceLoadingState extends NewsAppStates
{

}
class NewsAppGetBusinessSuccessState extends NewsAppStates
{

}
class NewsAppGetBusinessErrorState extends NewsAppStates
{
 final String error;

 NewsAppGetBusinessErrorState(this.error);
}
class NewsAppBusinessLoadingsState extends NewsAppStates
{

}

class NewsAppGetTechnologySuccessState extends NewsAppStates
{

}
class NewsAppGetTechnologyErrorState extends NewsAppStates
{
 final String error;

 NewsAppGetTechnologyErrorState(this.error);
}
class NewsAppTechnologyLoadingsState extends NewsAppStates
{

}
class SearchSuccessState extends NewsAppStates
{

}
class SearchErrorState extends NewsAppStates
{
 final String error;

 SearchErrorState(this.error);
}
class SearchLoadingsState extends NewsAppStates
{

}
class AppModeChangeState extends NewsAppStates
{

}
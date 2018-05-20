%%%-------------------------------------------------------------------
%% @doc greetings top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(greetings_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).

%%====================================================================
%% API functions
%%====================================================================

start_link() ->
    application:ensure_all_started(logger),

    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%%====================================================================
%% Supervisor callbacks
%%====================================================================

%% Child :: {Id,StartFunc,Restart,Shutdown,Type,Modules}
init([]) ->
    {ok, { {one_for_all, 0, 1}, [
      #{
        id => cleartext,
        start => {'Elixir.Ace.HTTP.Service', start_link, [{greetings_www, #{}}, [{port, 8080}, {cleartext, true}]]},
        type => supervisor
      }
    ]} }.

%%====================================================================
%% Internal functions
%%====================================================================

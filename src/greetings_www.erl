-module(greetings_www).

-behaviour('Elixir.Raxx.Server').

-export ([
  handle_head/2,
  handle_data/2,
  handle_tail/2,
  handle_request/2,
  handle_info/2
]).

handle_request(_Request, _State) ->
  Response = raxx:response(ok),
  raxx:set_body(Response, <<"Hello, World">>).

handle_info(Info, State) ->
  error_logger:info_msg("~p~n", [Info]),
  {[], State}.

handle_head(Request0 = #{body := false}, State) ->
  Request1 = Request0#{body := <<"">>},
  handle_request(Request1, State);
handle_head(Request = #{body := true}, State) ->
  {[], {Request, <<"">>, State}}.

handle_data(Data, {Request, Buffer, State}) ->
  {[], {Request, <<Buffer/binary, Data/binary>>, State}}.

handle_tail([], {Request0, Body, State}) ->
  Request1 = Request0#{body := Body},
  handle_request(Request1, State).

-module(greetings_www).

-behaviour('Elixir.Raxx.Server').

-export ([handle_head/2]).

handle_head(_Request, _Config) ->
  Response = 'Elixir.Raxx':response(ok),
  'Elixir.Raxx':set_body(Response, <<"Hello, World">>).

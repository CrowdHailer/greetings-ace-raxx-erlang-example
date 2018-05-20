Greetings
=====

### Simple greetings application to showcase developing web services with [Ace](https://github.com/CrowdHailer/Ace) and [Raxx](https://github.com/CrowdHailer/raxx).

**Ace is a featherweight toolkit for developing web applications in Elixir. Similar to Sinatra for Ruby and Flask for Python.**

- [Ace on Hex](https://hex.pm/packages/ace)
- [Documentation for Ace](https://hexdocs.pm/ace)
- [Discuss on slack](https://elixir-lang.slack.com/messages/C56H3TBH8/)

## Run

The greetings app in this project is started automatically with the shell.
Therefore to run in development use

    $ rebar3 shell

Then visit [localhost:8080](http://localhost:8080).

## Comments

- At the moment the rebar3 plugin for Elixir does not do a good job of managing dependencies. This is manifest twofold.
  1. Each dependency has to be declared individually but the should be inferrable as dependencies of Ace.
  2. running `application:ensure_all_started(ace)` is a problem because it tries to start even development dependencies such as ex_doc.

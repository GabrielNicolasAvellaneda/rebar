%% -*- erlang-indent-level: 4;indent-tabs-mode: nil -*-
%% ex: ts=4 sw=4 et
%% -------------------------------------------------------------------
%%
%% rebar: Erlang Build Tools
%%
%% Copyright (c) 2015 Mark Anderson <mark@chef.io>
%%
%% Permission is hereby granted, free of charge, to any person obtaining a copy
%% of this software and associated documentation files (the "Software"), to deal
%% in the Software without restriction, including without limitation the rights
%% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
%% copies of the Software, and to permit persons to whom the Software is
%% furnished to do so, subject to the following conditions:
%%
%% The above copyright notice and this permission notice shall be included in
%% all copies or substantial portions of the Software.
%%
%% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
%% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
%% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
%% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
%% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
%% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
%% THE SOFTWARE.
%% -------------------------------------------------------------------
%% @author Mark Anderson <mark@chef.io>
%% @doc Tests functionality of rebar_utils module.
%% @copyright 2015 Mark Anderson
%% -------------------------------------------------------------------
-module(rebar_utils_tests).

-compile(export_all).

-include_lib("eunit/include/eunit.hrl").

expand_env_variable_test_() ->
    [{"Ensure that variable expansion handles nonwhitespace",
      fun() ->
              Test = "$V $V/ $Vw",
              ?assertEqual("Val Val/ $Vw",
                           rebar_utils:expand_env_variable(Test, "V", "Val") )
      end},
     {"Ensure that variable expansion with braces works",
      fun() ->
              Test = "${V} ${V}/ ${V}w ${Vw}",
              ?assertEqual("Val Val/ Valw ${Vw}",
                           rebar_utils:expand_env_variable(Test, "V", "Val") )
      end}].


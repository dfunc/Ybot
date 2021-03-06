%%%----------------------------------------------------------------------
%%% File    : ybot_utils.erl
%%% Author  : 0xAX <anotherworldofworld@gmail.com>
%%% Purpose : Ybot utils functions
%%%----------------------------------------------------------------------
-module(ybot_utils).

-export([get_all_files/1,
         split_at_end/2]).

%% @doc get all files from directory
-spec get_all_files(Dir :: string()) -> [string()].
get_all_files(Dir) ->
    FindFiles = fun(F, Acc) -> [F | Acc] end,
    filelib:fold_files(Dir, ".*", true, FindFiles, []).

%% @doc Take 2 string. Find SplitSnippet in String
%%      and return all string content which after SplitSnippet in string.
%% example:
%%
%% > estring:split_at_end("Hello, my name is 0xAX", "name").
%%   >> " is 0xAX"
%%
-spec split_at_end(String :: string(), SplitSnippet :: string()) -> string().
split_at_end(String, SplitSnippet) ->
    StartPosition = string:str(String, SplitSnippet),
    SplitSnippetLength = length(SplitSnippet),
    string:substr(String, StartPosition + SplitSnippetLength).

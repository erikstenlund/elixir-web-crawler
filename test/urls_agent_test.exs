defmodule UrlsAgentTest do
  use ExUnit.Case

  import UrlsAgent

  doctest UrlsAgent

  test "add url and get from agent" do
    {:ok, pid} = start_link
    assert add_url("www.foo.com", pid) == :added
    assert add_url("www.foo.com", pid) == :duplicate
    assert get_url(pid) == "www.foo.com"
    assert get_url(pid) == nil 
  end
end

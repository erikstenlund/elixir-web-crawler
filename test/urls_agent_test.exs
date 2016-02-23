defmodule UrlsAgentTest do
  use ExUnit.Case

  import UrlsAgent

  doctest UrlsAgent

  setup_all do
    start_link
    :ok
  end

  test "add url" do
    assert add_url("www.foo.com") == :added
    assert add_url("www.foo.com") == :duplicate
  end

  test "get url" do
    assert get_urls == ["www.foo.com"]
  end

end

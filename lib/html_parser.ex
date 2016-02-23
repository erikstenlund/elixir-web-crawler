defmodule HTMLParser do
  # ToDo:
  # Fix the filter to filter urls in a smarter way.

  def parse(url) do
    HTTPotion.start
    response = HTTPotion.get(url, [follow_redirects: true])
    
    response.body
    |> Floki.find("a")
    |> Floki.attribute("href")
    |> Enum.filter(fn(url) -> String.contains?(url, "http://") end)
  end
end 

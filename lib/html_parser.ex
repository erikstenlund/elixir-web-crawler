defmodule HTMLParser do
  # ToDo:
  # Fix the filter to filter urls in a smarter way.

  def parse(url, domain) do
    HTTPotion.start
    response = HTTPotion.get(url, [follow_redirects: true])
    condition = StupidFilterCondition.init(domain)

    response.body
    |> Floki.find("a")
    |> Floki.attribute("href")
    |> Enum.filter(condition)
  end
end 

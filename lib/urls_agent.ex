defmodule UrlsAgent do
  import List
  #ToDo:
  #Order the urls so i may be printed as a tree.

  def start_link do
    Agent.start_link(fn -> [] end, name: __MODULE__)
  end

  def get_urls do
    Agent.get(__MODULE__, fn(url_list) -> url_list end)
  end

  def add_url(url) do
    Agent.get_and_update(__MODULE__, fn(url_list) -> 
      case url_in_list?(url_list, url) do 
        true -> {:duplicate, url_list}
        false -> {:added, url_list ++ [url]}
      end
    end)
  end

  defp url_in_list?(url_list, url) do
    foldl(url_list, false, fn (x, contains) -> 
      if x == url do
        true
      else
        false
      end
    end)
  end

end



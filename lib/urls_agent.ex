defmodule UrlsAgent do
  import List

  def start_link do
    Agent.start_link(fn -> [] end, name: __MODULE__)
  end
  def get_url(pid) do
    Agent.get_and_update(pid, fn url_list -> 
    { first(url_list), delete_at(url_list, 0) }
    end )  
  end
  def add_url(url, pid) do
    Agent.get_and_update(pid, fn url_list -> 
      if urlInList(url_list, url) do 
         {:duplicate, url_list}
      else
        {:added, url_list ++ [url]}
      end
    end )
  end
  defp urlInList(url_list, url) do
    foldl(url_list, false, fn (x, contains) -> 
      if x == url do
        true
      else
        false
      end
    end )
  end

end



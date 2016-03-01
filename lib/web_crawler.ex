defmodule WebCrawler do

  def crawl(url) do
    UrlsAgent.start_link
    pid = Task.async(__MODULE__, :crawlUrl, [url, url])
    Task.await(pid, :infinity)
    UrlsAgent.get_urls
  end

  def crawlUrl(url, domain) do
    urls = HTMLParser.parse(url, domain)
    tasks = []
    
    Enum.map(urls, fn(url) ->
      url_list = UrlsAgent.get_urls
      unless Enum.member?(url_list, url) do
        tasks ++ [Task.async(__MODULE__, :crawlUrl, [url, domain])]
        UrlsAgent.add_url(url) 
      end
    end)

    Enum.map(tasks, fn(task) ->
      Task.await(task, :infinity)
    end)
  end
end

defmodule WebCrawler do
  def crawl(url) do
    {:ok, pid} = UrlsAgent.start_link
    pid_1 = spawn(__MODULE__, :crawlUrl, ["www.foo.com", pid])
    pid_2 = spawn(__MODULE__, :crawlUrl, ["www.bar.com", pid])
    pid_3 = spawn(__MODULE__, :crawlUrl, ["www.foo.com", pid])
    pid_4 = spawn(__MODULE__, :crawlUrl, ["www.blinkenlights.nl", pid])
  end

  def crawlUrl(url, pid) do
    UrlsAgent.add_url url, pid
  end
end

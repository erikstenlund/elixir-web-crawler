# WebCrawler

Simple web crawler written in Elixir. My first Elixir program.

## Installation

  1. Add web_crawler to your list of dependencies in mix.exs:

        def deps do
          [{:web_crawler, "~> 0.0.1"}]
        end

  2. Ensure web_crawler is started before your application:

        def application do
          [applications: [:web_crawler]]
        end

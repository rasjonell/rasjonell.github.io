defmodule Blog.Rss do
    @moduledoc """
  A Serum plugin that create a sitemap so that the search engine can index posts.

  ## Using the Plugin

      # serum.exs:
      %{
        server_root: "https://example.io",
        plugins: [
          Rss
        ]
      }
  """

  require EEx
  alias Serum.File
  alias Serum.GlobalBindings

  @behaviour Serum.Plugin

  @title "Rasjonell's Blog"
  @url "https://www.rasjonell.tech"
  @blog_desc "Random rants about technology"

  @impl true
  def name, do: "RSS Feed Generator"

  @impl true
  def version, do: "0.1.0"

  @impl true
  def elixir, do: ">= 1.7.0"

  @impl true
  def serum, do: ">= 1.2.0"

  @impl true
  def description do
    "Generates an RSS feed for /posts"
  end

  @impl true
  def implements do
    [build_succeeded: 3]
  end

  @impl true
  def build_succeeded(_src, dest, _args) do
    rss_feed = :all_posts
      |> GlobalBindings.get()
      |> build_feed()

    dest
    |> create_file(rss_feed)
    |> File.write()

    :ok
  end

  defp build_feed(posts) do
    items = posts |> Enum.map(&__MODULE__.generate_item_from_post/1)
    feed(channel(), items)
  end

  defp create_file(dest, rss_feed) do
    %File{
      out_data: rss_feed,
      dest: Path.join(dest, "rss.xml")
    }
  end

  def generate_item_from_post(post) do
    # maybe read the file and render html as the desc?
    title = post.title
    desc = post.preview
    link = "#{@url}#{post.url}"

    item(title, desc, link)
  end

  defp feed(channel, items) do
    """
    <?xml version="1.0" encoding="utf-8"?>
    <rss version="2.0">
    <channel>
    #{channel}#{Enum.join items, ""}</channel>
    </rss>
    """
  end

  defp item(title, desc, link) do
    """
    <item>
      <title>#{title}</title>
      <description><![CDATA[#{desc}]]></description>
      <pubDate>#{current_date()}</pubDate>
      <link>#{link}</link>
      <guid>#{link}</guid>
    </item>
    """
  end

  defp channel do
    """
      <title>#{@title}</title>
      <link>#{@url}</link>
      <description>#{@blog_desc}</description>
      <lastBuildDate>#{current_date()}</lastBuildDate>
      <language>en-us</language>
    """
  end

  defp current_date do
    {:ok, current_date} = Timex.now
      |> Timex.format("{RFC822}")
    
    current_date
  end
end

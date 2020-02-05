%{
  site_name: "{:ok, :rasjonell}",
  site_description: "Yinging and yanging noided",
  date_format: "{WDfull}, {D} {Mshort} {YYYY}",
  base_url: "/",
  author: "rasjonell",
  author_email: "me@rasjonell.tech",
  plugins: [
    Blog.ReadTime,
    Serum.Plugins.TableOfContents,
    {Serum.Plugins.LiveReloader, only: :dev}
  ],
  theme: Serum.Themes.Essence,
  list_title_all: "Posts",
  posts_per_page: 100,
  preview_length: 253
}

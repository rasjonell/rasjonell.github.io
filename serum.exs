%{
  site_name: "Rasjonell Tech",
  site_description: "My random thoughts",
  date_format: "{WDfull}, {D} {Mshort} {YYYY}",
  base_url: "/",
  author: "rasjonell",
  author_email: "me@rasjonell.tech",
  plugins: [
    Serum.Plugins.TableOfContents,
    {Serum.Plugins.LiveReloader, only: :dev}
  ],
  theme: Serum.Themes.Essence,
  list_title_all: "Posts",
  posts_per_page: 100,
  preview_length: 253
}

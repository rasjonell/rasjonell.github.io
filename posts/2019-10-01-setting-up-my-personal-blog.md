---
title: Setting Up My Personal Blog
date: 2019-10-01
tags: Elixir, Serum
template: doc
---

<serum-toc start="2" end="4" />

## Getting the domain

Just like with any other side project of yours, the first thing you do is getting a domain.

As a part of my [GitHub Education Pack](https://education.github.com/) I got a number of options for free domain registration. As I had previously used the services of [GoDaddy](https://godaddy.com) and [NameCheap](http://namecheap.com) I decided to go with [GetTech](https://get.tech).

Fortunately `rasjonell.tech` was not taken and with a couple of clicks the domain was mine.
Apart from the fact the UI/UX for the Admin Area is horrendous, GetTech provides a number of cool _free_ services. These include:

- Email Service (with OX App Suite Webmail)
- Domain Forwarding
- DNS Management

## Creating the blog

I didn't have time to create something of my own so I had to look for help from the community. There are a lot(actually more then necessary) of static site generators. There was no way I was going to use any JS "powered" tool so I narrowed down my options to only three SSGs:

- [Obelisk](https://github.com/BennyHallett/obelisk)
- [SSG by Roman Zolotarev](https://www.romanzolotarev.com/ssg.html)
- [Serum](https://github.com/Dalgona/Serum)

As a huge fan of [Elixir](https://elixir-lang.org) I looked for projects written in Elixir to possibly contribute and have a rest from the JavaScripts I have to deal with every day. Obelisk was the first thing I found, however going to the issues tab on GitHub I found this:

![Obelisk Issue](/media/obelisk_issue.png)

So I had to make a choice between SSG and Serum. Writing this I figured out that there is no rational(or should I say _rasjonell_ 🤔) reason for choosing any other software instead of SSG but my love for declarative programming and good ol' memories of ruby-ish syntax made me choose Serum.

Setting up the project was as straightforward as it could be. You download the software, compile it and there you go. I also installed a custom theme, for which I had to change a single line in my config file(I'm thinking of forking this theme to add a dark mode). Refer to the [official guide](https://dalgona.github.io/Serum/getting-started.html) for more detailed introduction.

## Hosting the blog

Unlike my experience with choosing a static site generator, hosting was an easy and obvious decision. I used to use a number of hosting services and was mostly happy with [Zeit's](https://zeit.co) "0-config deployments", until I actually needed to config my deployment. That's when I faced an issue, didn't care enough to investigate it and moved to [Netlify](https://www.netlify.com/). I just magically lived happily ever after.

Serum produces a static HTML/CSS website so you can just `netlify deploy site`. That's it. Problem solved.

## Automating the blog

I already had a personal website hosted on Github so I just abandoned it and force pushed this newer, better one. But I didn't want to manually build and the deploy the site every time I made changes so I set up git hooks with [overcommit](https://github.com/sds/overcommit) to run `mix serum.build` before pushing the code.

After that I configured my Netlify(❤️) project to automatically build from the master branch of my repo.

All of this is already cool enough and I really enjoyed making it. But I was thinking of making a local CMS-like environment where you just have a rich text editor and a couple of cool looking buttons for publishing or perhaps saving your blog-post as draft. However I couldn't justify this need and didn't make it. If you think it'll be cool to have such a tool or have any ideas or suggestions contact me on [Mastodon](https://xn--69aa8bzb.xn--y9a3aq/@gurgen) or just email me@rasjonell.tech

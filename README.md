# BoldportClub Community Site Prototype

This is a quick prototype of a possible community site for the Boldport Club community.


## Ideas and Motivation

| what people like to share   | how they share |
|-----------------------------|----------------|
| videos/pictures/write-ups of their project builds and modifications | social media, blog posts |
| guides and supporting documentation for projects | blogs, github |
| project ideas               | slack          |

All this great information tends to be quite ephemeral, while the official boldport project pages are quite static, posing some challenges:

* as a member, how can I find all the useful and interesting information about a boldport club project?
* as a non-member, how can I get a better sense of what the boldport club is about? And what I could I expect to be doing if I joined?


Proposition: there's a missing a **community site** to supplement the existing bolport pages - a central archive of information shared by members that is the *goto* destination for:
  - members starting a project build, to get inspired and informed by what others have done
  - members to share their builds, guides and pictures/videos in a permanent repository
  - a source of links for posting on other platforms
  - referring prospective members and say "look here"

Some key principles to make this a success:

* an open platform (but with gatekeepers)
* make collaboration easy (many hands)
* public (something to point to)
* dynamic (followable for non-members)
* arms-length from official boldport channels (so we don't need to worry about appearing to speak for Saar)
* simple and unencumbered technology, so people with better ideas can come and make it better


## A Jekyll Prototype

There are many ways to do this, including simply taking advantage of commercial platforms like a Facebook Group,
or just mining hashtags. However I suspect that is antithetical to the views of many in the Boldport realm,
and a central community site will complement other social forums, even if just as a source of link-bait.

So a fairly random decision: could we use a Jekyll-based site hosted on GitHub for such a thing?
This repo is a quick prototype to see how well it works.

Why Jekyll & GitHub?

* [GitHub Pages](https://pages.github.com/) is a great way of hosting static sites for free, while also maintaining and sharing the site soruce from a GitHub repository
* [Jekyll](https://jekyllrb.com/) is the static-site framework integrated in GitHub Pages (we could use other frameworks, but they'd all need offline generation)
* it seems pretty easy and popular amongst the more technically-inclined for maintaining blogs and project pages


How does it work?

* it's all based on posts (added in the [_posts](./_posts) folder )
* categories, tags and other front-matter will add the post to the general feed, and also feature it on project pages as appropriate


### Ideas on: How to contribute

Right now:

* pull request / commit - for the GitHub-savvy
* create an issue - for friends of GitHub
* submit a link & metadata - a form that gets mailed to a maintainer

In future, there could be more automated ways of contributing:

* harvesting tweets, instagram posts
* mirror posts from the #to-share slack channel


### Ideas on: How the site is used

Visitors:

* arrive via a link shared on social media
* arrive from a google search
* subscribe to the news feed
* browse from the landing page


### Ideas on: Content available on the site

The basics:

* landing page:
  - recent posts (blog style)
  - links to project pages
  - social links
  - about
* project pages:
  - about text and key project links
  - recent project posts (posts: blog style)
  - project builds (posts: article listing)
  - contributed guides (posts: article listing)
  - project gallery (posts: image & video gallery)


## TODO

* move to a final repo to something like https://github.com/boldport/boldportclub-community
* improve the styling. The site currently only has absolutely minimal tweaks over a basic [bootstrap layout](http://getbootstrap.com/).
* favicons
* enable the content submission form (formspree.io)
* configure disqus (tardate used for testing)
* add a script to add new project pages
* tidy and complete the text content on the site
* enable google tag manager?
* is sitemap working?


## Up And Running

To run/develop the site locally, you first need a working ruby environment. Then:

```
$ gem install bundler
$ bundle install
$ bundle exec jekyll serve
```

## Adding a Post

Just create a new markdown or html file in `_posts` with a standard name `YYYY-MM-DD-your-title.extension`.
See the [template.md](./_drafts/template.md) for information on how to use front-matter etc.

A script is available to simplify new post creation. Just run:

```
$ ruby bin/new_post.rb
```

## Development Resources

* [Jekyll](https://jekyllrb.com/)
* [GitHub Pages](https://pages.github.com/)
* [Bootstrap](http://getbootstrap.com/)

---
layout:      post
title:       "Your Post Title"
date:        2017-01-05 20:15:00 +0800
source_url:  # link to original ref/source (if any) of this post
author_name: Contributor Name
author_url:  # link to contributor page (optional)

# If you include summary text here, it will be used in the post meta description instead of an excerpt from the post body
#summary: text

# If the post concerns a project, set the project name as the category:
category: p28-3x7

# If the post relates to many projects, set the project names as a categories array:
#categories:
#- p01-pease
#- p02-emergency
#- p03-cordwood
#- p04-thelady
#- p05-tap
#- p06-thecuttle
#- p07-touchy
#- p08-ligemdio
#- p09-pissoff
#- p10-thegent
#- p11-thematrix
#- p12-juice
#- p13-cordwood-too
#- p14-stringy
#- p15-spoolt
#- p16-ixpando
#- p17-mostap
#- p18-themonarch
#- p19-binco
#- p20-ananas
#- p21-widlar
#- p22-whiteboard
#- p23-pips
#- p24-conehead
#- p25-cordwood-three
#- p26-lite2sound-bc
#- p27-dreamer
#- p28-3x7
#- p29-krell
#- p30-respot
#- p99-theconqueror
#- qsop-breakout

# If the post features a youtube video, set the ID here:
#youtubeid: gXsVeNLuWLw

# If the post is mirroring a tweet, set the ID here:
#twitterid: "842187744625496064"

# Tags are used to include the post in specific project collections:
#tags:
#- builds # includes the post in the project "Community Builds" listing
#- resources # includes the post in the project "Resources" listing

# The images collection is used to add images to the project gallery:
#images:
#- http://image.url
#- http://another_image.url

hero_image_url: # fully-qualified url to the "hero" image, used in twitter cards for example

# The videos collection is used to add videos to the project gallery (currently only mp4):
#videos:
#- https://video.twimg.com/tweet_video/C_8OYj_V0AAtg5I.mp4

---

Write your post body here. The first paragraph will be used as the excerpt if
the front-matter does not include a summary element.

Posts may be written with markdown (file extension: md or markdown)
or as html (file extension: html).

You can include YouTube embeds like this:
{% include youtube-embed.html id="youtube-id" %}

You can include Video (mp4) embeds like this:
{% include video-embed.html url="url to video" %}

You can include a flickr album like this:
{% include flickr-embed.html id="album-id" %}

You can include twitter embeds like this:
{% include twitter-embed.html id="tweet-id" %}

If you have set the images collection in front-matter, you can use it to include images in
your post like this (markdown example):
![ my first image]({{ page.images[0] }})

Note that the standard post template will automatically attach a gallery of
images from the images collection in front-matter.

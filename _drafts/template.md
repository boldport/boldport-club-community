---
layout:      post
title:       "Your Post Title"
date:        2017-01-05 20:15:00 +0800
author_name: Contributor Name
#author_url: link to contributor page (optional)

# If you include summary text here, it will be used for display
# in the post listing instead of an excerpt from the post body
#summary: text

# If the post concerns a project, set the project name as the category:
#category: p11-thematrix

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
#- p99-conqueror
#- qsop-breakout

# If the post features a youtube video, set the ID here:
#youtubeid: gXsVeNLuWLw

# Tags are used to include the post in specific project collections:
#tags:
#- builds # includes the project in the "Community Builds" listing
#- guides # includes the project in the "Guides" listing

# The images collection is used to add images to the project gallery:
#images:
#- http://image.url
#- http://another_image.url
---

Write your post body here. The first paragraph will be used as the excerpt if
the front-matter does not include a summary element.

Posts may be written with markdown (file extension: md or markdown)
or as html (file extension: html).

You can include YouTube embeds like this:
{% include youtube-embed.html id=page.youtubeid %}

If you have set the images collection in front-matter, you can use it to include images in
your post like this (markdown example):
![ my first image]({{ page.images[0] }})

---
layout:      post
title:       "Playing with a Pure Data model of the Conehead Chirp"
date:        "2018-08-12 12:19:10 +0800"
source_url:  "https://leap.tardate.com/BoldportClub/conehead"
author_name: "@tardate"
author_url:  "https://twitter.com/tardate"

# If you include summary text here, it will be used in the post meta description instead of an excerpt from the post body
#summary: text

# If the post concerns a project, set the project name as the category:
category: p24-conehead

# If the post features a youtube video, set the ID here:
youtubeid: "-YGf8M41W-s"

# If the post is mirroring a tweet, set the ID here:
#twitterid: "842187744625496064"

# Tags are used to include the post in specific project collections:
tags:
#- builds # includes the post in the project "Community Builds" listing
- resources # includes the post in the project "Resources" listing

# The images collection is used to add images to the project gallery:
#images:
#- http://image.url
#- http://another_image.url

hero_image_url: # fully-qualified url to the "hero" image, used in twitter cards for example

# The videos collection is used to add videos to the project gallery (currently only mp4):
#videos:
#- https://video.twimg.com/tweet_video/C_8OYj_V0AAtg5I.mp4

---

Boldport projects never fail to inspire some new learning. In the case it introduced me to
[Pure Data](https://puredata.info/) - a pretty amazing open source visual programming language for multimedia.
I reproduced the [chirp.pd](https://leap.tardate.com/BoldportClub/conehead/chirp.pd) model
and added a few more controls to make it easier to play around with.
Here's a quick example of the sounds produced with different settings:
{% include youtube-embed.html id="-YGf8M41W-s" %}

Settings that simulate the Conehead chirp:

* 428 gate frequency
* 8000 carrier frequency
* 110 modulation frequency
* 714 modulation amount

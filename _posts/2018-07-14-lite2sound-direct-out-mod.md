---
layout:      post
title:       "lite2sound direct out mod"
date:        "2018-07-14 16:04:46 +0800"
source_url:  # link to original ref/source (if any) of this post
author_name: "Rare Waves LLC USA"
author_url:  # link to contributor page (optional)

# If you include summary text here, it will be used in the post meta description instead of an excerpt from the post body
#summary: text

# If the post concerns a project, set the project name as the category:
category: p26-lite2sound-bc

# If the post features a youtube video, set the ID here:
#youtubeid: gXsVeNLuWLw

# If the post is mirroring a tweet, set the ID here:
#twitterid: "842187744625496064"

# Tags are used to include the post in specific project collections:
tags:
#- builds # includes the post in the project "Community Builds" listing
- resources # includes the post in the project "Resources" listing

# The images collection is used to add images to the project gallery:
images:
- /images/2018-07-14-lite2sound-direct-out-mod/hero.png

hero_image_url: # fully-qualified url to the "hero" image, used in twitter cards for example

# The videos collection is used to add videos to the project gallery (currently only mp4):
#videos:
#- https://video.twimg.com/tweet_video/C_8OYj_V0AAtg5I.mp4

---

You could get a little better sound quality in a recording by wiring up a direct output jack.
![ my first image]({{ page.images[0] }})

It bypasses the LM386 amplifier and the volume control.  Simply add a second 3.5mm jack, it can share the circuit ground connection if its metal bushing is in contact with the metal case.  Connect the tip terminal to Pin 3 of the Volume potentiometer.  If you want to record to both L+R channels of a stereo device, connect the ring terminal to the tip terminal with a 1k resistor.  Then you can use either a mono plug or stereo plug in your new Direct Out jack without shorting out the preamp.

Glad to hear you are enjoying the circuit.  Thanks everybody.  -Eric

The Direct Out mod doesn't affect the headphones / speaker amp.  You could listen with headphones and adjust the volume as needed, without affecting the recording.
---
layout:      post
title:       "LEAP#257 It's a Blinking Emergency!"
date:        "2016-10-17 17:37:35 +0800"
source_url:  https://github.com/tardate/LittleArduinoProjects/tree/master/BoldportClub/Emergency
author_name: "@tardate"
author_url:  "https://twitter.com/tardate"

# If you include summary text here, it will be used for display
# in the post listing instead of an excerpt from the post body
#summary: text

# If the post concerns a project, set the project name as the category:
category: p02-emergency

# If the post features a youtube video, set the ID here:
youtubeid: PPUZth8RfCE

# Tags are used to include the post in specific project collections:
tags:
- builds # includes the post in the project "Community Builds" listing
#- resources # includes the post in the project "Resources" listing

# The images collection is used to add images to the project gallery:
images:
- https://leap.tardate.com/BoldportClub/Emergency/assets/Emergency_build.jpg
- https://leap.tardate.com/BoldportClub/Emergency/assets/Emergency_bb.jpg
- https://leap.tardate.com/BoldportClub/Emergency/assets/Emergency_board_front.jpg
- https://leap.tardate.com/BoldportClub/Emergency/assets/Emergency_board_rear.jpg
- https://leap.tardate.com/BoldportClub/Emergency/assets/Emergency_breadboard.jpg
- https://leap.tardate.com/BoldportClub/Emergency/assets/Emergency_layout.jpg
- https://leap.tardate.com/BoldportClub/Emergency/assets/Emergency_schematic.jpg
- https://leap.tardate.com/BoldportClub/Emergency/assets/scope.gif

hero_image_url: https://leap.tardate.com/BoldportClub/Emergency/assets/Emergency_build.jpg
---

Since I'm working with just the PCB from the "Just Less the Perfect" set, there's an obvious challenge to do something a bit different.
After a bit of experimentation, I was able to get something to work with only a few liberties taken with the original PCB - it is now an LED blinky with 3 passives and a transistor (Esaki Effect)
All [notes, schematics and code are in the Little Electronics & Arduino Projects repo on GitHub]({{ page.source_url }})
![ my first image]({{ page.images[0] }})

{% include youtube-embed.html id=page.youtubeid %}

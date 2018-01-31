---
layout:      post
title:       "LEAP#276: Variable Speed Runway LEDs (inspired by the Pease)"
date:        "2016-12-01 13:51:52 +0800"
source_url:  https://github.com/tardate/LittleArduinoProjects/tree/master/playground/VariableFrequencyRunwayLEDs
author_name: "@tardate"
author_url:  "https://twitter.com/tardate"

# If you include summary text here, it will be used for display
# in the post listing instead of an excerpt from the post body
#summary: text

# If the post concerns a project, set the project name as the category:
category: p01-pease

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
youtubeid: qnxnlBLyGxo

# Tags are used to include the post in specific project collections:
tags:
- builds # includes the project in the "Community Builds" listing
#- resources # includes the post in the project "Resources" listing

# The images collection is used to add images to the project gallery:
images:
- https://leap.tardate.com/playground/VariableFrequencyRunwayLEDs/assets/VariableFrequencyRunwayLEDs_build.jpg
---

in the vein of "now I have a hammer, everything looks like a nail" ...I found a new application of the LM331!
I was introduced to the LM331 when I built the Pease project.
I wanted to drive some variable-frequency LED effects without taxing the MCU. Many ways of doing this, but my solution uses the LM331.
This is just a small part of a larger project (hence my desire for no processor overhead).
My full build notes are in the [LittleArduinoProjects]({{ page.source_url }}) repo.
Sneak peek:
{% include youtube-embed.html id=page.youtubeid %}

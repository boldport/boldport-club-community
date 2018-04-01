---
layout:      post
title:       "IxpandO test script"
date:        "2018-04-01 15:08:55 +0800"
source_url:  https://github.com/MarkAYoder/BeagleBoard-exercises/blob/master/boldport/ixpand0/play.sh
author_name: Mark Yoder
author_url:  https://github.com/MarkAYoder

# If you include summary text here, it will be used in the post meta description instead of an excerpt from the post body
#summary: text

# If the post concerns a project, set the project name as the category:
category: p16-ixpando

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
- /images/2018-04-01-ixpando-test-script/script.png
#- http://another_image.url

hero_image_url: # fully-qualified url to the "hero" image, used in twitter cards for example

# The videos collection is used to add videos to the project gallery (currently only mp4):
#videos:
#- https://video.twimg.com/tweet_video/C_8OYj_V0AAtg5I.mp4

---

[Here's a simple bash script](https://github.com/MarkAYoder/BeagleBoard-exercises/blob/master/boldport/ixpand0/play.sh)
that exercises the LEDs and reads the DIP switches on IxpandO.
I've tested it on a BeagleBone, but it should run on a RPI as well if you change the $BUS number.

    # From: http://ww1.microchip.com/downloads/en/DeviceDoc/20001952C.pdf
    # I'm using I2C bus 2
    BUS=2
    i2cdetect -y -r $BUS
    # The MCP23017 appears at address 0x20
    ADDR=0x20

    # The switches are on GPIOA and the LEDs on GPIOB
    # This assumes it starts in BANK0.
    # Set GPIOA, switches, to inputs
    i2cset -y -r $BUS $ADDR 0x00 0xff
    # Set GPIOB to outputs
    i2cset -y -r $BUS $ADDR 0x01 0x00

    # Set pull-up resistors on GPIOA
    i2cset -y -r $BUS $ADDR 0x0c 0xff
    i2cset -y -r $BUS $ADDR 0x0d 0x00   # Turn off on GPIOB

    i2cdump -y -r 0x00-0x1f 2 0x20 b

    # Cycle through LEDs
    for i in {0..7};
    do
        i2cset -y $BUS $ADDR 0x13 $((1<<$i))
        sleep 0.1
    done

    for i in {6..-1..-1};
    do
        i2cset -y $BUS $ADDR 0x13 $((1<<$i))
        sleep 0.1
    done

    i2cset -y $BUS $ADDR 0x13 0xff

    # Read switches
    i2cget -y $BUS $ADDR 0x12 b

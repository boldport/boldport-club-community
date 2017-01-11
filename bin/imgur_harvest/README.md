# imgur album harvesting

A simple tool for grabbing a list of images from an imgur album

## Installation

This tool uses the official imgur python client. Install with pip:

```
$ pip install -r requirements.txt
```

## Run

Requires [registration](https://api.imgur.com/oauth2) to get a CLIENT_ID and CLIENT_SECRET.

The [harvest_album.py](./harvest_album.py) script expects to find CLIENT_ID and CLIENT_SECRET from the environment.

the gallery to scan is provided as a command-line argument

e.g. to scan the album at http://imgur.com/a/CNIUR:

```
$ CLIENT_ID=abc CLIENT_SECRET=xyz ./harvest_album.py -g CNIUR
http://i.imgur.com/JJgV4Ka.jpg
http://i.imgur.com/gEUkSX6.jpg
http://i.imgur.com/s2JThqR.jpg
http://i.imgur.com/gyZa5M7.jpg
http://i.imgur.com/3uG3rOp.jpg
http://i.imgur.com/CRgCwAq.jpg
http://i.imgur.com/5yBu0NP.jpg
http://i.imgur.com/w3ETIqm.jpg
http://i.imgur.com/v5QZSwT.jpg
http://i.imgur.com/xC1T6wa.jpg
http://i.imgur.com/0aH45mM.jpg
http://i.imgur.com/iHKJv3C.jpg
http://i.imgur.com/HF8UXcJ.jpg
http://i.imgur.com/Pvu9Tnc.jpg
http://i.imgur.com/ZS7R46J.jpg
http://i.imgur.com/T0cBk9l.jpg
http://i.imgur.com/NrTz9jk.jpg
http://i.imgur.com/zwyJBDh.jpg
http://i.imgur.com/EZE5riJ.jpg
http://i.imgur.com/znNcquG.jpg
```

These links are to the original size image. Thumbnails are available by appending size indicator
to the image name according to the [imgur gallery data model](https://api.imgur.com/models/gallery_image)

e.g.

* `http://i.imgur.com/znNcquG.jpg` - full size
* `http://i.imgur.com/znNcquGm.jpg` - Medium Thumbnail 320x320


## References
* [imgurpython egg](https://github.com/Imgur/imgurpython)
* [imgur API docs](http://api.imgur.com/)
* [imgur gallery data model](https://api.imgur.com/models/gallery_image)

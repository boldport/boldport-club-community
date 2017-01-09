# Harvesting Links from Twitter

## Install Twitter CLI

This example uses the [Twitter CLI](https://github.com/sferik/t)

* because Jekyll is Ruby-based, so developers probably already have a working Ruby environment
* it has all the features necessary to do simple searches.

It hasn't been added to the main Gemfile in this repository, because not an essential dependency for Jekyll.

Install using the Gemfile in this folder and authorize (follow the prompts):

```
bundle install
t authorize
```

## Searching Twitter

The [Twitter CLI gem](https://github.com/sferik/t) is pretty good for poking around the twitter API.
Unfortunately it doesn't delivery much of the tweet detail needed for a good harvest.

```
t search all --long --decode-uris --csv --number=40 "#BoldportClub"
ID,Posted at,Screen name,Text
817404492727590916,2017-01-06 16:16:32 +0000,boldport,#BoldportClub https://t.co/VekOWfR7Zw
817382549756514306,2017-01-06 14:49:20 +0000,EstudioRoble,RT @boldport: New lovely pictures of #BoldportClub 'The Gent' from @ErbslandArt http://boldport.com/gent https://t.co/RhtlGUwoYi
817352247843717120,2017-01-06 12:48:56 +0000,HashDefineElec,RT @boldport: New lovely pictures of #BoldportClub 'The Gent' from @ErbslandArt http://boldport.com/gent https://t.co/RhtlGUwoYi
...etc...
```

## Harvesting

The [harvets.rb](./harvest.rb) script uses the [Twitter CLI gem](https://github.com/sferik/t)
and underlying [Twitter gem](https://github.com/sferik/twitter) to do a basic scrape.


### Harvestinga Recent Tweets

The search doesn't go back far unfortunately. But if it can find the tweets, they'll be imported as posts:

Searching all since tweet [668824434334134272](https://twitter.com/boldport/status/668824434334134272)..
```
$ ./harvest.rb -s 668824434334134272
Processing 818398182161797121 [2017-01-09 10:05:06 +0000] .. skipping: retweet
Processing 818135277025824768 [2017-01-08 16:40:24 +0000] .. skipping: retweet
Processing 818093082411462656 [2017-01-08 13:52:44 +0000] .. skipping: retweet
Processing 818091110518112258 [2017-01-08 13:44:54 +0000] .. writing: /Users/paulgallagher/MyGithub/boldport/boldport-club-community/_posts/2017-01-08-818091110518112258.md
Processing 818048733220929537 [2017-01-08 10:56:31 +0000] .. writing: /Users/paulgallagher/MyGithub/boldport/boldport-club-community/_posts/2017-01-08-818048733220929537.md
Processing 817404492727590916 [2017-01-06 16:16:32 +0000] .. writing: /Users/paulgallagher/MyGithub/boldport/boldport-club-community/_posts/2017-01-06-817404492727590916.md
Processing 817382549756514306 [2017-01-06 14:49:20 +0000] .. skipping: retweet
Processing 817352247843717120 [2017-01-06 12:48:56 +0000] .. skipping: retweet
Processing 817345882572124160 [2017-01-06 12:23:38 +0000] .. skipping: retweet
Processing 817345627965136896 [2017-01-06 12:22:37 +0000] .. writing: /Users/paulgallagher/MyGithub/boldport/boldport-club-community/_posts/2017-01-06-817345627965136896.md
Processing 816695852681019392 [2017-01-04 17:20:39 +0000] .. skipping: retweet
Processing 816180534980280321 [2017-01-03 07:12:58 +0000] .. skipping: retweet
Processing 815637205855141892 [2017-01-01 19:13:58 +0000] .. skipping: retweet
Processing 815584510200815616 [2017-01-01 15:44:34 +0000] .. skipping: retweet
Processing 815581770926067712 [2017-01-01 15:33:41 +0000] .. skipping: retweet
Processing 815580263660949504 [2017-01-01 15:27:42 +0000] .. writing: /Users/paulgallagher/MyGithub/boldport/boldport-club-community/_posts/2017-01-01-815580263660949504.md
Processing 815254384699408384 [2016-12-31 17:52:46 +0000] .. skipping: retweet
Processing 815254015109951489 [2016-12-31 17:51:18 +0000] .. skipping: retweet
Processing 815253998471172096 [2016-12-31 17:51:14 +0000] .. skipping: retweet
Processing 815253679112646657 [2016-12-31 17:49:58 +0000] .. skipping: no images
Processing 815186421656993792 [2016-12-31 13:22:43 +0000] .. skipping: retweet
Processing 815186150872776704 [2016-12-31 13:21:38 +0000] .. skipping: retweet
Processing 815185545013972994 [2016-12-31 13:19:14 +0000] .. skipping: retweet
Processing 815185451770331136 [2016-12-31 13:18:51 +0000] .. skipping: no images
Processing 815184904992526336 [2016-12-31 13:16:41 +0000] .. skipping: no images
Processing 815156436309331968 [2016-12-31 11:23:33 +0000] .. skipping: retweet
Processing 815152235915210752 [2016-12-31 11:06:52 +0000] .. skipping: retweet
Processing 815137234240225280 [2016-12-31 10:07:15 +0000] .. skipping: retweet
Processing 815122265008467968 [2016-12-31 09:07:46 +0000] .. skipping: retweet
Processing 815122146502578176 [2016-12-31 09:07:18 +0000] .. skipping: retweet
Processing 815122051203735552 [2016-12-31 09:06:55 +0000] .. skipping: no images
```

### Harvesting a Specific Tweet

```
$ ./harvest.rb -i 702445677754847233
Processing 702445677754847233 [2016-02-24 10:51:15 +0000] .. writing: /Users/paulgallagher/MyGithub/boldport/boldport-club-community/_posts/2016-02-24-702445677754847233.md
```

## References
* [Twitter CLI gem](https://github.com/sferik/t)
* [Twitter gem](https://github.com/sferik/twitter) - a dependency of the Twitter CLI gem
* [Twitter Search API](https://dev.twitter.com/rest/public/search)

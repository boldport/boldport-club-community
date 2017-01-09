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


### Harvesting Recent Tweets

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

### TODO

handle vimeo, animated gifs, linked posts...

```
$ ./harvest.rb -i 733228573041917952
Processing 733228573041917952 [2016-05-19 09:31:29 +0000] .. skipping: no images
{:tweet=>"#<Twitter::Tweet id=733228573041917952>", :media=>[#<Twitter::Media::AnimatedGif id=733228136964358144>], :full_text=>"I wrote a quick animation to test out my assembled Cordwood Puzzle. #BoldportClub https://t.co/4TjcUabYNg", :uris=>[]}

$ ./harvest.rb -i 733674023909986304
Processing 733674023909986304 [2016-05-20 15:01:32 +0000] .. skipping: no images
{:tweet=>"#<Twitter::Tweet id=733674023909986304>", :media=>[#<Twitter::Media::Video id=733671458610786306>], :full_text=>"#BoldportClub Project #5, The TAP. Join today ;-) https://t.co/nycfWkRO0s https://t.co/TLCib85oEX", :uris=>[#<Twitter::Entity::URI:0x007fa71b33d410 @attrs={:url=>"https://t.co/nycfWkRO0s", :expanded_url=>"http://boldport.club", :display_url=>"boldport.club", :indices=>[50, 73]}, @_memoized_method_cache=#<Memoizable::Memory:0x007fa71b33d3e8 @memory=#<ThreadSafe::Cache:0x007fa71b33d3c0 @backend={:expanded_uri=>#<Addressable::URI:0x3fd38d99e7b0 URI:http://boldport.club>}, @default_proc=nil>, @monitor=#<Monitor:0x007fa71b33d370 @mon_owner=nil, @mon_count=0, @mon_mutex=#<Thread::Mutex:0x007fa71b33d320>>>>]}

$ ./harvest.rb -i 740494715389415424
Processing 740494715389415424 [2016-06-08 10:44:32 +0000] .. skipping: no images
{:tweet=>"#<Twitter::Tweet id=740494715389415424>", :media=>[], :full_text=>"Did you see @alicestewwwart's build video of #BoldportClub Project #4? https://t.co/apcQQEKpsg", :uris=>[#<Twitter::Entity::URI:0x007fc973ded200 @attrs={:url=>"https://t.co/apcQQEKpsg", :expanded_url=>"https://vimeo.com/169740490", :display_url=>"vimeo.com/169740490", :indices=>[71, 94]}, @_memoized_method_cache=#<Memoizable::Memory:0x007fc973ded1d8 @memory=#<ThreadSafe::Cache:0x007fc973ded1b0 @backend={:expanded_uri=>#<Addressable::URI:0x3fe4b9ef66f8 URI:https://vimeo.com/169740490>}, @default_proc=nil>, @monitor=#<Monitor:0x007fc973ded160 @mon_owner=nil, @mon_count=0, @mon_mutex=#<Thread::Mutex:0x007fc973ded110>>>>]}

$ ./harvest.rb -i 756228719920852992
Processing 756228719920852992 [2016-07-21 20:45:51 +0000] .. skipping: no images
{:tweet=>"#<Twitter::Tweet id=756228719920852992>", :media=>[], :full_text=>"A write-up about Boldport Club projects with great pictures https://t.co/kmM6RUcFVg #BoldportClub", :uris=>[#<Twitter::Entity::URI:0x007ff554902eb8 @attrs={:url=>"https://t.co/kmM6RUcFVg", :expanded_url=>"https://luckyresistor.me/2016/07/21/projects-from-boldport-club-arrived/", :display_url=>"luckyresistor.me/2016/07/21/pro…", :indices=>[60, 83]}, @_memoized_method_cache=#<Memoizable::Memory:0x007ff554902e90 @memory=#<ThreadSafe::Cache:0x007ff554902e68 @backend={:expanded_uri=>#<Addressable::URI:0x3ffaaa481540 URI:https://luckyresistor.me/2016/07/21/projects-from-boldport-club-arrived/>}, @default_proc=nil>, @monitor=#<Monitor:0x007ff554902e18 @mon_owner=nil, @mon_count=0, @mon_mutex=#<Thread::Mutex:0x007ff554902dc8>>>>]}

```

## References
* [Twitter CLI gem](https://github.com/sferik/t)
* [Twitter gem](https://github.com/sferik/twitter) - a dependency of the Twitter CLI gem
* [Twitter Search API](https://dev.twitter.com/rest/public/search)

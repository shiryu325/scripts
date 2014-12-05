#!/usr/bin/python
# 
# TODO - Convert perl downloader into python and integrate into fetch loop

import os.path
import feedparser
import time
import calendar
from subprocess import call
import sys

perl='/usr/bin/perl'
downloader='/home/voltron/Prog/Downloader.pl'
feedslist='/home/voltron/Prog/feeds.txt'

days = 2
maxage = (60 * 60 * 24) * days 
now = time.gmtime() 

# Check Configs & File existences
if os.path.isfile(perl) and os.path.isfile(downloader) and os.path.isfile(feedslist):
	print "Configuration OK...\n" ;
else:
	print "Configuration problem...!\n"
	sys.exit() 

# Run
file = open(feedslist, "r") 
for f in file:
	d = feedparser.parse(f) 
	print "==========================================="
	print d.feed.title
	print "===========================================\n" 

	for i in range(10):
		published = d.entries[i].published_parsed
		age = calendar.timegm(now) - calendar.timegm(published)

		if  (age < maxage) :
			print d.entries[i].published , "-\t" , "[", d.entries[i].title ,"]" ,"\t" , "published" , age / 86400 , "days ago"
			call([perl , downloader, d.entries[i].enclosures[0].href]) 

file.close() 

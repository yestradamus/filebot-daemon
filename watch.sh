#!/bin/sh

/usr/local/bin/fswatch -0 /path/to/inbox | xargs -0 -n 1 -I {} /usr/local/bin/filebot -script fn:amc --output "/path/to/plex/root" --action copy --conflict auto -non-strict "/path/to/inbox" --def excludeList=amc.txt clean=y --log-file /path/to/plex/root/amc.log

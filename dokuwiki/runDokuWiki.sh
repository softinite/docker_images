#!/usr/bin/env bash
docker run -d -p 9001:80 -v "~/Documents/dokuwiki/data:/dokuwiki/data/" --name dokuwiki_c softinite/dokuwiki
#docker exec dokuwiki_c mkdir /dokuwiki/data/pages
#docker exec dokuwiki_c mkdir /dokuwiki/data/media_attic
#docker exec dokuwiki_c mkdir /dokuwiki/data/attic
#docker exec dokuwiki_c mkdir /dokuwiki/data/media_meta
#docker exec dokuwiki_c mkdir /dokuwiki/data/meta
#docker exec dokuwiki_c mkdir /dokuwiki/data/locks
#docker exec dokuwiki_c mkdir /dokuwiki/data/cache
#docker exec dokuwiki_c mkdir /dokuwiki/data/index
#docker exec dokuwiki_c mkdir /dokuwiki/data/tmp


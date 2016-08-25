#!/usr/bin/env bash

# Download latest HTTP1.1 protocol http://www.infoq.com/cn/news/2014/06/http-11-updated
for i in 7230 7231 7232 7233 7234 7235; do wget "https://tools.ietf.org/rfc/rfc${i}.txt"; done

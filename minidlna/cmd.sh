#!/bin/sh
rm /run/minidlna/minidlna.pid
exec minidlnad -S

#!/bin/sh
nmbd
exec smbd -F --no-process-group -S

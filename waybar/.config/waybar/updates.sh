#! /usr/bin/env bash
count=$(checkupdates 2>/dev/null | wc -l)

if [[ "$count" -gt 20 ]]; then
    echo "{\"text\":\"󰅢\",\"tooltip\":\"$count updates available\"}"
fi

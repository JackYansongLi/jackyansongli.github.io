#!/bin/bash
astro build
npx linkinator dist --recurse --skip '^http'

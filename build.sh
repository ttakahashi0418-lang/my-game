#!/bin/sh
# src/game.html（本体）を、ブラウザでそのまま開ける index.html に包む
set -e
cd "$(dirname "$0")"
{
  printf '<!doctype html>\n<html lang="ja">\n<head>\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">\n</head>\n<body>\n'
  cat src/game.html
  printf '\n</body>\n</html>\n'
} > index.html
echo "built index.html"

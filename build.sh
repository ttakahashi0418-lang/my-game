#!/bin/sh
# src/game.html（本体）を、ブラウザで開ける index.html に包む。
# ホーム画面に追加して使えるよう、アプリ用の設定（manifest・アイコン・オフライン対応）もここで足す。
set -e
cd "$(dirname "$0")"
{
  cat <<'HEAD'
<!doctype html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<meta name="theme-color" content="#0b0c11">
<link rel="manifest" href="manifest.webmanifest">
<link rel="icon" type="image/png" href="icons/icon-192.png">
<link rel="apple-touch-icon" href="icons/apple-touch-icon.png">
<meta name="mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
<meta name="apple-mobile-web-app-title" content="めぐり迷宮">
<style>html{box-sizing:border-box;padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px);background:#0b0c11}</style>
</head>
<body>
HEAD
  cat src/game.html
  cat <<'FOOT'

<script>
if('serviceWorker' in navigator&&(location.protocol==='https:'||location.hostname==='localhost')){
  window.addEventListener('load',()=>navigator.serviceWorker.register('sw.js').catch(()=>{}));
}
</script>
</body>
</html>
FOOT
} > index.html
echo "built index.html"

---
title: "xcodeインストールのxcodebuildの確認でエラーがでたときの対処法"
date: 2022-08-04T00:29:09+09:00
slug: "xcodeインストールのxcodebuildの確認でエラーがでたときの対処法"
categories : ["技術"]
tags: ["Xcode"]
description: ""
image: ""
author: "tama-tan"
draft: false
---

こう言うのがでた場合。。。。。

```
$ xcodebuild -version
error: tool 'xcodebuild' requires Xcode, but active developer directory '/Library/Developer/CommandLineTools' is a command line tools instance
```

これたたいてみたら、、、、、

```
$ sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
```

なおった。。。。

```
$ xcodebuild -version
Xcode 13.4.1
Build version 13F100
```

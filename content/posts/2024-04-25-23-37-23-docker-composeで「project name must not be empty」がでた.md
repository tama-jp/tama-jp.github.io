---
title: "2024 04 25 23 37 23 Docker Composeで「project Name Must Not Be Empty」がでた"
date: 2024-04-25T23:37:23+09:00
slug: ""
# categories : ["技術"]
# tags: ["golang"]
categories: ["技術"]
tags: ["docker compose"]
description: ""
image: ""
author: "tama-tan"
draft: false
---

Macでdocker composeファイルを起動したら

```
project name must not be empty
```

とでた。

文法も間違えてないのになんだろうと思ったら、
ルートのディレクトリが日本語を使用していただけでエラーが出た。
どうも、フルパスを確認してるようだ。
だたし、Dockerfilesは、日本語のパスが入っていてても問題なく動作する。
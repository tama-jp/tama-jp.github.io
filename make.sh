#!/bin/bash

# 現在時刻を取得
current_time=$(date '+%Y-%m-%d-%H-%M-%S')

# タイトルを引数から取得
if [ -z "$1" ]; then
  echo "Usage: $0 <title>"
  exit 1
fi

# タイトルをスラッグ形式に変換（スペースをハイフンに）
title=$(echo "$1" | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

# ファイル名を生成
filename="content/posts/${current_time}-${title}.md"

# Hugo用のテンプレートを作成
cat <<EOF > "$filename"
---
title: "$1"
date: "$(date '+%Y-%m-%dT%H:%M:%S%z')"
slug: ""
# categories: ["技術"]
# tags: ["golang","Objective-C","Xcode", "hugo","gorm","HomeBrew"]
categories: ["技術"]
tags: [ "hugo" ]
description: ""
image: ""
author: "tama-tan"
draft: false
---


EOF

echo "Post created: $filename"

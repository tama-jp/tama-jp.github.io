---
title: "Vite + Svelte + Tailwind CSS + daisyUI + TypeScript の環境設定"
date: 2022-07-29T16:43:35+09:00
slug: "Vite + Svelte + Tailwind CSS + daisyUI + TypeScript の環境設定"
categories : ["技術"]
tags: ["Vite" , "Svelte" , "Tailwind CSS" , "daisyUI" , "TypeScript"]
description: ""
image: ""
author: "tama-tan"
draft: false
---

パパッとコマンドなどだけですが、こんな感じで。。。。。。

```
npm create vite@latest kodawari -- --template svelte-ts
```

```
cd kodawari
```

```
npm i -D tailwindcss
npm i -D daisyui
```

```
npm install
```

```
npx tailwindcss init -p
```


./src/app.css に追加

```
@tailwind base;
@tailwind components;
@tailwind utilities;

```


./tailwind.config.cjs を更新

```
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [],
  theme: {
    extend: {},
  },
  plugins: [],
}
```

↓

```
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./src/**/*.{svelte,js,ts}'],
  theme: {
    extend: {},
  },
  plugins: [require('daisyui')],
}
```


./src/App.savelet を更新

```
<script lang="ts">
    import Counter from './lib/Counter.svelte'
    import Collapse from './lib/Collapse.svelte'
    import Modal from './lib/Modal.svelte'
</script>

<main>
    <button class="btn btn-secondary">Hello daisyui</button>
    
    <button class="btn btn-ghost">Button</button>
    <button class="btn btn-link">Button</button>

    <div class="mockup-code">
        <pre data-prefix="1"><code>npm i daisyui</code></pre>
        <pre data-prefix="2"><code>installing...</code></pre>
        <pre data-prefix="3" class="bg-warning text-warning-content"><code>Error!</code></pre>
    </div>

    <div class="card">
        <Counter/>
    </div>
        <Modal/>
    <Collapse/>

</main>

```


./lib/Collapse.svelte を追加

```
<div class="collapse">
    <input type="checkbox" />
    <div class="collapse-title text-xl font-medium">
        Click me to show/hide content
    </div>
    <div class="collapse-content">
        <p>hello</p>
    </div>
</div>

```

./lib/Modal.svelte を追加

```

<!-- The button to open modal -->
<label for="my-modal" class="btn modal-button">open modal</label>

<!-- Put this part before </body> tag -->
<input type="checkbox" id="my-modal" class="modal-toggle" />
<div class="modal">
    <div class="modal-box">
        <h3 class="font-bold text-lg">Congratulations random Internet user!</h3>
        <p class="py-4">You've been selected for a chance to get one year of subscription to use Wikipedia for free!</p>
        <div class="modal-action">
            <label for="my-modal" class="btn">Yay!</label>
        </div>
    </div>
</div>

```

これで、テストしてみる。

```
npm run dev

```

こんな感じで表示されます。(^O^)

![画面](../img/ViteSvelteTSlocalhost.png)


参考：

https://tailwindcss.com/docs/installation
https://daisyui.com/
https://ja.vitejs.dev/guide/#%E3%82%B3%E3%83%9F%E3%83%A5%E3%83%8B%E3%83%86%E3%82%A3%E3%81%AE%E3%83%86%E3%83%B3%E3%83%97%E3%83%AC%E3%83%BC%E3%83%88

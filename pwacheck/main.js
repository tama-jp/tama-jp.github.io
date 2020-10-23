((a, b, c) => {
  const d = d => ({
    "オフライン機能": "caches" in a,
    "プッシュ通知": "pushManager" in d,
    "ホーム画面に追加": "relList" in HTMLLinkElement.prototype && b.createElement("link").relList.supports("manifest") && "onbeforeinstallprompt" in a,
    "バックグラウンド同期": "sync" in d,
    "定期的なバックグラウンド同期": "periodicSync" in d,
    "バックグラウンドフェッチ": "backgroundFetch" in d,
    "ナビゲーションプリロード": "navigationPreload" in d,
    "ストレージの見積もり(Storage Estimation)": "storage" in c && "estimate" in c.storage,
    "永続的なストレージ": "storage" in c && "persist" in c.storage,
    "Webシェア (Level 1)": "share" in c,
    "Webシェア (Level 2)": "share" in c && "canShare" in c,
    "メディアセッション": "mediaSession" in c,
    "メディア機能": "mediaCapabilities" in c,
    "デバイスメモリ": "deviceMemory" in c,
    "インストールされている関連アプリの取得": "getInstalledRelatedApps" in c,
    "支払い要求": "PaymentRequest" in a,
    "支払いハンドラ": "paymentManager" in d,
    "クレデンシャル管理": "credentials" in c && "preventSilentAccess" in c.credentials && ("PasswordCredential" in a || "FederatedCredential" in a)
  }), e = a => {
    const c = b.createDocumentFragment(), d = b.getElementById("featureRow"), e = d.content.querySelector(".feature"),
      f = d.content.querySelector(".support");
    for (const g in a) a.hasOwnProperty(g) && (e.textContent = g, f.textContent = a[g] ? "\u2705" : "\u274C", c.appendChild(b.importNode(d.content, !0)));
    const g = b.getElementById("placeholder");
    g.parentNode.replaceChild(c, g)
  };
  a.addEventListener("load", () => {
    b.getElementById("userAgent").textContent = c.userAgent, a.setTimeout(() => "serviceWorker" in c ? c.serviceWorker.register("sw.js").then(a => {
      const b = d(a);
      e(b)
    }) : void e({"Service Workers Not Supported": !1}), 500)
  })
})(window, document, navigator);

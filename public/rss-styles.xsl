<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <html lang="ru">
      <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title><xsl:value-of select="rss/channel/title"/> — RSS</title>
        <link rel="preconnect" href="https://fonts.googleapis.com"/>
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="crossorigin"/>
        <link
          href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&amp;family=JetBrains+Mono:wght@400;500&amp;family=Inter:wght@400&amp;display=swap"
          rel="stylesheet"/>
        <style>
          :root {
            --ink:#14161a; --line:#262a31; --text:#d7dae0;
            --muted:#7c828d; --brass:#bfa06a; --brass-dim:#8f7a52;
          }
          * { box-sizing:border-box; }
          body {
            margin:0; background:var(--ink); color:var(--text);
            font-family:'Inter',system-ui,sans-serif; line-height:1.7;
            -webkit-font-smoothing:antialiased;
          }
          .wrap { max-width:42rem; margin:0 auto; padding:clamp(3rem,9vh,6rem) 1.5rem 4rem; }
          .eyebrow {
            font-family:'JetBrains Mono',monospace; font-size:.75rem;
            letter-spacing:.14em; text-transform:uppercase; color:var(--brass-dim);
            display:flex; align-items:center; gap:.75rem; margin:0 0 1.4rem;
          }
          .eyebrow:after { content:''; flex:1; height:1px; background:var(--line); }
          h1 {
            font-family:'Playfair Display',Georgia,serif; font-weight:700;
            font-size:clamp(2rem,7vw,2.75rem); letter-spacing:-.01em;
            line-height:1.05; margin:0;
          }
          h1 .dot { color:var(--brass); }
          .desc { color:var(--muted); margin:1.1rem 0 0; max-width:34rem; }
          .note {
            font-family:'JetBrains Mono',monospace; font-size:.8rem; color:var(--muted);
            background:#1b1e24; border:1px solid var(--line); border-radius:8px;
            padding:.85rem 1rem; margin:2rem 0 0; line-height:1.6;
          }
          .note b { color:var(--text); font-weight:500; }
          .note .url {
            display:block; margin-top:.5rem; color:var(--brass);
            word-break:break-all;
          }
          .items { list-style:none; margin:2.5rem 0 0; padding:0; position:relative; }
          .items:before {
            content:''; position:absolute; left:5px; top:6px; bottom:6px;
            width:1px; background:var(--line);
          }
          .item { position:relative; padding:.6rem 0 .6rem 1.9rem; }
          .item:before {
            content:''; position:absolute; left:0; top:1.15rem;
            width:11px; height:11px; border-radius:50%;
            background:var(--ink); border:1px solid var(--muted);
          }
          .item time {
            font-family:'JetBrains Mono',monospace; font-size:.75rem;
            color:var(--muted); display:block; margin-bottom:.15rem;
          }
          .item a.title {
            font-family:'Playfair Display',Georgia,serif; font-size:1.15rem;
            font-weight:600; color:var(--text); text-decoration:none;
            border-bottom:1px solid transparent; transition:color .18s,border-color .18s;
          }
          .item a.title:hover { color:var(--brass); border-color:var(--brass); }
          .item p { margin:.25rem 0 0; color:var(--muted); font-size:.95rem; }
          .foot {
            margin-top:4rem; padding-top:1.4rem; border-top:1px solid var(--line);
            font-family:'JetBrains Mono',monospace; font-size:.75rem; color:var(--muted);
          }
          .foot a { color:var(--muted); text-decoration:none; border-bottom:1px solid var(--brass-dim); }
          .foot a:hover { color:var(--brass); border-color:var(--brass); }
        </style>
      </head>
      <body>
        <main class="wrap">
          <div class="eyebrow">rss feed</div>
          <h1>
            <xsl:value-of select="rss/channel/title"/><span class="dot">.rss</span>
          </h1>
          <p class="desc"><xsl:value-of select="rss/channel/description"/></p>

          <div class="note">
            <b>Это RSS-лента.</b> Скопируй адрес этой страницы в свою читалку
            (Feedly, Inoreader, NetNewsWire) или RSS-бота в телеге — и новые посты
            будут приходить автоматически, без захода на сайт.
            <span class="url"><xsl:value-of select="rss/channel/link"/>rss.xml</span>
          </div>

          <ul class="items">
            <xsl:for-each select="rss/channel/item">
              <li class="item">
                <time><xsl:value-of select="substring(pubDate, 6, 11)"/></time>
                <a class="title" href="{link}"><xsl:value-of select="title"/></a>
                <p><xsl:value-of select="description"/></p>
              </li>
            </xsl:for-each>
          </ul>

          <div class="foot">
            <a href="{rss/channel/link}">← вернуться на сайт</a>
          </div>
        </main>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>

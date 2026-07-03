# volo.dev

Личный сайт-блог на [Astro](https://astro.build). Статика, посты в Markdown,
RSS + sitemap, тёмная минималка. Собирается в чистый HTML — хоститься можно где угодно.

## Быстрый старт

```bash
npm install
npm run dev      # локально на http://localhost:4321
npm run build    # собрать в ./dist
npm run preview  # посмотреть собранное
```

Нужен Node 18+.

## Что поправить под себя (5 минут)

1. **`astro.config.mjs`** → `site: 'https://твойдомен'` — от этого зависят RSS,
   sitemap и OG-ссылки. Без этого превью и фид будут битые.
2. **`src/consts.ts`** → имя, bio, соцсети, список проектов. Всё в одном файле.
3. **`public/favicon.svg`** → буква/цвет фавикона, если хочется.
4. Посты — в **`src/content/posts/*.md`**. Удали примеры, добавь свои.

## Как добавить пост

Создай файл `src/content/posts/имя-поста.md`:

```markdown
---
title: Заголовок
description: Короткое описание для превью и RSS
date: 2026-07-01
tags: [python, fastapi]
draft: false
---

Текст в Markdown…
```

Имя файла = адрес поста (`/posts/имя-поста/`). `draft: true` прячет из списка.

## Деплой на GitHub Pages

Workflow уже лежит в `.github/workflows/deploy.yml` — он сам билдит и публикует
сайт при каждом пуше в `main`. От тебя нужно:

**1. Настроить домен в проекте**
- В `astro.config.mjs` поставь `site` (свой домен или `https://username.github.io`).
- `public/CNAME`: впиши свой домен **или удали файл**, если будешь жить на
  `username.github.io/имя-репо` (тогда ещё раскомментируй `base` в конфиге).

**2. Создать репозиторий и запушить**
```bash
# git-репозиторий уже инициализирован, с первым коммитом.
git remote add origin https://github.com/USERNAME/REPO.git
git branch -M main
git push -u origin main
```

**3. Включить Pages**
Repo → **Settings** → **Pages** → **Source: GitHub Actions**.

**4. (если свой домен)** Repo → **Settings** → **Pages** → **Custom domain** →
впиши домен. В DNS у регистратора добавь записи на GitHub Pages:
- `A` на `185.199.108.153`, `185.199.109.153`, `185.199.110.153`, `185.199.111.153`
- либо `CNAME` поддомена (`www`/`blog`) на `USERNAME.github.io`

Дальше каждый `git push` в `main` пересобирает сайт автоматически (вкладка
**Actions** покажет статус).

## Деплой на Cloudflare Pages (альтернатива)

Если передумаешь: **Workers & Pages** → **Create** → **Pages** →
**Connect to Git**, preset **Astro**, build `npm run build`, output `dist`,
потом **Custom domains** → свой домен. Workflow для этого не нужен.

## Структура

```
src/
  consts.ts              # ← имя, соцсети, проекты
  content.config.ts      # схема постов
  content/posts/*.md     # ← сами посты
  layouts/Base.astro     # <head>, шрифты, OG-теги
  components/            # шапка, список постов, проекты, футер
  pages/
    index.astro          # главная
    posts/[...slug].astro# страница поста
    rss.xml.js           # фид
  styles/global.css      # вся палитра и типографика
```

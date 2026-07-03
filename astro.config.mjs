// @ts-check
import { defineConfig } from 'astro/config';
import sitemap from '@astrojs/sitemap';

// ─────────────────────────────────────────────────────────────
//  site — ОБЯЗАТЕЛЬНО поменяй на свой адрес. От него зависят
//  RSS, sitemap и OG-ссылки (превью в телеге).
//
//  Варианты:
//   • свой домен          → site: 'https://твойдомен.tld'      (base НЕ нужен)
//   • username.github.io  → site: 'https://username.github.io' (base НЕ нужен)
//   • project pages без своего домена, т.е. username.github.io/имя-репо
//                          → site: 'https://username.github.io',
//                            base: '/имя-репо'
// ─────────────────────────────────────────────────────────────
export default defineConfig({
  site: 'https://your-domain.tld',
  // base: '/имя-репо',   // ← раскомментируй ТОЛЬКО для project pages без своего домена
  integrations: [sitemap()],
  markdown: {
    shikiConfig: {
      theme: 'github-dark-dimmed',
      wrap: true,
    },
  },
});

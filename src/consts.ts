// ─────────────────────────────────────────────────────────────
//  Всё, что ты будешь менять чаще всего, живёт здесь.
//  Меняешь эти значения — меняется весь сайт.
// ─────────────────────────────────────────────────────────────

export const SITE = {
  handle: 'volo.dev',            // то, что видно в шапке
  title: 'volo.dev',             // <title> и OG
  description:
    'Бэкенд на Python/FastAPI. Держу VolodyaPN, пишу телеграм-ботов, копаюсь в железе.',
  author: 'Volodya',
  locale: 'ru-RU',
  timezone: 'MSK',               // показывается в статус-строке
};

// Ссылки в шапке (иконки). type определяет, какую иконку рисовать.
export const SOCIALS: { label: string; href: string; type: 'telegram' | 'github' | 'email' }[] = [
  { label: 'Telegram', href: 'https://t.me/yourhandle', type: 'telegram' },
  { label: 'GitHub', href: 'https://github.com/yourhandle', type: 'github' },
  { label: 'Email', href: 'mailto:you@example.com', type: 'email' },
];

// Блок «Проекты». Название → ссылка, плюс короткое описание.
export const PROJECTS: { name: string; href: string; note: string }[] = [
  {
    name: 'VolodyaPN',
    href: 'https://example.com',
    note: 'VPN-сервис на Remnawave. VLESS+Reality, свои ноды, Caddy, авто-бэкапы.',
  },
  {
    name: 'tg-shop-miniapp',
    href: 'https://example.com',
    note: 'Telegram Mini App — витрина подписок. aiogram 3.x + FastAPI.',
  },
  {
    name: 'github',
    href: 'https://github.com/yourhandle',
    note: 'Остальной код и пет-проекты.',
  },
];

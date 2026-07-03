// ─────────────────────────────────────────────────────────────
//  Всё, что ты будешь менять чаще всего, живёт здесь.
//  Меняешь эти значения — меняется весь сайт.
// ─────────────────────────────────────────────────────────────

export const SITE = {
  handle: 'volodya.dev',            // то, что видно в шапке
  title: 'volodya.dev',             // <title> и OG
  description:
    'Бэкенд на Python/FastAPI. Держу nyxa, пишу телеграм-ботов, копаюсь в железе.',
  author: 'Volodya',
  locale: 'ru-RU',
  timezone: 'SPB',               // показывается в статус-строке
};

// Ссылки в шапке (иконки). type определяет, какую иконку рисовать.
export const SOCIALS: { label: string; href: string; type: 'telegram' | 'github' | 'email' }[] = [
  { label: 'Telegram', href: 'https://t.me/volodyaceo', type: 'telegram' },
  { label: 'GitHub', href: 'https://github.com/volodyagg9', type: 'github' },
  { label: 'Email', href: 'mailto:volodyagg9@icloud.com', type: 'email' },
];

// Блок «Проекты». Название → ссылка, плюс короткое описание.
export const PROJECTS: { name: string; href: string; note: string }[] = [
  {
    name: 'nyxa',
    href: 'https://t.me/getnyxa_bot',
    note: 'Сервис защищённого интернета',
  },

  {
    name: 'github',
    href: 'https://github.com/volodyagg9',
    note: 'Остальной код и пет-проекты.',
  },
];

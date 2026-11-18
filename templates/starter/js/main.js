// local-web-studio — minimal behaviour. Site works without JS.
(() => {
  // Footer year
  document.querySelectorAll('[data-year]').forEach((el) => {
    el.textContent = new Date().getFullYear();
  });

  // Mobile menu
  const toggle = document.querySelector('.nav-toggle');
  if (toggle) {
    toggle.addEventListener('click', () => {
      const open = toggle.getAttribute('aria-expanded') === 'true';
      toggle.setAttribute('aria-expanded', String(!open));
    });
    document.addEventListener('keydown', (e) => {
      if (e.key === 'Escape') toggle.setAttribute('aria-expanded', 'false');
    });
  }

  // Click-to-load map (no request to Google until the visitor asks)
  document.querySelectorAll('.map[data-map-src]').forEach((box) => {
    const btn = box.querySelector('.map-load');
    if (!btn) return;
    btn.addEventListener('click', () => {
      const iframe = document.createElement('iframe');
      iframe.src = box.dataset.mapSrc;
      iframe.title = btn.dataset.title || 'Mapa';
      iframe.loading = 'lazy';
      iframe.referrerPolicy = 'no-referrer-when-downgrade';
      iframe.allowFullscreen = true;
      box.replaceChildren(iframe);
    });
  });

  // Contact click events for privacy-friendly analytics (Plausible/Umami/GoatCounter…)
  document.addEventListener('click', (e) => {
    const a = e.target.closest('[data-contact]');
    if (!a) return;
    const type = a.dataset.contact;
    if (window.plausible) window.plausible('Contact', { props: { type } });
    if (window.umami) window.umami.track('contact-' + type);
    if (window.goatcounter && window.goatcounter.count) {
      window.goatcounter.count({ path: 'contact-' + type, event: true });
    }
  });
})();

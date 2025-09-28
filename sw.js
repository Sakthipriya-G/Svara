self.addEventListener('install', event => {
    event.waitUntil(
      caches.open('svara-cache').then(cache => {
        return cache.addAll([
          '/',
          '/login.html',
          '/style.css',
          '/icon.jpeg'
        ]);
      })
    );
  });
  
  self.addEventListener('fetch', event => {
    event.respondWith(
      caches.match(event.request).then(response => {
        return response || fetch(event.request);
      })
    );
  });
  
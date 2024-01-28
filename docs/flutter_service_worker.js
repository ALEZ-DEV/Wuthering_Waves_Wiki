'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/canvaskit.wasm": "73584c1a3367e3eaf757647a8f5c5989",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "143af6ff368f9cd21c863bfa4274c406",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/skwasm.wasm": "2fc47c0a0c3c7af8542b601634fe9674",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"flutter.js": "7d69e653079438abfbb24b82a655b0a4",
"main.dart.js": "6bb21b8f8ee7fbeb38647e9d2a40c36b",
"version.json": "4934d0902748759925512f43c735a5bb",
"manifest.json": "1153be396099dc076f1ddcb1ff1939ef",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"index.html": "37a64dfa3e220407149b701d918fca6b",
"/": "37a64dfa3e220407149b701d918fca6b",
"assets/assets/images/wutheringwaves_gallery1.jpg": "251efe6186313af6811d24829cf77573",
"assets/assets/images/wutheringwaves_gallery2.jpg": "8db6109ba2596ab792eb161598990846",
"assets/assets/images/wutheringwaves_gallery3.jpg": "fd4ccdb9a3533a832db18b1dc0dd1952",
"assets/assets/images/wutheringwaves_gallery4.jpg": "430c4594d5f9fb9176ac33aa3b438c16",
"assets/assets/characters/anke/info.yaml": "c4489e8d3c54e9cb3b145b5445b79fed",
"assets/assets/characters/anke/images/raw.png": "80b3451d266926382fd3dec6c652f80d",
"assets/assets/characters/anke/images/profile.png": "e8081e5fd9a0d08b7711a81784b6d5af",
"assets/assets/characters/anke/images/presentation.png": "b910bfc86e02cb4e2e6a669f53fd8d87",
"assets/assets/characters/characters.yaml": "ae4d73af85b138613d4aa04206d6d5d1",
"assets/assets/characters/chixia/info.yaml": "5333d36222b19c3fef0e7f08d7a3ce31",
"assets/assets/characters/chixia/images/raw.png": "d0e1cc30fc489d4641e95fa7ed382b71",
"assets/assets/characters/chixia/images/profile.png": "cec93474b7c970bcd2c859be4e3b6d44",
"assets/assets/characters/chixia/images/presentation.png": "cc7ad6c8df954813cebb26d7f7c2db8e",
"assets/assets/characters/danjin/info.yaml": "dd0c040d3329751063da4d9b2bc1850b",
"assets/assets/characters/danjin/images/profile.png": "c1cdd6a0523cbdbf1e93d2160378154b",
"assets/assets/characters/danjin/images/raw.png": "97e7e41db5dfd679fc707421e164415e",
"assets/assets/characters/danjin/images/presentation.png": "0c629dd54e507a238980d8884d07073c",
"assets/assets/characters/jiyan/info.yaml": "8070c4a69fe88bfec5181a2faeaa6c7f",
"assets/assets/characters/jiyan/images/raw.png": "13a3b1ff39b73f15fe0f80bfd6713b0c",
"assets/assets/characters/jiyan/images/profile.png": "368f978ea2026cf4f31080ca188abae3",
"assets/assets/characters/jiyan/images/presentation.png": "a53745b34d0ce79d5ee81ad6e984b2b8",
"assets/assets/characters/rover/info.yaml": "8ed69f92ce9bcbf993bd3257723cdf5f",
"assets/assets/characters/rover/images/raw.png": "d62ead5ed8a051998fbe84eece65e1cd",
"assets/assets/characters/rover/images/profile.png": "886e965f1aa8f45ff52a1bab69b9b419",
"assets/assets/characters/rover/images/presentation.png": "972fd334fa883e1ff044c1f38ac93dcb",
"assets/assets/characters/yangyang/info.yaml": "f3c59af886202ddf1d4bda16e05edaa6",
"assets/assets/characters/yangyang/images/raw.png": "fe95e94ce4d69f8a4118998edb8ec890",
"assets/assets/characters/yangyang/images/profile.png": "34a5540f8b23ec37de5addf5be743d7d",
"assets/assets/characters/yangyang/images/presentation.png": "f12af1e833cc93cf85fc3e0362ae3b59",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/packages/youtube_player_iframe/assets/player.html": "dc7a0426386dc6fd0e4187079900aea8",
"assets/fonts/MaterialIcons-Regular.otf": "f671c7effcea499202d2e61b36e3e766",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"assets/AssetManifest.json": "76c4675f7db1283137a274df23e310bb",
"assets/AssetManifest.bin.json": "31461dd08e611ea62596b65261ad05e7",
"assets/AssetManifest.bin": "fcda3e69ffc3cf613121286ed292bb5b",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/NOTICES": "9526eb5ff635ea50c10460c64bbd419b"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}

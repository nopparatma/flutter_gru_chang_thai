'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "5433797deaf32b96b6aba62b03f9f7de",
"version.json": "87c19d17d810671fad903a65be77cd3c",
"index.html": "e4fc1cc105ed1bdd9de8a5335b8fd277",
"/": "e4fc1cc105ed1bdd9de8a5335b8fd277",
"main.dart.js": "2eb38e5fbb457829d18dc2bdffa75e43",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"favicon.png": "7edcfaef8af86f24cede9627fbe42864",
"icons/Icon-192.png": "2ea15a59dbbd54205d296da8e3d4b7bb",
"icons/Icon-512.png": "c830aa6010e91fb9c95574596bca1185",
"manifest.json": "473c0e2b03aa913943002a96eb9570cf",
"assets/AssetManifest.json": "9d6c358484488b9879fed580017c0e2f",
"assets/NOTICES": "9db5328570acb29ceb6d0008cd84d7db",
"assets/FontManifest.json": "49ff6a17d701b9478ae975bafc4f5c95",
"assets/AssetManifest.bin.json": "38748d6cef62f1110dc744d5303fd692",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/packages/fluttertoast/assets/toastify.js": "56e2c9cedd97f10e7e5f1cebd85d53e3",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "3d278dba56689d811d551f402a705e9d",
"assets/fonts/MaterialIcons-Regular.otf": "e13c3c84a46a1951324f2bd9a48c8ba3",
"assets/assets/images/image_presenter4.png": "0e0926dc4986f1b6a34d39091b9aea1b",
"assets/assets/images/image_presenter2.png": "054328a420b7e30437811a566863316c",
"assets/assets/images/image_presenter3.png": "3f4c24fca159a8a262140b0ac965308d",
"assets/assets/images/about_us_2.png": "668106fd2933b292522218219ac02a5a",
"assets/assets/images/about_us_3.png": "5b31ec23c1a6a8072924af5666ae00bb",
"assets/assets/images/about_us_1.png": "a9dc4e7a291b4ad43ae7c6452da492bd",
"assets/assets/images/about_us_4.png": "db7a2c09322057f8f1daf1b22ae12a39",
"assets/assets/images/logo_gru_chang_no_bg.png": "f2f0a9def823574d13d7f50daa8a3959",
"assets/assets/images/contact.png": "1f5bb692afdeaa296a834e02a1469917",
"assets/assets/images/p3.jpeg": "ec15822612d94313ef807486333d7f2e",
"assets/assets/images/main_background.png": "3d5c1381e7974d4d3981af692458a7e8",
"assets/assets/images/image_presenter.png": "0f93685c009f6d3be6f8cafc1fcf350b",
"assets/assets/lang/en.json": "dfd0ce1be6e92aac463e37adfad4b725",
"assets/assets/lang/th.json": "9a1ce7c526554b456fe39ad1ee6f5ee2",
"assets/assets/icons/icon_line.png": "1e7b30b9607ef15f4c7ac5aa8ac2d489",
"assets/assets/icons/icon_english.png": "7256e7e70ff031305da8083b2274e091",
"assets/assets/icons/icon_thai.png": "590eee1b0c537920b62a9670342311e9",
"assets/assets/icons/icon_youtube.png": "fea0933add0f6dc640001b622c7091cf",
"assets/assets/icons/icon_tiktok.png": "60b5286655e210ec81d7a3c80e8064d7",
"assets/assets/icons/icon_facebook.png": "f9ffe7a2f9b99179d795c5713ea35956",
"assets/assets/fonts/cloud/Cloud-Light.otf": "19aee65aab513fd489e7f5970de1bdfe",
"assets/assets/fonts/cloud/Cloud-Bold.otf": "09bb0c0cac13dfcc48ad12abbb7a4ce7",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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

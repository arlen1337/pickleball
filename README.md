# Pickleball Bracket

An installable web app for running a pickleball doubles tournament: it builds a court-by-court schedule that fits your time window, takes scores, ranks teams and seeds a top-4 playoff. It works on iPhone and Android, keeps working without internet once installed, and saves everything on the phone it's used on.

## What's in this folder

| File | What it is |
|---|---|
| `index.html` | The whole app in one file. Its code is encrypted and only runs after the scorekeeper PIN is entered |
| `sw.js` | Keeps the app on the phone so it opens without internet |
| `manifest.webmanifest` | App name, icon and colors for "Add to Home Screen" / "Install" |
| `icons/`, `fonts/` | App icons and the two typefaces, stored locally so nothing loads from outside |
| `Dockerfile`, `nginx.conf.template`, `docker-compose.yml` | Only needed for Railway or the QNAP |

Install and offline mode need **HTTPS**. GitHub Pages and Railway give you HTTPS automatically.

## Option A: GitHub Pages (free, easiest)

1. On github.com, create a new repository named `pickleball`. Make it **Public** (Pages on a free account needs a public repo). Check nothing else, then create it.
2. On the empty repo page, click **uploading an existing file**. Drag in everything from this folder, including the `icons` and `fonts` folders. Click **Commit changes**.
3. Go to **Settings → Pages**. Under *Build and deployment*, set Source to **Deploy from a branch**, Branch to **main** and folder **/ (root)**. Save.
4. In a minute or two the app is live at `https://YOUR-USERNAME.github.io/pickleball/`.

## Option B: Railway

1. Put this folder in a GitHub repo (steps 1–2 above).
2. In Railway: **New Project → Deploy from GitHub repo** and pick that repo. Railway sees the `Dockerfile` and builds it.
3. In the service's **Settings → Networking**, generate a public domain (or add your own).

## Option C: QNAP NAS

1. Copy this folder to a share on the NAS.
2. SSH in, `cd` into the folder and run `docker compose up -d --build`.
3. Open `http://NAS-IP:8085`.

Over plain `http://` on your network it works as a normal web page, but phones won't install it or run it offline. For that, put it behind HTTPS (QNAP's reverse proxy with a certificate, or a domain through Cloudflare).

## Optional: your own domain

To use something like `bracket.yourdomain.com`, add a CNAME record pointing to `YOUR-USERNAME.github.io` (GitHub Pages) or to the Railway domain, then enter the custom domain in Pages settings or Railway's Networking settings.

## Installing on phones

- **iPhone (Safari):** open the link, tap **Share**, then **Add to Home Screen**.
- **Android (Chrome):** open the link and tap **Install** on the banner in the app, or use the ⋮ menu → **Install app** / **Add to Home screen**.

Open it once with signal so it saves itself to the phone. After that it opens without internet.

## Using it

- **PIN:** the app opens to a PIN screen. Enter the scorekeeper PIN once on each phone; after that it opens straight to the bracket, even offline. **Setup → Lock app** makes that phone ask for the PIN again.

- **Setup tab:** event name, teams (4–10), courts, start time, total time, game format and playoff size. Tap **Build schedule**.
- **Schedule tab:** each round's start time and court assignments. Enter scores as games finish. **Print schedule** gives a paper copy with blank score boxes.
- **Standings tab:** live rankings with tiebreakers. **Share standings** sends a text version to a group text or post.
- **Playoffs tab:** fills in automatically when pool play is done.
- **Rules tab:** rules that match the format you picked. Read them at check-in.

## Saving and backups

Scores save on the phone the moment you tap **Save score**. Each phone has its own copy, so use one phone as the scorekeeper. To move a tournament to another phone, or keep it before you clear browser data, use **Save backup** in Setup, then **Load backup** on the other phone.

## Updating

When you get a new version, replace the files in the repo or folder. Phones pick it up the next time they open the app with signal.

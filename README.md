# Pixel Art for Games — Masterclass

A self-paced, interactive course that teaches the **classical art fundamentals** —
value, form, light, color, composition — practiced in the honest medium of pixels.

---

## ▶ How to start

**Double-click `Launch Masterclass.command`.**

That's it. It starts a small local server and opens the course in your browser.
Keep the Terminal window that appears open while you study; press **Ctrl+C** in it
to stop when you're done.

- **First time only:** macOS may say it "can't verify the developer." Right-click
  `Launch Masterclass.command` → **Open** → **Open** to approve it once.
- **If double-clicking doesn't run it:** open Terminal in this folder and run
  `bash "Launch Masterclass.command"`.
- **Requirements:** Python 3 (preinstalled on macOS) and any modern browser.

> You *can* open `index.html` directly, but then progress can't save into this
> folder (browsers block file writing from `file://` pages). Use the launch file.

---

## 📈 Your progress

When you launch via the command file, your progress **saves automatically** to
`progress.json` in this folder as you complete modules — no buttons, no exports.
It also reloads from that file each time you start, so you always pick up where you
left off.

### Keeping progress in git

- `main` keeps `progress.json` at the empty starting state, so anyone you share the
  repo with begins fresh.
- To save *your* progress, work on your **own branch** and commit `progress.json`
  there. (If you ever merge `main` into your branch, keep your version of that one
  file.)

---

## 🗂 What's in here

| Path | What it is |
|------|------------|
| `Launch Masterclass.command` | Double-click to start the course |
| `index.html` | The launcher / home page — tracks progress, opens lessons |
| `progress.json` | Your progress (auto-saved); empty on `main` |
| `modules/` | The lessons (`M0` … one folder per module) |
| `design/` | The visual style explorer (reference) |
| `README.md` | This file |

---

## 🧭 The path

**Phase 1 — Foundations** (classical art skills, in pixels): Orientation ·
Line/Shape/Silhouette · Form & Volume · Value · Light & Shadow · Color · Composition.

**Phase 2 — Applied** (fundamentals in service of game art): Characters ·
Environments & Tilesets · Isometric & Perspective · Animation ·
Style/Resolution/Materials · Game Integration — finishing with a **Capstone**.

Lessons unlock in order as you complete the one before. Each ends with a graded
assignment; drop your artwork in a `submissions/` folder as you go.

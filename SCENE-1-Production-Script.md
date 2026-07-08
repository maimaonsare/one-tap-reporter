# SCENE 1 — INTRO (0:00–0:15)
## 3D Cinematic Production Script — One-Tap Telco Problem Reporter

**Style target:** Pixar-quality 3D motion graphics × Apple product film × futuristic telecom commercial
**Total scene length:** 15 seconds · 7 generated clips · assembled in post
**Generators:** Runway Gen-4 / Kling 2.x / Veo 3 (prompts below work in all three)

---

## ⚠️ READ FIRST — Three rules that will save you hours

1. **Do NOT ask the AI to render text.** AI video models garble on-screen text ("ON HOLD...", "23:00", "TICKET", "THE PROBLEM"). Generate clean footage, then add ALL text in post (CapCut / After Effects / DaVinci Resolve). Every prompt below is written text-free, with a "POST TEXT" section telling you exactly what to overlay.
2. **Generate short, cut in edit.** Each clip below is 4–5s even if only 2–3s is used in the final timeline. Extra footage gives you trim room.
3. **Build progressively.** Generate Clip 1A first. Get the look right. Then reuse the exact same style/character wording in every following prompt — that's your consistency lock.

---

## CONSISTENCY KIT (paste into every prompt)

**Style prefix (start every prompt with this):**
> Premium cinematic 3D animated technology commercial, Pixar-quality rendering, dark matte black environment, neon green (#3DBE29) accent lighting, soft volumetric fog, floating digital particles, shallow cinematic depth of field, soft bloom on light sources, 4K, 24fps film look, photorealistic subsurface skin, Apple-advert product cinematography.

**Character block (use verbatim whenever the customer appears):**
> African man in his early 30s, short hair, dark green hoodie, expressive detailed face, realistic skin texture.

**Negative prompt (paste into the negative field where supported):**
> text, letters, numbers, captions, watermark, logo, blurry, low quality, extra fingers, deformed hands, flickering, morphing face, cartoon 2D flat style

**Color law:** Problem = red/amber. Solution = neon Safaricom green. Environment = matte black. Nothing else.

**Reference frames (cropped from the storyboard, in `reference-frames/`):**

| File | Use with | How |
|---|---|---|
| `clip1A-customer-face-only.png` | Clip 1A | Character/style reference, or image-to-video start frame (text-free — preferred) |
| `clip1A-customer.png` | Clip 1A | Style reference only — has "ON HOLD" text baked in, do NOT use as start frame |
| `clip1B-onetap-button.png` | Clip 1B | Image-to-video start frame ("ONE TAP" label is baked in — acceptable, models preserve existing text better than they generate it) |
| `clip2B-autoscan.png` | Clip 2B | Image-to-video start frame or style reference |
| `clip3A-23min-vs-10sec.png` | Clip 3A | Style reference (numbers baked in — fine as start frame too) |
| `clip4A-the-problem.png` | Clip 4A | Style reference for the title-card mood |
| `panel1-full-hook.png` | Edit | Layout guide for the diagonal split-screen composite |

In Kling/Veo use these as the **first frame** and describe the motion in the prompt. In Runway, attach as **reference images** for character/style consistency.

---

## SHOT 1 — THE HOOK (0:00–0:03)

**VO:** "One-Tap Telco Problem Reporter — a diagnostic-first support experience integrated directly into 'My OneApp' and 'SIM Toolkit'."

### CLIP 1A — The Frustrated Customer (generate 5s, use ~2.5s)

**Prompt:**
> [Style prefix] + [Character block] sits in a dark living room at night, rain streaking the window behind him, his face lit only by cold phone-screen glow. He holds a phone pressed to his ear, eyebrows furrowed, jaw tight, rubbing his forehead with his free hand, foot tapping impatiently. Camera starts in extreme close-up on the phone against his ear, then pulls back slowly into a medium shot with very subtle handheld shake. Moody, tense, cinematic lighting with a faint red-amber tint.

**POST TEXT overlays:**
- Spinning white loading ring (motion-graphics asset, soft glow)
- `ON HOLD...` — typewriter animation, white
- `23:00 WAIT TIME` — red, counts up rapidly 00:00 → 05:00 → 12:00 → 23:00, then pulses red

**SFX:** muffled hold-music loop, clock ticking, rain ambience.

### CLIP 1B — The One-Tap Button (generate 5s, use ~2.5s)

**Prompt:**
> [Style prefix] A massive glowing neon green circular button floats in a black void, surrounded by slowly rotating concentric neon rings. Camera orbits the button slowly, cinematic. A realistic human finger of an African man enters frame in slow motion, approaching the button as green energy particles gather around the fingertip. The instant the finger touches the button, a massive green energy ripple shockwave expands outward in three waves, filling the frame with light streaks, volumetric particles and expanding energy rings.

**POST TEXT:** `ONE TAP` centered on the button (bold white, subtle 3D bevel).

**EDIT NOTE — the split-screen transition:** In your editor, wipe a diagonal light-beam across Clip 1A at ~1.5s to reveal Clip 1B on the right side (matches the storyboard's diagonal split). Kill all audio dead on the tap → one huge bass impact → digital whoosh into Shot 2.

---

## SHOT 2 — THE MECHANISM (0:03–0:08)

**VO:** "It's an automated diagnostic and ticketing tool that captures real-time technical data—"

### CLIP 2A — Fly Through the Ripple (generate 4s, use ~1.5s)

**Prompt:**
> [Style prefix] Camera flies forward at high speed through an expanding tunnel of green energy ripples, bursting out into a vast black infinity room with a glowing green grid floor, soft volumetric fog and floating digital particles. In the center, a sleek smartphone floats in mid-air, rotating slowly, edges glowing neon green. Camera decelerates into a slow cinematic dolly-in toward the phone.

### CLIP 2B — The Auto-Scan (generate 8–10s, use ~4s)

**Prompt:**
> [Style prefix] A smartphone floats rotating slowly in a black infinity room with a green grid floor. One by one, glowing holographic icons fly in and lock into orbit around the phone, each connecting to it with a thin beam of green light: a signal-bars icon with bars filling upward, a cell tower rising from the floor emitting expanding radio waves, a rotating phone blueprint with technical wireframe lines, a location pin dropping from above creating a small shockwave on impact, a cloud icon streaming data particles into the phone, and an unfolding document with scrolling holographic data. The phone glows brighter as each connection lands, green energy pulses traveling up its edges. Finally a large green checkmark flashes above the phone with a burst of light, and a glowing holographic ticket rises from an explosion of light on the floor beneath it.

**POST TEXT:**
- `AUTO-SCAN IN PROGRESS...` — glitch-in animation, neon green, top of frame
- Icon labels as each locks in: `SIGNAL` · `NETWORK` · `DEVICE INFO` · `LOCATION` · `SERVICE STATUS` · `DIAGNOSTIC DATA`
- `TICKET` on the rising ticket at the end

**SFX:** digital beeps per icon lock, scanner sweeps, rising synth build, confirmation chime on the checkmark.

**FALLBACK:** If one clip can't handle all six icons cleanly, split into 2B-i (signal, network, device) and 2B-ii (location, cloud, document → checkmark → ticket) using the same prompt skeleton.

---

## SHOT 3 — THE PAYOFF (0:08–0:13)

**VO:** "...resolving customer issues faster and more accurately."

### CLIP 3A — Old vs New (generate 5s, use ~3s)

**Prompt:**
> [Style prefix] Dramatic dark stage split into two halves. Left half: a heavy industrial dark-red metallic 3D block, cracked and weathered, surrounded by red smoke, dust particles and glitch distortion, shaking slightly under its own weight, lit by a harsh red glow from the floor. Right half: a sleek clean neon-green glass panel floating weightlessly upward, elegant and modern, lit by a bright green glow from the floor. Camera pushes in fast, hero commercial style.

**POST TEXT:**
- Left block: `23 MIN` — massive red numerals, heavy shake
- Right panel: `10 SEC` — bright neon green, clean
- Header: `RESOLVING CUSTOMER ISSUES` / `FASTER & MORE ACCURATELY` — word-by-word with light bursts

### CLIP 3B — The Transformation Arrow (generate 4s, use ~2s)

**Prompt:**
> [Style prefix] On the same dark split stage, a massive glowing green 3D arrow grows from the center of frame, sweeping from the red left side toward the green right side. As it sweeps, red smoke and red particles dissolve away and green light floods the entire stage, energy particles trailing the arrow.

**SFX:** heavy stamp THUD on the red block, bright success chime as green takes over, music energy peaks.

---

## SHOT 4 — THE TURN (0:13–0:15)

**VO:** "Here's the problem it solves."

### CLIP 4A — Title Card (generate 5s, use ~2s)

**Prompt:**
> [Style prefix] All green energy collapses inward to a single point and the screen falls to near-black. In the darkness, faint floating digital particles and thin green holographic network lines drift very slowly. A soft green glow builds at center frame. Slow dramatic camera push-in. Minimal, ominous, cinematic — the calm before a reveal.

**POST TEXT:**
- `THE PROBLEM` — large 3D metallic letters rising forward from darkness, neon edges illuminating (build in your editor's 3D text tool, or Canva/AE template)
- Above it: message-bubble icon → checkmark appears inside → soft glow (simple motion-graphics animation)

**SOUND:** music cuts to silence on the wipe → one deep cinematic bass note → low ambient rumble → one distant digital pulse. This hands off to Scene 2 (the dropped-call story).

---

## ASSEMBLY TIMELINE

| Final time | Clip | Trim to | Transition out |
|---|---|---|---|
| 0:00–0:015 | 1A | 1.5s | diagonal light-beam wipe |
| 0:015–0:03 | 1B | 1.5s | ripple consumes screen (audio: bass impact) |
| 0:03–0:045 | 2A | 1.5s | straight cut (motion match) |
| 0:045–0:08 | 2B | 3.5s | ticket launches up / whip up |
| 0:08–0:11 | 3A | 3s | straight cut |
| 0:11–0:13 | 3B | 2s | green energy collapse wipe |
| 0:13–0:15 | 4A | 2s | hold black → Scene 2 |

Record VO last, lay it over the assembled cut, then nudge cuts ±5 frames to land on VO beats.

---

## PROGRESSIVE BUILD PLAN (start small)

1. **Clip 1A only.** This is the hardest clip (human face + emotion). Iterate until the character and lighting feel right. Use `reference-frames/clip1A-customer-face-only.png` as the image-to-video start frame — far more consistent than text-to-video for characters.
2. **Clip 1B.** Nail the tap + ripple. Start from `reference-frames/clip1B-onetap-button.png`. This ripple is your brand motif — it reappears in Scene 5, so save the best take.
3. **Clips 2A + 2B.** Pure motion graphics — easier. Use `reference-frames/clip2B-autoscan.png` as the start frame for 2B.
4. **Clips 3A + 3B + 4A.** Simplest of all (abstract shapes, no characters).
5. **Assemble** silent cut → **add post text** → **add SFX/music** → **record VO** → final timing pass.
6. Only then move to Scene 2 (0:15–0:30, the dropped-call story) using the same consistency kit.

---

## MASTER PROMPT (single-shot version, if a generator supports 15s)

> Create a premium Pixar-quality 3D technology commercial. Dark cinematic environment with neon green (#3DBE29) lighting, volumetric fog, floating digital particles, cinematic depth of field, 4K, 24fps film look. Sequence: (1) An African man in his early 30s in a dark rainy living room, frustrated on a phone call, face lit by phone glow, camera pulls back from extreme close-up; (2) diagonal light wipe to a giant glowing green circular button in concentric neon rings — a finger taps it in slow motion triggering a massive green energy ripple; (3) camera flies through the ripple into a black infinity room with a green grid floor where a smartphone floats while holographic icons (signal bars, cell tower, device blueprint, location pin, cloud, document) fly in and connect to it, ending in a green checkmark flash and a glowing ticket rising from the floor; (4) dark split stage — heavy cracked red industrial block on the left, sleek floating green glass panel on the right, a giant green arrow sweeps left-to-right dissolving the red into green; (5) everything collapses to black with faint drifting particles and a soft green glow building at center. No on-screen text anywhere.

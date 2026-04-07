# CleanCLI

> **Safe Windows Cache & Junk Cleaner**

CleanCLI is a lightweight Windows Batch utility built to safely remove unnecessary cache, temp, junk, and rebuildable files from Windows PCs without touching personal files, source code, or project folders.

## Quick Start

1. Download or clone this repository.
2. Right-click the batch script and choose **Run as administrator**.
3. Select the cleaning mode you want from the menu.
4. Review the output and run only the sections you actually need.

> This project is open, readable, and user-controlled. It is not malware, not a hidden cleaner, and not a random unsafe script.

## What Is This?

CleanCLI is a `.bat`-based Windows cleaner for users who want a simple, transparent way to recover disk space from safe-to-remove cache and junk files.

It focuses on locations that commonly grow over time on Windows systems, especially on the `C:` drive, including temporary files, update leftovers, app caches, developer caches, and AI/model caches that can usually be rebuilt when needed.

## Why This Exists

This project was created for users whose Windows PCs, especially the `C:` drive, keep filling up with unnecessary cache, junk, app leftovers, developer files, AI model cache, and temporary system files, and who want a simple, safe, transparent cleaner they can inspect and run themselves.

Many cleaner tools are heavy, unclear about what they remove, bundled with unnecessary extras, or too aggressive. CleanCLI takes the opposite approach:

- Simple
- Inspectable
- Focused on safe cleanup targets
- Designed to stay under user control

## Who This Is For

- Regular Windows users who need a quick cleanup tool
- Developers who accumulate package and build caches
- Students using lower-storage laptops or shared PCs
- Users whose `C:` drive fills up often
- Anyone who wants a simple cleaner without installing heavy software

## Features

- `Daily Safe Clean` for common junk and temporary files
- `Developer Cache Clean` for common development caches
- `AI / Model Cache Clean` for local model and inference tool caches
- `App Cache Clean` for selected desktop app cache locations
- `Full Deep Clean` for running all supported cleanup groups together
- `Show Free Space` to check available disk space on `C:`
- `Open Windows Storage Settings` for native Windows storage tools
- `Open Disk Cleanup` for built-in Windows cleanup access
- Batch-script based, with no background services or hidden processes
- Fully readable and easy to audit before running

## What It Cleans

CleanCLI currently targets safe-to-remove or rebuildable files such as:

- User temp files
- Windows temp files
- Crash dumps
- Thumbnail cache
- Recycle Bin contents
- Windows Update cache
- `pip` cache
- `npm` cache
- Gradle cache
- Hugging Face cache
- Ollama cache
- InsightFace cache
- Discord cache
- CapCut cache
- Roblox cache

## What It Does NOT Touch

CleanCLI is designed to avoid personal and project-critical data. It does **not** intentionally delete:

- Desktop files
- Downloads
- Documents
- Photos and videos
- Personal files
- Source code
- Project folders

This project is built around clearing **cache and rebuildable junk**, not user data.

## How To Use

1. Save the batch file to your PC.
2. Right-click it and run it as **Administrator**.
3. Choose one of the menu options:
   - `1` Daily Safe Clean
   - `2` Developer Cache Clean
   - `3` AI / Model Cache Clean
   - `4` App Cache Clean
   - `5` Full Deep Clean
   - `6` Show Free Space
   - `7` Open Storage Settings
   - `8` Open Disk Cleanup
4. Let the script finish, then review available free space if needed.

## Recommended Usage

- Use `Daily Safe Clean` for routine maintenance
- Use `Developer Cache Clean` only if you actively use Python, Node.js, or Gradle
- Use `AI / Model Cache Clean` only if you use local AI/model tools and want to reclaim storage
- Use `App Cache Clean` when Discord, CapCut, or Roblox caches grow too large
- Use `Full Deep Clean` when your `C:` drive is under pressure and you understand the selected caches may need to rebuild later

## Why Use This Instead of Random Cleaner Tools?

- You can read the script yourself
- There are no hidden background processes
- There is no forced install
- There is no bundled bloatware
- The cleanup targets are explicit
- It focuses on cache and junk, not personal data
- It gives users direct control over what gets cleaned

For many users, trust matters more than features. CleanCLI is meant to be understandable first, convenient second.

## Safety

CleanCLI is designed with a safety-first mindset:

- It targets temporary, cache, junk, and rebuildable files
- It does not intentionally target user documents or personal media
- It does not scan private files for content
- It does not run as a hidden service or background cleaner
- It is meant to be inspected, modified, and run by the user directly

Use at your own responsibility, but with confidence: this utility is intended to be transparent, conservative, and practical, not aggressive or deceptive.

## Requirements

- Windows PC
- Command Prompt / Batch script support
- Administrator privileges for full cleanup functionality
- Optional developer tools if you want those cache-clean commands to work fully:
  - `pip`
  - `npm`
  - Gradle-related directories

## Limitations

- This is a Windows-only `.bat` utility
- Some cache locations may vary by app version or custom install path
- Some files may be locked while apps are open
- Certain caches may rebuild after the next app launch
- Free space reporting is basic and intended for quick checks
- The script is intentionally conservative and does not attempt advanced system optimization

## Future Plans

- Improve free space reporting with more readable units
- Add clearer success and skipped-item reporting
- Expand optional cleanup profiles for more developer tools
- Add more app-specific cache targets where safety is clear
- Improve logging and transparency for each cleanup step
- Refine naming and packaging for easier GitHub distribution

## License

This project is open-source and intended to be easy to inspect and use.

If you are publishing this repository, add your preferred license here, for example:

- `MIT`
- `Apache-2.0`
- `GPL-3.0`

## Built By

Built by the CleanCLI project author for Windows users who want a safer, simpler, and more transparent way to recover disk space without trusting opaque cleaner software.

---
layout: page
title: Hacks
permalink: /hacks/
---

## Shell Commands

Take note and describe the type of shell commands you are using through Terminal in this installation procedure.

During the installation procedure, I used the following shell commands:

- **`cd`**: Changes the directory. I used this to navigate between folders.
- **`git`**: Manages Git repositories. I used `git clone` to download repositories from GitHub.
- **`apt`**: A package manager for Linux-based systems. I used `apt` to install required packages.
- **`brew`**: A package manager for macOS. I used it to install developer tools on my Mac.

## Version Control

In the development process, developers use version control. Annotate in your notes what you have learned about version control during this setup process.

Version control allows tracking changes in code over time. I used **Git** to manage version control.

- **Cloning**: The `git clone` command was used to copy a GitHub repository onto my local machine.
- **Navigation**: After cloning, I navigated to the project directory using the `cd` command.
- **Updating Files**: To update files on GitHub, I made changes locally, committed them using `git commit`, and then pushed the changes back to GitHub using `git push`.
- **Template Update**: I would pull the latest changes from `studentcsa` using `git pull` and then modify the repository to suit the specific course requirements by editing the necessary files.

## Localhost vs. Deployed Server

Put into words the difference between viewing GitHub Pages running on your localhost machine versus running on a deployed server.

- **Localhost**: Running on localhost allows you to view the project only on your own machine, using a URL like `127.0.0.1:4100`. No one else can access this URL.
- **Deployed Server**: When deployed to GitHub Pages, your project is available online with a public URL, such as `https://imaad08.github.io/studentcsa`. Anyone with the URL can view the site.

## DNS and GitHub Pages

DNS is the address manager for the internet. Reflect on the following questions:

- **Is there a domain on your GitHub Pages?**
  - yes, GitHub Pages uses a subdomain of `github.io` by default.
- **Is the URL for your GitHub Pages different from your neighbors' URLs?**
  - Yes, the URL is unique because it includes my personal GitHub username and repository name.
- **Did you change the URL? If so, when?**
  - I have not changed the URL. However, custom domains can be set up using DNS configurations in GitHub Pages settings.

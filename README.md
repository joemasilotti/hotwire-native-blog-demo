# Blog application for Hotwire Native demos

Use this simple Rails blogging site to demo Hotwire Native apps.

![Screenshot of the application running in the browser, on the iOS simulator, and on the Android emulator.](/.github/images/screenshot.png)

## Quick start

1. `bin/setup`
1. `bin/rails server`

## Requirements

* Ruby 3.4.2
* [SQLite](https://www.sqlite.org/index.html) - `brew install sqlite`
* [libvips](https://github.com/libvips/libvips) - `brew install vips`

## Initial setup

An installation script is included with the repository that will get the application set up.

```bash
bin/setup
```

## Development

Start the server.

```bash
bin/rails server
```

## Seeds

Seeding the database, either via `bin/rails db:seed` or during `bin/setup`, creates a few blog posts.

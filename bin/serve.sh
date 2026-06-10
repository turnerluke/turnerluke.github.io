#!/usr/bin/env bash
# Serve the site locally via Docker (no local Ruby needed).
# Uses the `github-pages` gem set, matching GitHub Pages production.
# Gems are cached in ./vendor/bundle after the first run.
#
#   ./bin/serve.sh          # serve at http://localhost:4000
#   ./bin/serve.sh build    # one-off build into ./_site
set -euo pipefail

cd "$(dirname "$0")/.."

CMD="bundle install --quiet && bundle exec jekyll serve --host 0.0.0.0 --port 4000 --livereload"
[[ "${1:-}" == "build" ]] && CMD="bundle install --quiet && bundle exec jekyll build --trace"

exec docker run --rm -it \
  --user "$(id -u):$(id -g)" \
  -e HOME=/srv \
  -e BUNDLE_PATH=/srv/vendor/bundle \
  -e BUNDLE_APP_CONFIG=/srv/.bundle \
  -e PAGES_REPO_NWO=turnerluke/turnerluke.github.io \
  -p 4000:4000 -p 35729:35729 \
  -v "$PWD":/srv -w /srv \
  ruby:3.3 bash -c "$CMD"

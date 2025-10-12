#!/bin/bash
set -ex

# Pull translation from Transifex
cd `dirname $0`
[ -d .tx ] || exit 1
rm -R ja || true
tx pull -l ja

# Update LC_MESSAGES/*.po
cd ..
sphinx-build -T -b gettext foamlib/docs locale/pot
sphinx-intl update -p locale/pot -l ja -d locale

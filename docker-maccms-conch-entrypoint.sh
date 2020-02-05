#!/bin/sh
set -e

sed -i "s/\([']template_dir['][^']*\)['][^']*[']\(.*\)/\1'conch'\2/" /var/www/html/application/extra/maccms.php

sed -i "s/\([']mob_template_dir['][^']*\)['][^']*[']\(.*\)/\1'conch'\2/" /var/www/html/application/extra/maccms.php

has_old=$(cat README.md | grep "[^/]*[^/]/*/admin/conch/theme")
if [ -z "$has_old" ]; then
    echo "" >> README.md; \
    echo "海螺主题设置,/${MACCMS_ADMIN_FILENAME}/admin/conch/theme\c" >> README.md
fi

source docker-maccms-entrypoint.sh
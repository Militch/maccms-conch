#!/bin/sh
set -e

cd /var/www/html
sed -i "s/\([']template_dir['][^']*\)['][^']*[']\(.*\)/\1'conch'\2/" ./application/extra/maccms.php

sed -i "s/\([']mob_template_dir['][^']*\)['][^']*[']\(.*\)/\1'conch'\2/" ./application/extra/maccms.php

has_old=$(cat ./application/data/config/quickmenu.txt | grep "[^/]*[^/]/*/admin/conch/theme")
if [ -z "$has_old" ]; then
    echo "" >> ./application/data/config/quickmenu.txt; \
    echo "海螺主题设置,/${MACCMS_ADMIN_FILENAME}/admin/conch/theme\c" >> ./application/data/config/quickmenu.txt
fi

source docker-maccms-entrypoint.sh
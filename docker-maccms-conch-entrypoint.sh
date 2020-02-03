#!/bin/sh
set -e

sed -i "s/\([']template_dir['][^']*\)['][^']*[']\(.*\)/\1'conch'\2/" /var/www/html/application/extra/maccms.php

sed -i "s/\([']mob_template_dir['][^']*\)['][^']*[']\(.*\)/\1'conch'\2/" /var/www/html/application/extra/maccms.php

echo "海螺主题设置,/${MACCMS_ADMIN_FILENAME}/admin/conch/theme"
cat >> /var/www/html/application/data/config/quickmenu.txt <<EOF

海螺主题设置,/${MACCMS_ADMIN_FILENAME}/admin/conch/theme
EOF

source docker-maccms-entrypoint.sh
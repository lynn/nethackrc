#!/usr/bin/env bash
set -e
echo -n 'Username: '
read username
echo -n 'Password: '
read -s password
echo
echo
echo '* Logging in...'
rm -f __cookie
curl -s -c __cookie 'https://alt.org/nethack/login.php' \
    --data-urlencode "nao_username=$username" \
    --data-urlencode "nao_password=$password" \
    --data-urlencode 'submit=Login' \
    --compressed
echo '* Uploading nethack-362.rc...'
curl --progress-bar -o /dev/null -b __cookie -c __cookie 'https://alt.org/nethack/webconf/nhrc_edit.php' \
    --data-urlencode 'rcdata@nethack-362.rc' \
    --data-urlencode 'submit=Save' \
    --compressed
rm -f __cookie
echo '* Done!'


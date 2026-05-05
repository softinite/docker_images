# acl.auth.php
# <?php exit()?>
# Don't modify the lines above
#
# none 0
# read 1
# edit 2
# create 4
# upload 8
# delete 16
#
# Anonymous (@ALL): no access. @user 8 = permission *level* 8 (see legend above).
# DokuWiki checks with >= against AUTH_READ/EDIT/CREATE/UPLOAD, so 8 grants read
# through upload (not upload-only; values are ordered, not separate bit flags).
# Superuser (admin) is defined in local.protected.php.

* @ALL 0
* @user 8

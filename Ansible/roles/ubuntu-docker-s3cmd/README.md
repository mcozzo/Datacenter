################################################################################
# rsync
################################################################################

https://www.ispcolohost.com/2013/10/23/s3fs-rsync-recommendations/

rsync -avW --progress --inplace --size-only

################################################################################
# Folder used space
################################################################################

du -h -d1 /mnt/media/

################################################################################
# s3cmd
################################################################################

https://manpages.ubuntu.com/manpages/xenial/man1/s3cmd.1.html 

#Use MD5 to check files after the initial sync

sudo s3cmd --progress --no-check-md5 -v -c /etc/passwd-s3cmd sync <SRC> s3://cozzo4kmovies/
sudo s3cmd --progress --no-check-md5 -v -c /etc/passwd-s3cmd sync <SRC> s3://cozzomovies/
sudo s3cmd --progress --no-check-md5 -v -c /etc/passwd-s3cmd sync <SRC> s3://cozzotv/


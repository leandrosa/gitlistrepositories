timestamp() {
  date "+%Y/%m/%d %H:%M:%S"
}

function log()
{
    message=$1;
    echo [`timestamp`]: $message;
}

rootpath=`pwd`;

filename=gitlistrepo_$(date "+%Y%m%d_%H%M%S").txt;
fullfilename="$rootpath/$filename";

log "Start"

echo "directory; git_repository" >> $fullfilename;
for d in `find $rootpath -name .git -type d -exec dirname {} \;`; 
do cd $d;
log "processing directory: $d"
echo ${d/$rootpath/}";" `git remote get-url origin` >> $fullfilename;
done

log "End";
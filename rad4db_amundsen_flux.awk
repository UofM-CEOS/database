#! /usr/bin/gawk -f
# Author: Sebastian Luque
# Created: 2014-02-07T17:50:24+0000
# Last-Updated: 2015-06-30T18:47:21+0000
#           By: Sebastian P. Luque
# -------------------------------------------------------------------------
# Commentary: 
# 
# We prepare a table with all records from RAD files to be loaded into the
# database.
#
# Example call (file written in current directory):
#
# rad4db.awk *.dat > rad_all.csv
# -------------------------------------------------------------------------
# Code:

BEGIN {
    FS=OFS=","
    ncols=26			# number of columns
}

FNR > 1 {
    gsub(/"/, "")
    date_time=sprintf("%s-%s-%s %s:%s:%s", $1, $2, $3, $4, $5, $6)
    printf "%s,", date_time
    for (i=7; i <= (ncols - 1); i++) { printf "%s,", $i }
    print $ncols
}
	



##_ + Emacs Local Variables
# Local variables:
# allout-layout: (-2 + : 0)
# End:

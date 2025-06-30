#!/bin/bash

# This checks if the number of arguments is correct
# If the number of arguments is incorrect ( $# != 2) print error message and exit
if [[ $# != 2 ]]
then
  echo "backup.sh target_directory_name destination_directory_name"
  exit
fi

# This checks if argument 1 and argument 2 are valid directory paths
if [[ ! -d $1 ]] || [[ ! -d $2 ]]
then
  echo "Invalid directory path provided"
  exit
fi

# [TASK 1]
targetDirectory="$1"
destinationDirectory="$2"


# [TASK 2]
echo "Target Directory=$targetDirectory"
echo "Destination Directory=$destinationDirectory"

# [TASK 3]
currentTS=$(date +%s)


# [TASK 4]
backupFileName="backup-[$currentTS].tar.gz"

# We're going to:
  # 1: Go into the target directory
  # 2: Create the backup file
  # 3: Move the backup file to the destination directory

# To make things easier, we will define some useful variables...

# [TASK 5]
origAbsPath=`pwd`

# [TASK 6]this task updated after excuting the scrip 

# [TASK 6] --- CORRECTED METHOD TO GET ABSOLUTE PATH AND SET VARIABLE ---

# Save the current working directory.
# This variable will be accessible throughout the rest of the script.
OLD_SCRIPT_CWD=$(pwd)

# Temporarily change to the destination directory.
# The '|| exit 1' ensures the script stops if the directory is inaccessible.
cd "$destinationDirectory" || { echo "Error: Could not change to destination directory: $destinationDirectory"; exit 1; }

# Get the absolute path of the destination directory.
# This correctly assigns the value to destAbsPath in the main script's scope.
destAbsPath=$(pwd) # NOTE: Changed variable name from destDirAbsPath to destAbsPath for consistency with TASK 13

# Change back to the original working directory for subsequent operations (like [TASK 7]).
cd "$OLD_SCRIPT_CWD" || { echo "Error: Could not return to original script directory."; exit 1; }
# [TASK 7]
cd "$origAbsPath" 
cd "$targetDirectory"

# [TASK 8]
yesterdayTS=$(($currentTS-24*60*60))

declare -a toBackup


for file in *  # [TASK 9]
do

  # [TASK 10]
  if [[ `date -r $file +%s` -gt $yesterdayTS ]]
  then toBackup+=($file)
   
    # [TASK 11]

  fi
done

# [TASK 12]
tar -czvf "$backupFileName" "${toBackup[@]}"

# [TASK 13]
mv "$backupFileName" "$destAbsPath"
# Congratulations! You completed the final project for this course!

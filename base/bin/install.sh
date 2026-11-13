#!/bin/sh

###
### (C) Copyright IBM Corp. 2021
###

# High level qualifier of the GenApp target data sets - by default is username.GENAPP
GENAPP=${USER}.GENAPP

# Find path to this script
SCRIPT_DIR=$(dirname "$0")

# Path to the GenApp base component
BASE_DIR="${SCRIPT_DIR}/.."

# Copy all of the cntl/ files
tsocmd "ALLOCATE DSNAME('${GENAPP}.CNTL') NEW SPACE(2,1) CYLINDERS BLKSIZE(0) LRECL(80) RECFM(F,B) DSORG(PO) DSNTYPE(LIBRARY)"
if [ $? -eq 0 ]; then
    echo "Allocated ${GENAPP}.CNTL"
else
    echo "Failed to allocate ${GENAPP}.CNTL"
fi
cp -O u -A -T ${BASE_DIR}/cntl/*.jcl "//'${GENAPP}.CNTL'"
if [ $? -eq 0 ]; then
    echo "Copied cntl/*.jcl to ${GENAPP}.CNTL"
else
    echo "Failed to copy cntl/*.jcl to ${GENAPP}.CNTL"
fi

# Copy all of the exec/ files
tsocmd "ALLOCATE DSNAME('${GENAPP}.EXEC') NEW SPACE(1,1) CYLINDERS BLKSIZE(0) LRECL(80) RECFM(F,B) DSORG(PO) DSNTYPE(LIBRARY)"
if [ $? -eq 0 ]; then
    echo "Allocated ${GENAPP}.EXEC"
else
    echo "Failed to allocate ${GENAPP}.EXEC"
fi
cp -O u -A -T ${BASE_DIR}/exec/*.rexx "//'${GENAPP}.EXEC'"
if [ $? -eq 0 ]; then
    echo "Copied exec/*.rexx to ${GENAPP}.EXEC"
else
    echo "Failed to copy exec/*.rexx to ${GENAPP}.EXEC"
fi

# Copy all of the src/ files
tsocmd "ALLOCATE DSNAME('${GENAPP}.SRC')  NEW SPACE(2,1) CYLINDERS BLKSIZE(0) LRECL(80) RECFM(F,B) DSORG(PO) DSNTYPE(LIBRARY)"
if [ $? -eq 0 ]; then
    echo "Allocated ${GENAPP}.SRC"
else
    echo "Failed to allocate ${GENAPP}.SRC"
fi
cp -O u -A -T ${BASE_DIR}/src/*.bms "//'${GENAPP}.SRC'"
if [ $? -eq 0 ]; then
    echo "Copied src/*.bms to ${GENAPP}.SRC"
else
    echo "Failed to copy src/*.bms to ${GENAPP}.SRC"
fi
cp -O u -A -T ${BASE_DIR}/src/*.cbl "//'${GENAPP}.SRC'"
if [ $? -eq 0 ]; then
    echo "Copied src/*.cbl to ${GENAPP}.SRC"
else
    echo "Failed to copy src/*.cbl to ${GENAPP}.SRC"
fi
cp -O u -A -T ${BASE_DIR}/src/*.cpy "//'${GENAPP}.SRC'"
if [ $? -eq 0 ]; then
    echo "Copied src/*.cpy to ${GENAPP}.SRC"
else
    echo "Failed to copy src/*.cpy to ${GENAPP}.SRC"
fi
cp -O u -A -T ${BASE_DIR}/src/*.txt "//'${GENAPP}.SRC'"
if [ $? -eq 0 ]; then
    echo "Copied src/*.txt to ${GENAPP}.SRC"
else
    echo "Failed to copy src/*.txt to ${GENAPP}.SRC"
fi

# Copy all of the wsim/ files
tsocmd "ALLOCATE DSNAME('${GENAPP}.WSIM') NEW SPACE(4,1) CYLINDERS BLKSIZE(0) LRECL(80) RECFM(F,B) DSORG(PO) DSNTYPE(LIBRARY)"
if [ $? -eq 0 ]; then
    echo "Allocated ${GENAPP}.WSIM"
else
    echo "Failed to allocate ${GENAPP}.WSIM"
fi
cp -O u -A -T ${BASE_DIR}/wsim/*.txt "//'${GENAPP}.WSIM'"
if [ $? -eq 0 ]; then
    echo "Copied wsim/*.txt to ${GENAPP}.WSIM"
else
    echo "Failed to copy wsim/*.txt to ${GENAPP}.WSIM"
fi

# Copy the data/ files
cp -O u -T -W "seqparms='RECFM=FB,LRECL=225,BLKSIZE=0,SPACE=(CYL,(1,1))'" ${BASE_DIR}/data/ksdscust.txt "//'${GENAPP}.KSDSCUST.TXT'"
if [ $? -eq 0 ]; then
    echo "Copied ksdscust.txt to MVS"
else
    echo "Failed to copy ksdscust.txt to MVS"
fi
cp -O u -T -W "seqparms='RECFM=FB,LRECL=64,BLKSIZE=0,SPACE=(CYL,(1,1))'" ${BASE_DIR}/data/ksdspoly.txt "//'${GENAPP}.KSDSPOLY.TXT'"
if [ $? -eq 0 ]; then
    echo "Copied ksdspoly.txt to MVS"
else
    echo "Failed to copy ksdspoly.txt to MVS"
fi

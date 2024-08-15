#!/bin/bash
cd $PROJECT_DIR

fhir restore
sushi .

retVal=$?
if [ $retVal -ne 0 ]; then
    printf "\nBuild failed! \n"
else
    printf "\nBuild successful! \n"
fi

exit $retVal

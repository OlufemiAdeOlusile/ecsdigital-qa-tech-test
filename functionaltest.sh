#!/bin/bash

# Functional test

echo "Build App Image"

docker build -t ecsd-tech-test:femtag .

docker-compose up -d

echo "********** App Running ************"

cd src/test/e2e/

docker-compose -f docker-compose.chrome.yml up -d

echo "************ Chrome Selenium Image and Container Running ************"

docker-compose up

echo "************ Please view the above for test result link ************"

docker-compose -f docker-compose.chrome.yml down

echo "************ Chrome container spun down ************"

cd ../../..

docker-compose down

echo "************ App container spun down ************"






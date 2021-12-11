#!/bin/bash

cd ~/dev/guild-golang/poc-appsync-golang-mongo/lambdas

CGO_ENABLED=0 GOOS=linux go build -mod=readonly -v -o ~/dev/guild-golang/poc-appsync-golang-mongo/lambdas/build/company_create/main functions/company/create/main.go
build-lambda-zip.exe -o ~/dev/guild-golang/poc-appsync-golang-mongo/lambdas/build/company_create/main.zip build/company_create/main

CGO_ENABLED=0 GOOS=linux go build -mod=readonly -v -o ~/dev/guild-golang/poc-appsync-golang-mongo/lambdas/build/company_delete/main functions/company/delete/main.go
build-lambda-zip.exe -o ~/dev/guild-golang/poc-appsync-golang-mongo/lambdas/build/company_delete/main.zip build/company_delete/main

CGO_ENABLED=0 GOOS=linux go build -mod=readonly -v -o ~/dev/guild-golang/poc-appsync-golang-mongo/lambdas/build/company_get/main functions/company/get/main.go
build-lambda-zip.exe -o ~/dev/guild-golang/poc-appsync-golang-mongo/lambdas/build/company_get/main.zip build/company_get/main

CGO_ENABLED=0 GOOS=linux go build -mod=readonly -v -o ~/dev/guild-golang/poc-appsync-golang-mongo/lambdas/build/company_update/main functions/company/update/main.go
build-lambda-zip.exe -o ~/dev/guild-golang/poc-appsync-golang-mongo/lambdas/build/company_update/main.zip build/company_update/main


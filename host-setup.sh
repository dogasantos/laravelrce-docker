#!/bin/bash
# credits: https://hackmag.com/coding/laravel-ignition-rce/
docker pull debian
docker run -ti --name="laravelrce" -p8080:80 debian /bin/bash


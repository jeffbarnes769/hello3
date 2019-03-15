# AquaSec Microscanner
Running Opensource AquaSec microscanner https://github.com/aquasecurity/microscanner to scan an image for vulnerabilites, and post the output to an html file

Add to your Dockerfile
```
RUN /microscanner --html ${token} > /stage1.html --continue-on-failure
```
To start: build the image
```
$ docker build --build-arg=token=**your token here** -t hello:v0 .
```
Determine final build container from the docker build output, from "Successfully built XXXXXXXXXXXX" </br>
Copy the microscanner html output from the docker container to the local filesystem
```
$./copy.sh XXXXXXXXXXXX 
```
As we can see, **From golang** exposes a number of vulnerabilities in our image https://jeffbarnes769.github.io/files/stage1.html

Specifying Alpine **From golang:alpine** as the base os, and (better still) applying updates, reduces vulnerabilities in a container image
https://jeffbarnes769.github.io/files/stage1%20-%201.html

Thanks to Liz Rice <https://www.lizrice.com/> for the demo at https://asciinema.org/a/186087

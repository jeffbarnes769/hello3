# hello3
Running Opensource AquaSec microscanner to scan an image for vulnerabilites, and post the output to an html file

RUN /microscanner --html ${token} > /stage1.html --continue-on-failure

To start: build the image

$ docker build --build-arg=token= your token here -t hello:v0 .

Determine final build container from the docker build output, something like "Successfully built XXXXXXXXXXXX"

$ run ./copy.sh <XXXXXXXXXXXX> to copy the microsocanner html output from the docker container to the local filesystem

As we can see "From golang" exposes a number of vulnerabilities in our image <http://htmlpreview.github.io/?https://github.com/jeffbarnes769/hello3/blob/master/stage1.html> 

Specifying Alpine "From golang:alpine" as the base os, and (better still) applying updates, reduces vulnerabilities in a container image
http://htmlpreview.github.io/?https://github.com/jeffbarnes769/hello3/blob/master/stage1%20-%201.html


# hello3

docker build --build-arg=token=<your token here> -t hello:v0 .

Determine final build container from the docker build output, something like "Successfully built XXXXXXXXXXXX"

run ./copy.sh <XXXXXXXXXXXX> to copy the microsocanner html output from the docker container to the local filesystem

Preview the output <http://htmlpreview.github.io/?https://github.com/jeffbarnes769/hello3/blob/master/stage1.html> for vulnerabilities


First build the docker image:

    docker build -t baka:devel .

Then run the docker-compose:
    
    docker-compose up


After that, use `request.sh` to test the response times.
Chain multiple request.sh calls with `&`, it's not pretty but it will do.

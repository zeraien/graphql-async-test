First build the docker image:

    docker build -t baka:devel .

Then run the docker-compose:
    
    docker-compose up


After that, use `request.sh N` to test the response times, where `N` represents the number of concurrent calls you want to make. It will print the results to console so don't go crazy.

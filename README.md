# urbalurba-dropbox
docker image that sync thousands of profile, logos of all organisations in Norway to dropbox

Urbalurba system webscrapes all organisations in Norway and store the files in a docker volume.

This docker image syncs the files to dropbox.


## testing did not work - goint to test the ready made image

Build it

```bash
docker build -t urbalurba-dropbox:latest .
```

start it:
    
```bash
    docker compose up
```


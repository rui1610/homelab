# Explanation


In openmediavault the NFS Shares need to be created with the folllowing "Extra options": rw,sync,no_root_squash,anonuid=1000,anongid=1000,no_acl
See here: https://stackoverflow.com/questions/71133611/mount-openmediavault-nfs-in-docker-compose-yml-volume-for-docker-swarm


To run through the docker compose file run the following two commands:

````
docker compose --env-file "variables.env" build
docker compose --env-file "variables.env" up -d
````


Delete everything

````
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker volume prune -f
docker rmi $(docker images -a -q)
docker image prune -f
docker system prune -a -f
````

docker volume create --driver local --opt type=nfs --opt o=addr=192.168.178.3,rw --opt device=:/export/docker_data docker_data
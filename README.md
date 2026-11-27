# practical-plsql-demo

This repository is intended to be deployed as a docker or podman container using always free database

When the database is initialized or started, scripts will run to setup sample schemas with data and code

## repository branch structure

main - primary published branch

release/yyyy working release code

feature/yyyy development feature code

all pull requests should be targeted at the current year feature

feature branch code will be pulled into release on testing and approval

release branch code will be pulled into main on publication

## repository file structure


/projects
    /practical-base
        readme.md
        compose.yaml primary compose file compatible with docker and podman
        compose-dock.yaml docker specific compose file
        compose-pod.yaml podman specific compose file
        shell-dock.sh docker specific script to open interactive session
        shell-pod.sh podman specific scrpt to open interactive session
          /setup
               /base
          /startup 
               /base
  
     /practical-[topic-area]
          /setup
               /[topic-area]
          /startup
               /[topic-area]

/scripts
     /base
          /setup
               /base
          /startup
               /base

     /[topic-area]
          /setup
               /[topic-area]
                    /cleanup
          /startup
               /[topic-area]
          /tests

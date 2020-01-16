## evo-demo

This repo contains Dockerfile for spinning up Jenkins Configuration as Code (jcasc) with a predefined pipeline.

### Pre-install
- Clone this repo
- To create an image of Jcasc, run the following:

```bash
docker build -t evo-demo/jcasc .
```

- Run the following before starting Jcasc:
```bash
echo HOST_HOME=$PWD/workspace >> env.list
```

As current scheme uses Docker-in-Docker way for deployment, the trick above set env var in Jcasc container.
This var will be used further in the pipeline for copying files from inside Jcasc container to docker.

- Start Jcasc container:
```bash
docker run --name evo-demo -v $PWD:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -v /usr/bin/docker:/usr/bin/docker --env-file ./env.list -d -p 8080:8080 evo-demo/jcasc
```
To make Docker-in-Docker work, docker socket and executable binary are bind to Jcasc container.
Jenkins home is binded to make deployments work.

- Open browser and navigate to localhost:8080
- Run build & follow the instructions
- Open browser and navigate to localhost:<PORT_YOU_SPECIFIED> | DEFAULT:8081 to check build result


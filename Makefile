
.PHONY: jenkins

jenkins:
	@docker run --rm --name evo-demo -v /var/run/docker.sock:/var/run/docker.sock -v /usr/bin/docker:/usr/bin/docker --env-file ./env.list -d -p 8080:8080 evo-demo/jcasc

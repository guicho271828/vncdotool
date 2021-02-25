
Steps to reproduce:

* install docker
* run `make build`
* run `make run-fork` and confirm that it falls in a deadlock
* run `make run-spawn` and confirm that it runs successfully

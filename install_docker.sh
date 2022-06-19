#!/bin/bash
ansible pls -m yum -a "name=docker state=present"
ansible pls -m file -a "name=/etc/docker state=directory"
ansible pls -m copy -a "dest=/etc/docker/daemon.json src=daemon.json"
ansible pls -m systemd -a "name=docker enabled=yes state=started"
ansible pls  -a "docker version" 


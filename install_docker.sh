#!/bin/bash
ansible pls -m yum -a "name=docker state=present"
ansible pls -m user -a "name=centos groups=dockerroot,adm,systemd-journal state=present"
ansible pls -m systemd -a "name=docker enabled=yes state=started"
ansible pls  -a "docker version" 


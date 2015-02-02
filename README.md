![Alt text](https://cloud.githubusercontent.com/assets/5075567/6008656/2ec7bebe-aad8-11e4-97d8-b917efd2bf90.png)
#Things that Ansible can do, 
### And, brief tour of Dev Ops/Architectur/IT/Netwrok Admin tasks:

##Configuration Management - like Chef, Puppet or Salt
- writing a state description for our servers
  - packages
  - configuration files
  - permissions
  - services
- using a tool to enforce that state

##Deployment - like Fabric or Capistrano
- generation of binaries and assets
- copied versions of development files
- starting those services up

##Orchestration (of Deployment)
- multiple remote servers handling order of roll out
- databases brought up prior to web servers, for ex
- removing web servers out of a load balancer one at at ime to upgrade without downtime, for ex

##Provisioning (of new servers)
- spinning up of new virtual machine instances in a public cloud like Amazon EC2

#How it works:
##Playbooks - written in Yaml - essential the README
##Ansible:
  - runs all tasks in parallel across all hosts
  - waits for all hosts to complete task before iterating
  - runs tasks in specified order
  - Push Based
  - can run arbitrary shell commands on remote servers
  - Modules
    - declarative - used to describe the state you desire in your servers
    - idempotent - running them a second time will not change their state
    - reuseable component, with community support
  - very thin abstraction - you must use apt or yum modules for example, rather than new Ansible abstractions

Requirements for understanding how to use Ansible

Familiarity with one Linux Distribution (Ubuntu, CentOS, RHEL), and
Ability to:
  - connect to a remote machine using ssh
  - interact with the bash command-line shell (pipes and redirection)
  - install packages
  - use the sudo command
  - check and set file permissions
  - start and stop services
  - set environment variables
  - write scripts (any language)
Ansible uses YAML and the Jinja2 templating language

Anisble is open source, and free, including all of the modules

Vagrant, another open source tool, can be used to manage virtual machines, and will boot a Linux VM in a laptop for use as a test server

(Vagrant needs the VirtualBox virtualizer to be installed on your machine. Download VirtualBox at http://www.virtualbox.org and then download Vagrant at http:// www.vagrantup.com)


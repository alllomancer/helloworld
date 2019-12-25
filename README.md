# helloworld
Hello World for Golang containerized, auto build by travis, anb deployed to virtualbox using vagrant 
and ansible

This is a fork of https://github.com/go-training/helloworld due to the fact that the project doesnt
have a docker file, and uses the go test framework.

the docker is built and tested using travis-ci and uploaded to alllomancer/helloworld.
the docker repo is public and the travis file has secure access to upload to it.

the deployment is based on https://github.com/geerlingguy/ansible-vagrant-examples/tree/master/docker, 
once it is built it is deployed to a virtual box managed by vagrant using ansible.

# Deployment
## geting started
  This README file is inside a folder that contains a Vagrantfile (hereafter this folder shall be called the [vagrant_root]), which tells Vagrant how to set up your virtual machine in VirtualBox.
  
  To use the vagrant file, you will need to have done the following:
  
  * Download and Install VirtualBox
  * Download and Install Vagrant
  * Install Ansible
  * Open a shell prompt (Terminal app on a Mac) and cd into the folder containing the Vagrantfile
  * Run the following command to install the necessary Ansible roles for this profile: $ ansible-galaxy install -r requirements.yml

## steps  
  Once all of that is done, you can simply type in vagrant up, and Vagrant will create a new VM, install the base box, and configure it.
  
  Once the new VM is up and running (after vagrant up is complete and you're back at the command prompt), you can log into it via SSH if you'd like by typing in vagrant ssh. Otherwise, the next steps are below.



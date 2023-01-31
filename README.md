# Provisioning project

​
What did you need to do to provision a vm to run mongo db?

Ensure that Vagrant is setup on your host machine, create a Vagrantfile and configured a server using `starboard/ubuntu-arm64-20.04.5` image. Then I was able to create a [script.sh](./env/mongodb/script.sh) to automate installing MongoDB.

What did you need to do to provision a vm to:
​

- Run the node.js application?
- Use the `nology.training` alias?
- Use apache server to direct traffic to a given port?
- How are you able to pass in the DB connection string?
  ​
  Similarly, set up a Vagrantfile to provision a uBuntu server, again using `starboard/ubuntu-arm64-20.04.5` as the base image. Using [script.sh](./env/nodeapp/script.sh) I was able to automate the installation of _Node_, _NPM_, and _Apache Server_. The script then installed the required dependencies for the App and started the app running. The script was also used to configure the Apache2 server to add an alias so that the site could be accessed using an east to remember Hostname, rather than the IP address (think DNS).

  I faced some issues with working with the _HOSTS_ file, due to using VMWare Fusion and the docs not being clear on how to set a static IP, as a result I had to think outside the box and add a script that would run `hostname -I` on the mongodb instance and save the assigned IP address to a global file, which we could then access from the nodeapp and add to a `.env` file in the project, which would be read by the NPM package `dotenv`.

---

​

## General Environment Questions

​

- What are development environments?
- How do they relate to an application?

  Environments are a way for developers to run specific parts of an application in different states, depending on the Environment: such as _test_ or _production_. Things that we would use different environments for are _testing_ as we would not want to run tests on a _production_ database.

  ​

### Virtual machines

​

- What is a virtual machine?
  A virtual machine is a machine that is running inside of another machine.
- What does it allow you to do?
  They allow developers to develop in specific environments, such as linux, windows, or MacOS.
- How have you used one?
  I have used VMs inside VMWare Fusion, UTM, VirtualBox, and hosted on cloud services like AWS, Digital Ocean, and Azure. Managed several two-tier applications, with API's, Databases, and client.
  ​

### Vagrant

​

- What is vagrant?
  Vagrant is an open-source tool that helps us to automate the creation and management of Virtual Machines.
- What is a `VagrantFile`?
  A Vagrantfile is a file that is used to store the configuration details for setting up a virtual machine.
  ​

#### CLI commands

​

| Command   | What does it do?                                                                            | When did you use it?                                                                                                                               |
| --------- | ------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------- |
| reload    | Reload configuration                                                                        | When the VagrantFile is changed/edited                                                                                                             |
| up        | Initializing the virtual machines                                                           | To start/initialise the machines                                                                                                                   |
| provision | Takes a shell commands script that will be automatically done by the virtual machine        | Used it after initialization or when the shell scripts are edited                                                                                  |
| destroy   | Shuts down the virtual machines                                                             | When the virtual machines need to be stopped from running                                                                                          |
| suspend   | Saves the exact point in time of the vagrant machine rather than completely shutting it off | When further work is required to be done on the virtual machines however you don't want to have them run in the background until that work is done |
| ssh       | Allows entering the virtual environment of the the virtual machines                         | When needing to edit/create/run files that were specific to the virtual machine                                                                    |

​

#### Provisioning

​

- What is Provisioning in relation to Vagrant?
  ​Provisioners in Vagrant allow you to automatically install software, alter configurations, and more on the machine as part of the vagrant up process.

---

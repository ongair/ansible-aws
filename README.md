### Ongair Ansible API Server Configs ###


This ansible module manages the setup and deployment of the Ongair trial and production API server.
It has the following roles


**Setup**

This role prepares the API server by
 - Installing required software dependencies on the Ubuntu server
 - Creating directories where the code will be deployed
 - Configuring ssh for Github authentication


**Gunicorn**

The API is a flask application served via Gunicorn. This this role configures gunicorn as an upstart service to run the application.

**Nginx**

The API server uses nginx as a reverse proxy to route requests to the gunicorn server. This role installs and configures nginx.

**Deploy**

The deploy role updates the API server with new code from the Ongair-ansible repo by cloning the master branch.

It runs the following tasks:
- Checks out the master branch from github
- Installs any new dependencies in requirements.txt
- Restarts Gunicorn
- Restarts Nginx

**Inventory**

The inventory details (Credentials for the Ongair API server) are in the hosts file in the root directory of this project. It contains the hostname, location of the ssh key to use and the remote login user.

**Variables**

In `group_vars/all` we place the various variables that are shared by the roles.

### Setting Up The API ###

With the inventory configured with the target host details, to setup we run

```sh
ansible-playbook -i hosts setup.yml
```

#### Updating the API ####
This is also similar to setup.

```sh
ansible-playbook -i hosts deploy.yml
```

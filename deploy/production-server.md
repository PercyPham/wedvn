# Production Server

Instruction for setting up DigitalOcean's Droplet as Production Server.

## Setup

_Instructions are based on [Traversy's video](https://www.youtube.com/watch?v=hP77Rua1E0c) and [Jason Lengstorf's video](https://www.youtube.com/watch?v=kR06NoSzAXY) to setup server._

### Create Droplet

Create new DigitalOcean's Droplet [here](https://cloud.digitalocean.com/droplets/new).

1.  Choose Docker image in `Marketplace` (current time: Docker 5:19.03.1~3 on 18.04)
2.  Choose a plan
3.  Choose a datacenter region (`Singapore` - since it's nearest to Vietnam)
4.  Add SSH key (to login to droplet with ssh)
5.  Create Droplet

### Secure Droplet

#### Create new user in droplet

1. Login to droplet:<br>
   `ssh root@<droplet-ip>`
2. Create new user (save the password):<br>
   `adduser <username>`
3. Verify user exist:<br>
   `id <username>`
4. Add group 'sudo' to user:<br>
   `usermod -aG sudo <username>`
5. Add group 'docker' to user (so new user can run docker)<br>
   `usermod -aG docker <username>`
6. Switch to created user:<br>
   `su - <username>`
7. Check current user:<br>
   `whoami`

#### Setup SSH for new user

8. Create '.ssh' folder at home dir:<br>
   `mkdir ~/.ssh`
9. Make '.ssh' folder only accessible to our user:<br>
   `chmod 700 ~/.ssh`
10. Create 'authorized_keys' and put in public keys of people allowed to login this user:<br>
    `nano ~/.ssh/authorized_keys`<br>
    paste in the public key<br>
    `ctrl+X` => `y` => `enter`
11. Make 'authorized_keys' can be read and written by owner:<br>
    `chmod 600 ~/.ssh/authorized_keys`
12. Exit two times to logout ssh:<br>
    `exit` => `<exit>`
13. Login again with new user:<br>
    `ssh <username>@<droplet-ip>`<br>
    Note: if has 'Error: Permission denied (publickey)' then follow this [article](https://help.github.com/en/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#adding-your-ssh-key-to-the-ssh-agent) to solve

#### Turn off root login and password login

14. Modify ssh config with 'sudo' permission (require user's password)<br>
    `sudo nano /etc/ssh/sshd_config`<br>
    - Turn off root login:<br>
      Search for `PermitRootLogin` using `ctrl+W` and change it to `no`
    - Turn off password login:<br>
      Search for `PasswordAuthentication` and change it to `no`
    - `ctrl+X` => `y` => `enter`
15. Reload 'sshd':<br>
    `sudo systemctl reload sshd`

#### Config connection ports

16. Use Ubuntu's `ufw` tool to disable all connections that not from OpenSSH (ssh) or http (:80) or http(:443) and enable firewall (which is disabled by default)<br>
    `sudo uwf allow OpenSSH`<br>
    `sudo uwf allow http`<br>
    `sudo uwf allow https`<br>
    `sudo uwf enable` => `y`<br>
17. Check to see ports enabled<br>
    Should see OpenSSH, 80, 443 for both ipv4 and ipv6<br>
    `sudo uwf status`<br>

### Config DNS for domain

Follow this [article](https://wiki.matbao.net/kb/video-clip-huong-dan-cau-hinh-dns-tren-id-matbao-net/)

Currently on Matbao.net, add these two values to DNS config

```
Host    Type           Value           TTL
-------------------------------------------
@       A (Address)    <droplet-ip>    3600
www     A (Address)    <droplet-ip>    3600
```

### Get Project Running

#### Get project

Setup SSH for Github

- Follow [this article](https://help.github.com/en/enterprise/2.16/user/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) to setup ssh to connect github.

Clone project:

```
cd ~
git clone git@github.com:PercyPham/wedvn.git wedvn
cd wedvn
```

#### Setup SSL

This setup follows instructions from [this article](https://medium.com/@pentacent/nginx-and-lets-encrypt-with-docker-in-less-than-5-minutes-b4b8a60d3a71) to setup SSL.

Init dummy certificate by running this script:

```bash
# These scripts are executed at the root of project
chmod +x ./deploy/init-letsencrypt.sh
sudo ./deploy/init-letsencrypt.sh
```

_Note: Actually, the script above will auto do `docker-compose up` to start server after generating dummy certificate._

#### Run project

```bash
# At root of project
docker-compose up
```

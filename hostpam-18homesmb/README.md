# PAM
## @edt Sergi Muñoz Carmona ASIX M06-ASO Curs 2018-2019

## Imatge HOSTPAM en Dockerhub:
Podeu trobar les imatges docker al Dockerhub de [sergimc](https://hub.docker.com/u/sergimc/)
* **hostpam:** [hostpam](https://cloud.docker.com/repository/docker/sergimc/ldapserver) (#tag: 18homes)

Repositori d'exemples de containers docker que utilitzen PAM

 * **hostpam:18homesmb** host pam amb authenticació ldap. 
Crea els home dels usuaris i munta un cifs als usuaris.
Per poder realitzar el mount cal que el container es configuri amb l'opció **--privileged**.

#### Execució

```
docker run --rm --name host --hostname host --network sambanet --privileged -it sergimc/hostpam:18homesmb
```

#### Configuracions de fitxers per al host pam

system-auth:
```
auth        required      pam_env.so
auth        required      pam_faildelay.so delay=2000000
auth        optional      pam_mount.so
auth        sufficient    pam_unix.so nullok use_first_pass
auth        requisite     pam_succeed_if.so uid >= 1000 quiet_success
auth        sufficient    pam_ldap.so use_first_pass
auth        required      pam_deny.so

account     required      pam_unix.so broken_shadow
account     sufficient    pam_localuser.so
account     sufficient    pam_succeed_if.so uid < 1000 quiet
account     [default=bad success=ok user_unknown=ignore] pam_ldap.so
account     required      pam_permit.so

password    requisite     pam_pwquality.so try_first_pass local_users_only retry=3 authtok_type=
password    sufficient    pam_unix.so sha512 shadow nullok try_first_pass use_authtok
password    sufficient    pam_ldap.so use_authtok
password    required      pam_deny.so

session     optional      pam_keyinit.so revoke
session     required      pam_limits.so
-session     optional      pam_systemd.so
session     optional      pam_mkhomedir.so
session     optional      pam_mount.so 
session     [success=1 default=ignore] pam_succeed_if.so service in crond quiet use_uid
session     required      pam_unix.so
session     optional      pam_ldap.so
```

pam_mount.conf.xml (tothom):
```
<volume user="*" fstype="cifs" server="samba" path="%(USER)" mountpoint="~/%(USER)"
/>
```


#### Utilització dins del hostpam

```
[root@host ~]# su - pere
Creating directory '/tmp/home/pere'.
reenter password for pam_mount:
[pere@host ~]$ ll
total 0
drwxr-xr-x. 2 pere users 0 Jan  6 23:09 pere
[pere@host ~]$ 

[pere@host ~]$ mount -t cifs
//172.20.0.4/pere on /tmp/home/pere/pere type cifs (rw,relatime,vers=default,cache=strict,username=pere,domain=,uid=5001,forceuid,gid=100,forcegid,addr=172.20.0.4,file_mode=0755,dir_mode=0755,nounix,serverino,mapposix,rsize=1048576,wsize=1048576,echo_interval=60,actimeo=1)

```


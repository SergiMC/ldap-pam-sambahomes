# SAMBA ldap+pam+ldapsmb
@edt Sergi Muñoz Carmona ASIX M06 2018-2019

Podeu trobar les imatges docker al Dockerhub de [sergimc](https://hub.docker.com/u/sergimc/)

## Imatges:
**sergimc/ldapserver:18homes** Servidor LDAP amb les dades de la base de dades dc=edt,dc=org Requereix de l'ús d'un servidor ldap.

**sergimc/hostpam:18homesmb** Servidor PAM que l'utilitzarem per connectar-nos i muntar els directoris dels usuaris samba. Requereix
server ldap+pam+samba.

**sergimc/samba:18homes** Servidor SAMBA que l'utilitzarem per tal de compartir els homes dels usuaris samba. 
Requereix de l'ús d'un servidor ldap, hostpam i ssh.

## Arquitectura i descripció:

Pràctica que utilitzarem PAM,LDAP i SAMBA. Crearem un servidor SAMBA que es connectarà a un server LDAP on el 
i podrà exportar directoris HOME d'usuaris locals i LDAP.

**sambanet**: Una xarxa propia per als containers implicats.

**sergimc/ldapserver:18homes**  Un servidor ldap en funcionament amb els usuaris de xarxa.

**sergimc/hostpam:18homesmb** Un servidor PAM per connectar-nos i poder montar els directoris dels usuaris samba.

**sergimc/samba:18homes** Un servidor SAMBA que l'utilitzarem per tal de compartit els homes dels usuaris samba.

## Execució

```
docker network create sambanet

docker run --rm --name ldap --hostname ldap --net sambanet -d sergimc/ldapserver:18homes

docker run --rm --name host --hostname host --net sambanet -it sergimc/hostpam:18homesmb

docker run --rm --name samba --hostname samba --net sambanet -it sergimc/samba:18homes
```

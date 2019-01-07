# LDAP
## @edt Sergi Muñoz Carmona ASIX M06-ASO Curs 2018-2019

Podeu trobar les imatges docker al Dockerhub de [sergimc](https://hub.docker.com/u/sergimc/)

ASIX M06-ASO Escola del treball de barcelona

* **sergimc/ldapsamba:18homes**  servidor ldap amb la base la dades dc=edt,dc=org.
Per posar en funcionament aquest model només es necessita un servidor ldap.


#### Execució

```
docker run --rm --name ldap --hostname ldap --network sambanet -d sergimc/ldapsamba:18homes

```

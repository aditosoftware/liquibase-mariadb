# Description

This image contain the liquibase tool. This tool can help you import the data (from xmls) in to [apache derby](https://db.apache.org/derby/) db.

# Variables

**LIQUIBASE_CHANGELOGFILE** - path to liquibase changelog.xml   
**MARIADB_HOST** - URL or IP of derby server   
**MARIADB_PORT** - derby server port  
**MARIADB_DB** - name of derby db    
**MARIADB_USER** - name of db user   
**MARIADB_PASS** - password of MARIADB_USER  
**LIQUIBASE_DEFAULTSCHEMA** - name of schama  

# Volumes
The workingdir ist "/workspace", so you need to mount you liqubiase xml files into this folder.

# Run
sudo docker run --rm -v /vagrant/basic/.liquibase/Data_alias/:/workspace -e LIQUIBASE_CHANGELOGFILE=changelog.xml -e MARIADB_HOST=mariadbhost -e MARIADB_DB=test -e MARIADB_PORT=3306 -e MARIADB_USER=root -e MARIADB_PASS=jFALkmf -it liq update
```

# custom_webapp

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with custom_webapp](#setup)
    * [Beginning with custom_webapp](#beginning-with-custom_webapp)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)

## Description

Custom webapp is a simple example application for use in Learning Puppet. It has a simple configuration file, a mysql/mariadb backend, a statically compiled web app, and uses nginx as a webserver. The application itself just serves up the contents of a table in the database called "pages".

## Setup

### Beginning with custom_webapp  

The module requires parameters for the mysql backend. You can also set the module to manage an nginx server.

## Reference

**custom_webapp::app**

Set up the webapp itself. The class has parameters for configuring the database connection.

**custom_webapp::db**

Sets up the database using the puppet-mysql and table for the webapp.

**custom_webapp::web**

Sets up a reverse proxy using nginx to point at the webapp.

## Limitations

This module is just for demonstartion and shouldn't be used in production. It is limited to RedHat 7 based systems.

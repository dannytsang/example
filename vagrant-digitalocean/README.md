vagrant-digitalocean
=======

Example Vagrantfile for Digital Ocean.

It requires the Digital Ocean Vagrant plugin. To install:
<code>vagrant plugin install vagrant-digitalocean</code>

The following needs to be entered in the file for it to work:
* BOX_NAME - Hostname of the droplet. This must be unique to your account.
* provider.client_id - Client API key found in API section.
* provider.api_key - (private) API key found in API section.
* provider.ssh_key_name - Name of the SSH key vagrant can use to log in. This can be found in the SSH Keys section.

The other defaulted but changable options are:
* provider.image - OS image i.e the host operating system to create. The name should match exactly the same as the options when creating a new droplet.
* provider.region - The data centre where the instance will be created. Again must match exactly the same as the regions lited when creating a droplet.
* provider.size - RAM size of the new droplet.

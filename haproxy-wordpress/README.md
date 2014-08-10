haproxy-wordpress
=================

Example HAProxy configuration for WordPress servers tested on Ubuntu.

The example uses 2 backend servers in the example, 10.0.0.2 and 10.0.0.3. Make sure you replace these values with actual servers addresses.

Both example configuration enables a statistics server which can be access on port 8080. Remember to change the username and password on the <code>stats auth admin:password</code> line. The stats page show information about the frontend and backend servers and their relevant configuration and statuses. To disable this feature, remove the following block:
<code>listen stats *:8080
        stats enable
        stats uri /
        stats hide-version
        stats auth admin:password</code>

The config files contain 2 entry points (barring the stats page). One for regular http traffic on port 80 and second one for HTTPS encrypted traffic over port 443. Both ports are the default ports for their respective protocols so it is not necessary to put the port numbers in the address.

Both use cookie sticky sessions so once a connection is established with a backend server it will try to use the same backend server. <code>option http-server-close</code> tells HAProxy to break the sticky session and use a different backend if the original backend server goes down. Delete this line if you don't want the session to timeout.

Another thing worth noting is the <code>verify none</code> on the backend servers. This negates checking of the SSL certificate from the backend server. This stops any errors if the backend servers are using self signed certificates.

### haproxy.cfg.roundrobin ###
Servers requests are forwarded between one to the other in an sequential order. Server 10.0.0.2 would get the first request and then 10.0.0.3 would get the next request.

### haproxy.cfg.fallback ###
One server (10.0.0.2) is the primary and the second server (10.0.0.3) is designated as a backup server so only when all the primary server(s) goes down it will use the backup server(s).

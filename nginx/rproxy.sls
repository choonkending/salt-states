### /srv/salt/nginx/rproxy.sls ###
##################################

### Install Nginx and configure it as a reverse proxy

nginx-rproxy:
  # Install Nginx
  pkg:
    - installed
    - name: nginx    
  # Place a customized Nginx config file
  file:
    - managed
    - source: salt://nginx/files/example.conf
    - name: /etc/nginx/conf.d/example.conf
    - require:
      - pkg: nginx-rproxy
  # Ensure Nginx is always running.
  # Restart Nginx if the config file changes.
  service:
    - running
    - enable: True
    - name: nginx
    - require:
      - pkg: nginx-rproxy
    - watch:
      - file: nginx-rproxy
  # Restart Nginx for the initial installation.
  cmd:
    - run
    - name: service nginx restart
    - require:
      - file: nginx-rproxy
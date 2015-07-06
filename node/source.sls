nodejs.ppa:
  pkgrepo.managed:
    - humanname: NodeSource Node.js Repository
    - name: deb https://deb.nodesource.com/node_0.12 trusty main
    - dist: trusty
    - file: /etc/apt/sources.list.d/nodesource.list
    - keyid: "68576280"
    - key_url: https://deb.nodesource.com/gpgkey/nodesource.gpg.key
    - keyserver: keyserver.ubuntu.com
    - require_in:
      pkg: nodejs

nodejs:
  pkg.installed:
    - name: nodejs

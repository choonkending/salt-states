git_packages:
  pkg.installed:
    - pkgs:
      - openssl
      - libssl-dev
      - pkg-config
      - build-essential

## Get Node
get-node:
  file.managed:
    - name: /usr/src/node-v0.12.6.tar.gz
    - source: https://nodejs.org/dist/v0.12.6/node-v0.12.6.tar.gz
    - source_hash: sha1=a0099d22dc927e18c0e385612afdd14e9173417b
    - require:
      - pkg: git_packages
  cmd.wait:
    - cwd: /usr/src
    - names:
      - tar -zxvf node-v0.12.6.tar.gz
    - watch:
      - file: /usr/src/node-v0.12.6.tar.gz

make-node:
  cmd.wait:
    - cwd: /usr/src/node-v0.12.6
    - names:
      - ./configure
      - make
    - watch:
      - cmd: get-node

git:
  pkg.installed

mapilogy-prod:
  git.latest:
    - name: git@github.com:choonkending/mapilogy.git
    - rev: develop
    - target: /var/code/mapilogy
    - identity: /home/map/.ssh/id_rsa
    - require:
      - pkg: git

npm install:
  cmd.wait:
    - name: npm install
    - cwd: /var/code/mapilogy
    - user: map
    - watch:
      - git: mapilogy-prod

restart:
  cmd.wait:
    - name: pm2 restart server/index.js
    - cwd: /var/code/mapilogy
    - user: map
    - watch:
      - cmd: npm install

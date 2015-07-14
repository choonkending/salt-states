example-prod:
  git.latest:
    - name: git@github.com:example/example.git
    - rev: develop
    - target: /path/to/directory
    - identity: /home/user/.ssh/id_rsa
    - require:
      - pkg: git

set_vm_recourses:
  salt.state:
    - tgt: 'manjoris'
    - sls:
      - saltmaster.vm_resource

set_network_docker:
  salt.state:
    - tgt: 'docker*'
    - sls:
      - docker.network

update_mine_pillar:
  salt.function:
    - tgt: 'docker*'
    - name: mine.update

install_docker:
  salt.state:
    - tgt: 'docker*'
    - sls:
      - docker

init_docker_master:
  salt.state:
    - tgt: 'docker_master*'
    - sls:
      - docker.master

update_mine_pillar_thesecond:
  salt.function:
    - tgt: 'docker*'
    - name: mine.update

init_docker_slave:
  salt.state:
    - tgt: 'docker_slave*'
    - sls:
      - docker.slave

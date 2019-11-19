saltstack_repo:
  pkgrepo.managed:
    - name: deb http://repo.saltstack.com/apt/debian/{{ grains['osmajorrelease'] }}/{{ grains['osarch'] }}/latest {{ grains['oscodename'] }} main
    - file: /etc/apt/sources.list.d/saltstack.list
    - key_url: https://repo.saltstack.com/apt/debian/{{ grains['osmajorrelease'] }}/{{ grains['osarch'] }}/latest/SALTSTACK-GPG-KEY.pub

/etc/salt/minion.d/minion.conf:
  file.managed:
    - source: salt://salt/files/minion.conf
    - template: jinja
    - user: root
    - group: root
    - mode: 644

salt-minion:
  service.running:
    - enable: True
    - watch:
      - file: /etc/salt/minion.d/minion.conf

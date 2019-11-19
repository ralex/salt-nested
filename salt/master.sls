/etc/salt/master.d/master.conf:
  file.managed:
    - template: jinja
    - source: salt://salt/files/master.d/master.conf
    - user: root
    - group: root
    - mode: 640

salt-master:
  service.running:
    - enable: True
    - watch:
      - file: /etc/salt/master.d/master.conf

/etc/salt/cloud.providers.d/virtualbox.conf:
  file.managed:
    - template: jinja
    - source: salt://salt/files/cloud.providers.d/virtualbox.conf
    - user: root
    - group: root
    - mode: 640

/etc/salt/cloud.profiles.d/virtualbox.conf:
  file.managed:
    - template: jinja
    - source: salt://salt/files/cloud.profiles.d/virtualbox.conf
    - user: root
    - group: root
    - mode: 640

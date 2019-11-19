base:
  '*':
    - salt.minion

  'roles:salt-master':
    - match: grain
    - salt.master

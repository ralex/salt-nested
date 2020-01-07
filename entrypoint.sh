#!/bin/bash

set -e

salt-master --log-level=error &

cd /srv/machines/salt-master && vagrant up
salt-cloud -p salt-master master1 -l debug &

exec /bin/bash

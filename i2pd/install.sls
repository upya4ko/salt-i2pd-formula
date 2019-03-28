{% from "i2pd/map.jinja" import map with context %}

include:
  - i2pd.repo

install_i2pd:
  pkg.installed:
    - pkgs: {{ map.pkgs }}
    - require:
      - pkgrepo: install_i2pd_repo
  service.running:
    - name: {{ map.service }}
    - restart: True
    - enable: True
    - require:
      - pkg: install_i2pd

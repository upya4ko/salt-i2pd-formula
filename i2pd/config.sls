{% from "i2pd/map.jinja" import map with context %}

include:
  - i2pd.repo
  - i2pd.install

deploy_i2pd_i2pd_conf:
  file.managed:
    - name: {{ map.config_file }}
    - source: salt://{{ slspath }}/files/i2pd.conf.jinja
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - defailts:
      config: {{ map.i2pd_conf }}
    - reguire:
      - pkg: install_i2pd
    - watch_in:
      - service: install_i2pd

deploy_i2pd_subscriptions:
  file.managed:
    - name: {{ map.subscriptions_file }}
    - source: salt://{{ slspath }}/files/subscriptions.jinja
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - defailts:
      config: {{ map.subscriptions }}
    - reguire:
      - pkg: install_i2pd
    - watch_in:
      - service: install_i2pd

deploy_i2pd_tunnels_conf:
  file.managed:
    - name: {{ map.tunnels_file }}
    - source: salt://{{ slspath }}/files/tunnels.conf.jinja
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - defailts:
      config: {{ map.tunnels }}
    - reguire:
      - pkg: install_i2pd
    - watch_in:
      - service: install_i2pd

deploy_i2pd_tunnels_dir:
  file.directory:
    - name: {{ map.tunnels_dir }}
    - user: root
    - group: root
    - mode: 755
    - reguire:
      - pkg: install_i2pd
    - watch_in:
      - service: install_i2pd



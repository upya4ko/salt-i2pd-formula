{% from "i2pd/map.jinja" import map with context %}
{% set osfamily = salt['grains.get']('os_family', False) %}

{% if osfamily == 'Debian' %}
{% set codename = salt['grains.get']('lsb_distrib_codename') %}
{% set os_id = osfamily | lower %}

add_apt_https_support_for_i2pd:
  pkg.installed:
    - name: {{ map.https_support_pkg }}
    - require_in:
      - pkgrepo: install_i2pd_repo

install_i2pd_repo:
  pkgrepo.managed:
    - name: deb {{ map.repo_url }}/{{ os_id  }} {{ codename }} main
    - file: /etc/apt/sources.list.d/i2pd.list
    - key_url: {{ map.repo_key_url }}
    - require:
      - pkg: add_apt_https_support_for_i2pd


{% endif %}

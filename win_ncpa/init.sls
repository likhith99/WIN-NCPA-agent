# -*- coding: utf-8 -*-
# vim: ft=sls
{%- set tplroot = tpldir.split('/')[0] %}
{% from "win_ncpa/map.jinja" import win_ncpa with context %}
{%- from "win_ncpa/macros.jinja" import files_switch with context %}

{{sls}}.ncpa_copy:
  file.managed:
    - name: C:\Windows\Temp\win_ncpa.exe
    - source: {{ win_ncpa.path }}

{{sls}}.ncpa_install:
  cmd.run:
    - name: C:\Windows\Temp\win_ncpa.exe /S
    - unless:
      - Get-package -Name NCPA
    - shell: powershell

{{ sls }}.configuration:
  file.managed:
    - name: {{ win_ncpa.config }}
    - source: {{ files_switch(
                    salt['config.get'](
                        tpldir ~ ':tofs:files:win_ncpa-config',
                        ['win_ncpa.conf']
                    )
              ) }}
      - salt://files/{{ tplroot }}/win_ncpa.conf
    - template: jinja
    - context:
        win_ncpa: {{ win_ncpa | json }}

{{sls}}.service_running:
  service.running:
    - names:
      - ncpalistener 
      - ncpapassive
    - watch:
      - {{ sls }}.configuration
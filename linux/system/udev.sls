{%- from "linux/map.jinja" import linux with context %}
{%- set system = linux.get('system', {}) %}

{%- if system.get('udev', False) %}
  {%- if system.udev.get('rules', False) %}
    {%- if system.udev.rules is string %}
/etc/udev/rules.d/99-salt.rules:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - contents_pillar: linux:system:udev:rules

linux_udev_trigger:
  cmd.wait:
    - name: udevadm trigger
    - watch:
      - file: /etc/udev/rules.d/99-salt.rules
    {%- endif %}
  {%- endif %}
{%- endif %}

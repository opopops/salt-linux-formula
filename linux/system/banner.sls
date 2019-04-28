{%- from "linux/map.jinja" import linux with context %}
{%- set system = linux.get('system', {}) %}

{%- if system.get('banner', False) and system.banner is string %}
/etc/issue:
  file.managed:
  - user: root
  - group: root
  - mode: 644
  - contents_pillar: linux:system:banner
{%- endif %}

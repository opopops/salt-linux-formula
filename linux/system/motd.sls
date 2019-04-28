{%- from "linux/map.jinja" import linux with context %}
{%- set system = linux.get('system', {}) %}
{%- if system.get('motd', False) %}

/etc/update-motd.d:
  file.directory:
    - clean: true

  {%- if system.motd is string %}

{#- Set static motd only #}
/etc/motd:
  file.managed:
    - contents_pillar: linux:system:motd

  {%- else %}

/etc/motd:
  file.absent

  {%- for motd, contents in system.get('motd', {}).items() %}
motd_{{ motd }}:
  file.managed:
    - name: /etc/update-motd.d/{{motd}}
    - contents: |
        {{contents|indent(8)}}
    - mode: 755
    - require:
      - file: /etc/update-motd.d
  {%- endfor %}

  {%- endif %}

{%- endif %}

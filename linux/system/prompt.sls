{%- from "linux/map.jinja" import linux with context %}
{%- set system = linux.get('system', {}) %}

{%- if system.get('prompt', False) %}
/etc/profile.d/prompt.sh:
  file.managed:
    - source: salt://linux/files/prompt.sh.jinja
    - template: jinja
{%- if grains.os_family == 'Debian' %}
/etc/bash.bashrc:
  file.replace:
    - pattern: ".*PS1=.*"
    - repl: ": # Prompt is set by /etc/profile.d/prompt.sh"
/etc/skel/.bashrc:
  file.replace:
    - pattern: ".*PS1=.*"
    - repl: ": # Prompt is set by /etc/profile.d/prompt.sh"
/root/.bashrc:
  file.replace:
    - pattern: ".*PS1=.*"
    - repl: ": # Prompt is set by /etc/profile.d/prompt.sh"
{%- endif %}
{%- endif %}

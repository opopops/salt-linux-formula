{%- from "linux/map.jinja" import linux with context %}
{%- set system = linux.get('system', {}) %}

{%- for locale_name, locale in system.get('locale', {}).items() %}
{%- if locale.get('enabled', True) %}

linux_locale_{{ locale_name }}:
  locale.present:
    - name: {{ locale_name }}

{%- if locale.get('default', False) %}
linux_locale_default:
  locale.system:
    - name: {{ locale_name }}
    - require:
      - locale: linux_locale_{{ locale_name }}
{%- endif %}

{%- endif %}
{%- endfor %}

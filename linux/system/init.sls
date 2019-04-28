{%- from "linux/map.jinja" import linux with context %}

include:
  - linux.system.cpu
  - linux.system.locale
  - linux.system.prompt
  - linux.system.banner
  - linux.system.motd
  - linux.system.udev

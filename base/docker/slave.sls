{% set ip = salt['mine.get']('host:master*', 'network.ip_addrs', tgt_type='grain') | dictsort() %}
{% set tokens = salt['mine.get']('host:master*', 'swarm.swarm_tokens', tgt_type='grain') | dictsort() %}
init_swarm:
  module.run:
    - name: swarm.joinswarm
{%- for server, addrs in ip %}
    - remote_addr: {{ addrs[0] }}
{%- endfor %}
    - listen_addr: '0.0.0.0'
{%- for server,id in tokens %}
    {%- for name,token in id.iteritems() %}
    {%- if name == 'Worker' %}
    - token: '{{ token }}'
    {%- endif %}
    {%- endfor %}
{%- endfor %}

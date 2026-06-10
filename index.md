---
layout: default
title: Portfolio
description: >-
  Turner Luke — Data Scientist in Austin, TX. A portfolio of data engineering,
  machine learning, and analytics projects spanning dbt, Polars, neural networks,
  NLP, and end-to-end data pipelines.
---

# Portfolio

A selection of my work in data engineering, machine learning, and analytics — from end-to-end data pipelines to deployed ML web apps.

{% assign projects = site.data.projects | sort: "relevance" | reverse %}
{% for project in projects %}
<hr>
<h2><a href="{{ project.url }}">{{ project.title }}</a></h2>
<p>
{%- for badge in project.badges %}
<a href="{{ badge.url }}"><img src="{{ badge.img }}" alt="{{ badge.label }}"></a>
{%- endfor %}
</p>
{{ project.body | markdownify }}
{%- if project.image %}
<img src="{{ project.image }}" alt="{{ project.image_alt }}" loading="lazy">
{%- endif %}
{% endfor %}

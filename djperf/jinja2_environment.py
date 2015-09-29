from __future__ import absolute_import  # Python 2 only

from django.contrib.staticfiles.storage import staticfiles_storage
from django.core.urlresolvers import reverse
from django.template.defaulttags import csrf_token
from django.contrib import messages
from jinja2 import Environment

def environment(**options):
    env = Environment(**options)
    env.globals.update({
        'get_messages': messages.get_messages,
    })
    return env
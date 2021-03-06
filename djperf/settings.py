"""
Django settings for djperf project.

Generated by 'django-admin startproject' using Django 1.8.4.

For more information on this file, see
https://docs.djangoproject.com/en/1.8/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.8/ref/settings/
"""

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
import os

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.8/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'rfdrv0-afxyc9of*q-tf-0$w-cpx3h*fd0l0ls0sq8aap)u-s)'

# SECURITY WARNING: don't run with debug turned on in production!
# PERFORMANCE:  turn DEBUG off in production

DEBUG = True            # PERFORMANCE: turn off in prod
ALLOWED_HOSTS = ["*"]   # PERFORMANCE: set properly in prod

# Application definition

INSTALLED_APPS = (
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django_extensions',
#    'debug_toolbar',
    'store',
)

MIDDLEWARE_CLASSES = (
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.auth.middleware.SessionAuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'django.middleware.security.SecurityMiddleware',
)

ROOT_URLCONF = 'djperf.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.jinja2.Jinja2',
        'DIRS': [], 
        'APP_DIRS': True,
        'OPTIONS': {
            'extensions': [
                'jdj_tags.extensions.DjangoCompat',
            ],
            "environment": "djperf.jinja2_environment.environment",
        },        
    },    
    
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,  #PERFORMANCE: turn off if using cached loaders
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
            
            # PERFORMANCE:  Add this code in production to use cached templates
            #'loaders': [
               #('django.template.loaders.cached.Loader', [
                   #'django.template.loaders.filesystem.Loader',
                   #'django.template.loaders.app_directories.Loader',
               #]),
            #],            
        },
    },
]

WSGI_APPLICATION = 'djperf.wsgi.application'


# Database
# https://docs.djangoproject.com/en/1.8/ref/settings/#databases

DATABASES = {
#    'default': {
#        'ENGINE': 'django.db.backends.postgresql_psycopg2',
#        'NAME': 'djperf',
#        'USER': 'chris',
#        'PASSWORD': 'postgres',
#        'HOST': 'localhost',
#        'PORT': '5432',
#    },
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'djperf',
        'USER': 'chris',
        'PASSWORD': 'demo',
        'HOST': '104.236.94.14',
        'PORT': '5432',
    }
}

# Leave connections open for re-use
CONN_MAX_AGE = 60  #PERFORMANCE: set to something in production


# Internationalization
# https://docs.djangoproject.com/en/1.8/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.8/howto/static-files/

STATIC_URL = '/static/'
STATICFILES_DIRS = ('/home/chris/djperf/djperf/static/',)


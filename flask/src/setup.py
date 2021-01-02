from setuptools import setup, find_packages

with open('VERSION', 'r') as f:
    VERSION = f.read().strip()
    f.close()

setup(
    name='devops_sample_application',
    version=VERSION,
    description='Flask Sample Server',
    url='https://github.com/jihyungSong/devops-course-sample/flask',
    long_description='',
    author='JH Song',
    author_email='bluese05@gmail.com',
    packages=find_packages(),
    install_requires=[
        'flask',
        'gunicorn'
    ],
    zip_safe=False,
)

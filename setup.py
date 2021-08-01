from setuptools import setup, find_packages

with open('README.md') as readme_file:
    README = readme_file.read()


setup_args = dict(
    name='wsaver',
    version='7.0',
    description='Wsaver is the weater saver UI for showing weather station data.',
    long_description_content_type="text/markdown",
    long_description=README,
    license='MIT',
    packages=find_packages(),
    author='Bayangmbe Mounmo',
    author_email='bayangp0@gmail.com',
    keywords=['wsaver', 'WeatherSaver', 'ws'],
    url='https://github.com/bm777/wsaver',
    download_url='https://pypi.org/project/wsaver',
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    python_requires='>=3.5',
)

install_requires = [
    'PySide2==5.15.0',
    'requests',
    'pandas==1.1.5'
]

if __name__ == '__main__':
    setup(**setup_args, install_requires=install_requires)

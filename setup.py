from setuptools import setup, find_packages

setup(
    name='CalcPy',
    version='0.1',
    packages=find_packages(),
    description='A simple calculator library',
    long_description=open('README.md').read(),
    long_description_content_type='text/markdown',
    author='SamuelJanas',
    author_email='sneakyinsect@gmail.com',
    url='https://github.com/SamuelJanas/CalcPy-package/tree/develop',
    license='MIT',
    classifiers=[
        'Programming Language :: Python :: 3',
        'License :: OSI Approved :: MIT License',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.9',
)

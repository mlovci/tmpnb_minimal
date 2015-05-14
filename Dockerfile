FROM jupyter/minimal
USER root
RUN apt-get update -qq
ADD http://ftp.gnome.org/pub/GNOME/sources/ttf-bitstream-vera/1.10/ttf-bitstream-vera-1.10.zip /usr/share/matplotlib/mpl-data/fonts/ttf/ttf-bitstream-vera-1.10.zip
RUN apt-get install unzip
RUN cd /usr/share/matplotlib/mpl-data/fonts/ttf && unzip ttf-bitstream-vera-1.10.zip && cd ttf-bitstream-vera-1.10 && mv *ttf ../.
RUN apt-get install -y python-numpy python-scipy python-matplotlib ipython ipython-notebook python-pandas python-sympy python-nose libblas3gf libblas-doc libblas-dev liblapack3gf liblapack-dev curl gfortran
RUN pip install  https://github.com/YeoLab/flotilla/archive/master.zip 
RUN mkdir -p /home/jovyan/flotilla_projects
RUN chown -R jovyan /home/jovyan/flotilla_projects && chgrp -R jovyan /home/jovyan/flotilla_projects
USER jovyan


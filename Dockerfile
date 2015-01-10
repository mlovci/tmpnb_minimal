FROM jupyter/minimal
USER root
RUN sudo apt-get update
ADD http://ftp.gnome.org/pub/GNOME/sources/ttf-bitstream-vera/1.10/ttf-bitstream-vera-1.10.zip /usr/share/matplotlib/mpl-data/fonts/ttf/ttf-bitstream-vera-1.10.zip
RUN sudo apt-get install unzip
RUN cd /usr/share/matplotlib/mpl-data/fonts/ttf && unzip ttf-bitstream-vera-1.10.zip && cd ttf-bitstream-vera-1.10 && mv *ttf ../.
RUN sudo apt-get install -y python-numpy python-scipy python-matplotlib ipython ipython-notebook python-pandas python-sympy python-nose
RUN sudo apt-get install -y libblas3gf libblas-doc libblas-dev liblapack3gf liblapack-dev
RUN sudo apt-get install -y gfortran
RUN pip install  https://github.com/YeoLab/flotilla/archive/master.zip 
RUN mkdir -p /home/jovyan/flotilla_projects
RUN chown -R jovyan /home/jovyan/flotilla_projects && chgrp -R jovyan /home/jovyan/flotilla_projects
USER jovyan


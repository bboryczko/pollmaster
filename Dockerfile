FROM python
MAINTAINER bboryczko@noverus.com

RUN git clone https://github.com/bboryczko/pollmaster.git \
&& cd pollmaster \
&& pip install -r requirements.txt
COPY secrets.py /pollmaster/essentials/
#CMD ["python","/pollmaster/pollmaster.py"]
ENTRYPOINT ["python","/pollmaster/pollmaster.py"]

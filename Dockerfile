FROM nvidia/cuda:9.0-base

# Default git repository
#ENV GIT_REPOSITORY https://github.com/fireice-uk/xmr-stak.git

ENV XMRSTAK_CMAKE_FLAGS -DXMR-STAK_COMPILE=generic -DCUDA_ENABLE=ON -DOpenCL_ENABLE=OFF

RUN apt-get update

# Install packages
RUN apt-get install -qq --no-install-recommends -y ca-certificates cmake cuda-core-9-0 git cuda-cudart-dev-9-0 libhwloc-dev libmicrohttpd-dev libssl-dev

# RUN git clone ${GIT_REPOSITORY} /xmr-stak
ADD . /xmr-stak

WORKDIR /xmr-stak
RUN cmake ${XMRSTAK_CMAKE_FLAGS} .
RUN make

ENV PATH=$PATH:/xmr-stak/bin/
ENV LD_LIBRARY_PATH=/xmr-stak/bin/

CMD xmr-stak

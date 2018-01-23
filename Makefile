all: clean
	nvidia-docker build -t sofwerx/xmr-stak .
	nvidia-docker run --restart=always -ti --name xmr-stak sofwerx/xmr-stak xmr-stak --currency monero -o pool.minexmr.com:7777 -u 45EHbbAwCxjjPmjjskVhRgS6aNejcBCWxYvy49zgTNf4646C5BJwHdX4M2SWL5FwrPdrjpHSN5LnEh692wbkNrPUTtxQMJi -p x

clean:
	nvidia-docker stop xmr-stak || true
	nvidia-docker rm -f xmr-stak || true

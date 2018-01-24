all: clean
	nvidia-docker build -t sofwerx/xmr-stak .
	make cpu

gpu:
	nvidia-docker run --restart=always --log-driver json-file  --log-opt mode=non-blocking --log-opt max-buffer-size=4m --cap-add SYS_NICE -ti --name xmr-stak sofwerx/xmr-stak nice -n +20 xmr-stak --currency monero -o pool.minexmr.com:7777 -u 45EHbbAwCxjjPmjjskVhRgS6aNejcBCWxYvy49zgTNf4646C5BJwHdX4M2SWL5FwrPdrjpHSN5LnEh692wbkNrPUTtxQMJi -p x

cpu:
	docker run --restart=always --log-driver json-file  --log-opt mode=non-blocking --log-opt max-buffer-size=4m --cap-add SYS_NICE -ti --name xmr-stak sofwerx/xmr-stak nice -n +20 xmr-stak --currency monero -o pool.minexmr.com:7777 -u 45EHbbAwCxjjPmjjskVhRgS6aNejcBCWxYvy49zgTNf4646C5BJwHdX4M2SWL5FwrPdrjpHSN5LnEh692wbkNrPUTtxQMJi -p x

clean:
	docker stop xmr-stak || true
	docker rm -f xmr-stak || true

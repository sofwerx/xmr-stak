all: clean
	nvidia-docker build -t sofwerx/xmr-stak .
	make cpu

gpu:
	nvidia-docker run --restart=always --log-driver json-file  --log-opt mode=non-blocking --log-opt max-buffer-size=4m --cap-add SYS_NICE -ti --name xmr-stak sofwerx/xmr-stak nice -n +20 xmr-stak --currency monero -o pool.minexmr.com:7777 -u 46UBBUKUst1LPLKsQCfu6p1HkXAPPAD1vbEPCpKfgE7Ma7NJYzLGbhcTYP7o1mRygU8cFKrzyghUxFFLpBQ3ERXKC83zkVY.`hostname` -p x

cpu:
	docker run --restart=always --log-driver json-file  --log-opt mode=non-blocking --log-opt max-buffer-size=4m --cap-add SYS_NICE -ti --name xmr-stak sofwerx/xmr-stak nice -n +20 xmr-stak --currency monero -o pool.minexmr.com:7777 -u 46UBBUKUst1LPLKsQCfu6p1HkXAPPAD1vbEPCpKfgE7Ma7NJYzLGbhcTYP7o1mRygU8cFKrzyghUxFFLpBQ3ERXKC83zkVY.`hostname` -p x

clean:
	docker stop xmr-stak || true
	docker rm -f xmr-stak || true

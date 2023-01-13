#!/bin/bash

apt-get install -y python \
		python3 \
		python3-pip \
		python-pip \
		binwalk \
		yara \
		exiftool \
		clamav \
		pff-tools \
		git

echo "[!] Installing Viper Monkey"
git clone https://github.com/decalage2/ViperMonkey.git /opt/ViperMonkey
pip install -r /opt/ViperMonkey/requirements.txt
python /opt/ViperMonkey/setup.py install
pip install colorlog==4.8.0
sed 's/pypy/python/' /opt/ViperMonkey/vipermonkey/vmonkey.py > /opt/ViperMonkey/vipermonkey/vmonkey.py.tmp
rm /opt/ViperMonkey/vipermonkey/vmonkey.py
mv /opt/ViperMonkey/vipermonkey/vmonkey.py.tmp /opt/ViperMonkey/vipermonkey/vmonkey.py
chmod +x /opt/ViperMonkey/vipermonkey/vmonkey.py
ln -s /opt/ViperMonkey/vipermonkey/vmonkey.py /usr/local/bin/vmonkey

echo "[!] Installing PeePDF"
git clone https://github.com/jesparza/peepdf.git /opt/peepdf
ln -s /opt/peepdf/peepdf.py /usr/local/bin/peepdf


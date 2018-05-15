python << EOF
import os
import sys

path = os.path.expanduser("/Users/keita30885/.pyenv/versions/anaconda3-5.1.0/lib/python3.6/site-packages")
if not path in sys.path:
    sys.path.append(path)
EOF

setlocal foldmethod=indent

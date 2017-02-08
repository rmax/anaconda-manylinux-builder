#
# Add additional setup steps here.
#
echo "multilib_policy=best" >> /etc/yum.conf

yum install -y openssl101e-devel openssl101e-static libffi-devel

export CFLAGS="${CFLAGS} $(pkg-config --cflags-only-I openssl101e)"
export LDFLAGS="${LDFLAGS} $(pkg-config --libs-only-L openssl101e)"

yum install -y openblas-devel openblas-static

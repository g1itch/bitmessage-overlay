# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{6..9} )
DISTUTILS_USE_SETUPTOOLS=no
inherit distutils-r1

MY_PN=txZMQ
DESCRIPTION="Twisted bindings for ZeroMQ"
HOMEPAGE="https://github.com/smira/${MY_PN}"
SRC_URI="mirror://pypi/${PN:0:1}/${MY_PN}/${MY_PN}-${PV}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~x86 ~amd64"
SLOT="0"

DEPEND="
	dev-python/pyzmq[${PYTHON_USEDEP}]
	dev-python/twisted[${PYTHON_USEDEP}]
"

S="${WORKDIR}"/${MY_PN}-${PV}

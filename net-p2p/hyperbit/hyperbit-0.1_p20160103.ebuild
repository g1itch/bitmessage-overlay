# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{6..9} )
inherit distutils-r1

DESCRIPTION="Alternate client for the Bitmessage network."
COMMIT="8b7a7d3044e4d93ed2813efeb9fe5b13a1a58ced"
HOMEPAGE="https://github.com/jakobvarmose/${PN}"
SRC_URI="${HOMEPAGE}/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="${PYTHON_DEPS}"

RDEPEND="${DEPEND}
	dev-python/appdirs[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/PyQt5[${PYTHON_USEDEP}]
	dev-python/PySocks[${PYTHON_USEDEP}]
	dev-python/qasync[${PYTHON_USEDEP}]
"

S="${WORKDIR}"/${PN}-${COMMIT}

PVM=$(ver_cut 1-2)
PATCHES=( "${FILESDIR}"/${PVM}-qasync.patch )

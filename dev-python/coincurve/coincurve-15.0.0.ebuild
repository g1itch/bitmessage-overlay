# Copyright 2019-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{6..9} )
DISTUTILS_USE_SETUPTOOLS=manual
inherit distutils-r1

DESCRIPTION="Cross-platform Python CFFI bindings for libsecp256k1"
HOMEPAGE="https://github.com/ofek/${PN}"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
KEYWORDS="~x86 ~amd64"
SLOT="0"

RDEPEND="dev-python/asn1crypto[${PYTHON_USEDEP}]
	dev-python/cffi[${PYTHON_USEDEP}]
	>=dev-libs/libsecp256k1-0.1_pre20181126[gmp,ecdh]"

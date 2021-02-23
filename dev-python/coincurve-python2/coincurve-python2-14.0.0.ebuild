# Copyright 2019-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python2_7 )
DISTUTILS_USE_SETUPTOOLS=manual
inherit distutils2

MY_PN=coincurve
DESCRIPTION="Cross-platform Python CFFI bindings for libsecp256k1"
HOMEPAGE="https://github.com/ofek/${PN}"
SRC_URI="mirror://pypi/${PN:0:1}/${MY_PN}/${MY_PN}-${PV}.tar.gz"

LICENSE="MIT"
KEYWORDS="~x86 ~amd64"
SLOT="0"

RDEPEND="
	!dev-python/${MY_PN}[python_targets_python2_7]
	dev-python/asn1crypto-python2
	dev-python/cffi-python2
	>=dev-libs/libsecp256k1-0.1_pre20181126[gmp,ecdh]"

PATCHES=( "${FILESDIR}"/${PV}-setup.patch )

S="${WORKDIR}"/${MY_PN}-${PV}

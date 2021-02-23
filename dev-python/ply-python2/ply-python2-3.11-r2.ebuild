# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python2_7 )
DISTUTILS_USE_SETUPTOOLS=manual
inherit distutils2

MY_PN=ply
MY_P=$MY_PN-$PV
DESCRIPTION="Python Lex-Yacc library"
HOMEPAGE="http://www.dabeaz.com/ply/ https://pypi.org/project/ply/"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0/$PV"
KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"
RESTRICT="test"

PATCHES=( "${FILESDIR}/3.6-picklefile-IOError.patch" )

RDEPEND="
	dev-python/setuptools-python2[${PYTHON_USEDEP}]
	!dev-python/ply[python_targets_python2_7]
"

S="${WORKDIR}"/${MY_PN}-${PV}

python_install_all() {
	distutils2_python_install_all
	rm -r ${D}/usr/share
}

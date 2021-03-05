# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python2_7 )
DISTUTILS_USE_SETUPTOOLS=manual
inherit distutils2

MY_PN=six
MY_P=$MY_PN-$PV
DESCRIPTION="Python 2 and 3 compatibility library"
HOMEPAGE="https://github.com/benjaminp/six https://pypi.org/project/six/"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"
RESTRICT="test"

BDEPEND="
	dev-python/setuptools-python2[${PYTHON_USEDEP}]
"

RDEPEND="
	!dev-python/six[python_targets_python2_7]
"

S="${WORKDIR}/${MY_PN}-${PV}"

distutils_enable_sphinx documentation --no-autodoc

python_install_all() {
	distutils2_python_install_all
	rm -r ${D}/usr/share
}

# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python2_7 )
DISTUTILS_USE_SETUPTOOLS=manual
inherit distutils2 toolchain-funcs

MY_PN=lxml
MY_P=$MY_PN-$PV
DESCRIPTION="A Pythonic binding for the libxml2 and libxslt libraries"
HOMEPAGE="https://lxml.de/ https://pypi.org/project/lxml/ https://github.com/lxml/lxml"
SRC_URI="https://github.com/lxml/lxml/archive/${MY_P}.tar.gz"

LICENSE="BSD ElementTree GPL-2 PSF-2"
SLOT="0"
KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"
IUSE="+threads"
RESTRICT="test"

# Note: lib{xml2,xslt} are used as C libraries, not Python modules.
RDEPEND="
	!dev-python/lxml[python_targets_python2_7]
	>=dev-libs/libxml2-2.9.5
	>=dev-libs/libxslt-1.1.28"
DEPEND="${RDEPEND}"
BDEPEND="
	virtual/pkgconfig
	dev-python/cython-python2[${PYTHON_USEDEP}]
	dev-python/setuptools-python2[${PYTHON_USEDEP}]
	"

S="${WORKDIR}"/lxml-${MY_P}

DISTUTILS_IN_SOURCE_BUILD=1

PATCHES=(
	"${FILESDIR}"/${MY_PN}-4.5.0-tests-pypy.patch
)

python_prepare_all() {
	# avoid replacing PYTHONPATH in tests.
	sed -i -e '/sys\.path/d' test.py || die

	# don't use some random SDK on Darwin
	sed -i -e '/_ldflags =/s/=.*isysroot.*darwin.*None/= None/' \
		setupinfo.py || die

	distutils2_python_prepare_all
}

python_compile() {
	if ! python_is_python3; then
		local -x CFLAGS="${CFLAGS} -fno-strict-aliasing"
	fi
	tc-export PKG_CONFIG
	distutils2_python_compile
}

python_install_all() {
	distutils2_python_install_all
	rm -r ${D}/usr/share
}

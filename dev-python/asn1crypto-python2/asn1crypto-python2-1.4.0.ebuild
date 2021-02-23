# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 )
PYTHON_REQ_USE="threads(+)"

inherit distutils2

MY_PN=asn1crypto
DESCRIPTION="Python ASN.1 library with a focus on performance and a pythonic API"
HOMEPAGE="https://github.com/wbond/asn1crypto/ https://pypi.org/project/asn1crypto/"
# pypi tarball does not have tests
SRC_URI="https://github.com/wbond/asn1crypto/archive/${PV}.tar.gz -> ${MY_PN}-${PV}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"

RDEPEND="!dev-python/${MY_PN}[python_targets_python2_7]"

S="${WORKDIR}"/${MY_PN}-${PV}

distutils_enable_tests unittest

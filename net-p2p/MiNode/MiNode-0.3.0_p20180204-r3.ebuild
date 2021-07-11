# Copyright 2019-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{6..9} )
PYTHON_REQ_USE="ssl,ipv6"

inherit distutils-r1

DESCRIPTION="Python 3 implementation of the Bitmessage protocol."
COMMIT="f0f277f731ffe1eb2295909fac8c3593e18681c7"
HOMEPAGE="https://github.com/TheKysek/${PN}"
SRC_URI="${HOMEPAGE}/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="libressl"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="${PYTHON_DEPS}"

RDEPEND="${DEPEND}
	!libressl? ( dev-libs/openssl:0[-bindist] )
	libressl? ( dev-libs/libressl )
"

S="${WORKDIR}"/${PN}-${COMMIT}

PVM=$(ver_cut 1-2)
PATCHES=( "${FILESDIR}"/${PVM}-setup.patch )

src_install () {
	distutils-r1_src_install
	dodoc README.md

	local DN=${PN,,}
	newconfd "${FILESDIR}"/${DN}.confd ${DN}
	newinitd "${FILESDIR}"/${DN}.initd ${DN}
}

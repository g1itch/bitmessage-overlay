# Copyright 2019-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{6..9} )
PYTHON_REQ_USE="ssl,ipv6"
inherit distutils-r1

DESCRIPTION="Python 3 implementation of the Bitmessage protocol."
COMMIT="20d2e919d9ff81ae7d2ca7570c601fb60e8c2ad2"
HOMEPAGE="https://github.com/g1itch/${PN}"
SRC_URI="${HOMEPAGE}/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="libressl i2p"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="${PYTHON_DEPS}"

RDEPEND="${DEPEND}
	!libressl? ( dev-libs/openssl:0[-bindist] )
	libressl? ( dev-libs/libressl )
	i2p? ( net-vpn/i2pd )
"

S="${WORKDIR}"/${PN}-${COMMIT}

src_install () {
	distutils-r1_src_install
	dodoc README.md

	local DN=${PN,,}
	newconfd "${FILESDIR}"/${DN}.confd ${DN}
	newinitd "${FILESDIR}"/${DN}.initd ${DN}
}

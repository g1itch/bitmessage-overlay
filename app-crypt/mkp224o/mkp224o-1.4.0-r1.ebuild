# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit out-of-source autotools

DESCRIPTION="Vanity address generator for tor onion v3 (ed25519) hidden services"
HOMEPAGE="https://github.com/cathugger/${PN}"
SRC_URI="${HOMEPAGE}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-libs/libsodium"

src_prepare() {
	eautoreconf
	default
}

src_install() {
	dobin ${BUILD_DIR}/${PN}
}

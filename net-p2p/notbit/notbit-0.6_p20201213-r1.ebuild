# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit out-of-source autotools

DESCRIPTION="A minimal Bitmessage client"
HOMEPAGE="https://github.com/bpeel/${PN}"
COMMIT="ecaa3e6d8a121d198cebc0ffe8e39386bd914d07"
SRC_URI="${HOMEPAGE}/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-libs/openssl:0[-bindist]"

S="${WORKDIR}"/${PN}-${COMMIT}


src_prepare() {
	eautoreconf
	default
}

# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{6..9} )
inherit distutils-r1

DESCRIPTION="Alternate client for the Bitmessage network."
COMMIT="82c3f3916926f0b8ae68b5526956790061d4dde2"
HOMEPAGE="https://github.com/g1itch/${PN}"
SRC_URI="${HOMEPAGE}/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="tor"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="${PYTHON_DEPS}"

RDEPEND="${DEPEND}
	dev-python/appdirs[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/PyQt5[${PYTHON_USEDEP}]
	dev-python/qasync[${PYTHON_USEDEP}]
	tor? ( dev-python/PySocks[${PYTHON_USEDEP}] )
"

S="${WORKDIR}"/${PN}-${COMMIT}

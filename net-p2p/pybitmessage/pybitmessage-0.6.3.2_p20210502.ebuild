# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )
PYTHON_REQ_USE="sqlite,ssl"

inherit distutils2 gnome2-utils versionator systemd

MY_PN="PyBitmessage"

DESCRIPTION="Reference client for Bitmessage: a P2P communications protocol"
COMMIT="bb144d78f6e733ea857a4246a1385bd0dce6d09d"
HOMEPAGE="https://bitmessage.org"
SRC_URI="https://github.com/Bitmessage/${MY_PN}/archive/${COMMIT}.tar.gz
	-> ${P}.tar.gz"

LINGUAS=( ar cs da de eo fr it ja nb nl no pl pt ru sk sv zh_cn )

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="daemon desktop json libcanberra libressl +msgpack qrcode qt5 sound systemd tor ${LINGUAS[@]/#/l10n_}"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="${PYTHON_DEPS}"

RDEPEND="${DEPEND}
	dev-python/six-python2
	!libressl? ( dev-libs/openssl:0[-bindist] )
	libressl? ( dev-libs/libressl )
	msgpack? ( dev-python/msgpack-python2 )
	qt5? ( dev-python/PyQt5-python2[widgets,network] )
	json? ( dev-python/jsonrpclib-python2 )
	desktop? ( dev-python/pyxdg-python2 )
	libcanberra? ( dev-python/pycanberra-python2 )
	qrcode? ( dev-python/qrcode-python2 )
	sound? ( || ( media-sound/gst123
				  media-libs/gst-plugins-base:1.0
				  media-sound/mpg123
				  media-sound/alsa-utils ) )
	tor? ( net-libs/stem-python2 )
"

S="${WORKDIR}"/${MY_PN}-${COMMIT}

PVM=$(get_version_component_range 1-3)
PATCHES=(
	"${FILESDIR}"/${PVM}-qt5.patch
	"${FILESDIR}"/${PVM}-knownnodes-opt.patch
)

src_prepare() {
	default_src_prepare

	local lang
	for lang in ${LINGUAS[@]}; do
		use l10n_${lang} || \
			rm -f src/translations/bitmessage_${lang}.{ts,qm}
	done
}

src_install () {
	python_scriptinto /usr/bin
	distutils2_src_install
	dodoc README.md
	doman man/${PN}.1.gz

	if use daemon; then
		local DN="bitmessaged"
		newconfd "${FILESDIR}"/${DN}.confd  ${DN}
		newinitd "${FILESDIR}"/${DN}.initd ${DN}
		systemd_dounit packages/systemd/bitmessage.service
	fi
}

pkg_postinst() {
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}

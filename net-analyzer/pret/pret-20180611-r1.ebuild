# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# https://github.com/RUB-NDS/PRET/issues/35
PYTHON_COMPAT=( python2_7 )

inherit eutils python-single-r1

DESCRIPTION="Printer Exploitation Toolkit"
HOMEPAGE="https://github.com/RUB-NDS/PRET"

if [[ ${PV} = *9999* ]]; then
	inherit golang-vcs
else
	KEYWORDS="~amd64 ~x86"
	EGIT_COMMIT="4f3820a83cd0e8bd88fcc1d09641e54720e5bbc9"
	SRC_URI="https://github.com/RUB-NDS/PRET/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="GPL-2"
SLOT="0"

RDEPEND="${PYTHON_DEPS}
	app-text/ghostscript-gpl
	$(python_gen_cond_dep '
		dev-python/colorama[${PYTHON_MULTI_USEDEP}]
		dev-python/pysnmp[${PYTHON_MULTI_USEDEP}]
	')
	media-gfx/imagemagick"

DEPEND="${RDEPEND}"

S="${WORKDIR}/PRET-${EGIT_COMMIT}"

src_prepare() {
	default
	python_fix_shebang "${S}"
}

src_install() {
	insinto "/usr/share/${PN}"
	doins -r db/ fonts/ lpd/ mibs/ overlays/ testpages/ *.py
	fperms 0755 "/usr/share/${PN}/${PN}.py"

	python_optimize "${D}/usr/share/${PN}"

	make_wrapper $PN \
		"${EPYTHON} /usr/share/${PN}/pret.py" \
		"/usr/share/${PN}"
}

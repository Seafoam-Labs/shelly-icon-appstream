# Maintainer: Zoey Bauer <zoey.erin.bauer@gmail.com>
# Maintainer: Caroline Snyder <hirpeng@gmail.com>
pkgname=shelly-icon-appstream
pkgver=0.0.1
pkgrel=1
pkgdesc="An appstream of icons for shelly alpm to use."
arch=('x86_64')
url="https://github.com/Seafoam-Labs/shelly-icon-appstream"
license=('GPL-3.0-only')
provides=('shelly-icon-appstream')
depends=(
    'git'
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Seafoam-Labs/shelly-icon-appstream/archive/refs/heads/main.tar.gz")

sha256sums=('SKIP')

package() {
    cd "${srcdir}/${pkgname}-main"
    install -dm755 "${pkgdir}/usr/share/shelly-icon-appstream"
    cp -r * "${pkgdir}/usr/share/shelly-icon-appstream/"
}
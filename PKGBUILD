# Maintainer: Bence Hornák <bence.hornak@gmail.com>

pkgname=theia-electron
pkgver=1.0.0
pkgrel=2
arch=('any')
url='https://www.theia-ide.org/'
pkgdesc="Cloud & Desktop IDE Platform"
license=('EPL2')
depends=('nodejs>=10.11.0' 'nodejs<12')
makedepends=('yarn')
options=(!strip) #to speed up build

source=(
  "theia-electron"
  "package.json"
  "theia-electron.desktop"
  "https://raw.githubusercontent.com/eclipse-theia/theia/v$pkgver/logo/theia.svg"
  "https://raw.githubusercontent.com/eclipse-theia/theia/v$pkgver/LICENSE"
)
md5sums=('3503b21ff57ffecfe428da5be1b21171'
         '5eb49842d52aa16e7310064c0fef9900'
         'b316dead79fa33f45c8d689a1c940dab'
         '1dde0e422484895d3509f4ee9bb8d980'
         '93f06061d9ad92aeaaccbc9b36421eb5')

build() {
  yarn install
  yarn build
  # Remove dev dependencies
  yarn install --production --ignore-scripts --prefer-offline
}

package() {
  # Create directory
  install -dm 755 "$pkgdir"/usr/lib/$pkgname
  # Source code
  cp -r --no-preserve=ownership --preserve=mode \
      src-gen lib package.json node_modules \
      "$pkgdir/usr/lib/$pkgname/"

  # Executable
  install -Dm755 theia-electron "$pkgdir/usr/bin/$pkgname"
  # Desktop file
  install -Dm644 theia-electron.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  # Icon
  install -Dm644 theia.svg "$pkgdir"/usr/share/pixmaps/theia.svg

  # License
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

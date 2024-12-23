import Foundation

func day4b(input: String) -> Int {
  let grid = input
    .components(separatedBy: "\n")
    .map { 
      $0.split(separator: "")
    }
    
  return grid.enumerated().flatMap { yIndex, row in
    row.enumerated().filter { xIndex, element in
      guard 
        grid.existsAtIndex(yIndex-1, xIndex-1),
        grid.existsAtIndex(yIndex-1, xIndex+1),
        grid.existsAtIndex(yIndex+1, xIndex-1),
        grid.existsAtIndex(yIndex+1, xIndex+1)
      else {
        return false
      }
      let diagonalNeighbours = [
        grid[yIndex-1][xIndex-1],
        grid[yIndex-1][xIndex+1],
        grid[yIndex+1][xIndex-1],
        grid[yIndex+1][xIndex+1],
      ]
      return
        element == "A" &&
        diagonalNeighbours.sorted() == ["M", "M", "S", "S"] &&
        diagonalNeighbours != ["M", "S", "S", "M"] &&
        diagonalNeighbours != ["S", "M", "M", "S"]
    }
  }
  .count
}

extension Collection where Element: Collection {
    func existsAtIndex(_ index: Index, _ subIndex: Element.Index) -> Bool {
       indices.contains(index) && self[index].indices.contains(subIndex)
   }
}

let input = """
XXXMMSAMXXMASXASAMMSMMSAAMXMAXSAXMSXMXSAXMMXXXXMXAXXXMASMMSSSSSMMMSMSMMSMSMSMMSXMXMMSMMMMAMXSMMMMSSXMASXSMAMSMAXMAMXSXAMSSMSSSMXSMSXXXXAXMMM
AMSMMASAMXXXXAXMAXAAMSAXXMXAMAMXAMMAMAMMSMSMXXASXSMMSMMSAMAAAMXMAMAAMMMSASXXMASAMXMMMAMXSAMMMAXMMAMAMASAMXASAMMMSAMXMMMAAAAAAAMASMXMSMSMMSAM
MAAAMAXXASMMASASMMSSSXAXMXSAMASMSMMSMAXAAAAAMSMMAMXAAAAXAMMMMMASASMSMMAMAMSXMASAMMXASAMXSASMSSMSMSXSMAMXMSXSASAXMAMAAAXMSSMMSMMASAMXSAAAASAS
XSMSMSSMXAAMAXMASMXMMMMSAMXXSMSAMXAMSSSSMSMSMAAMAMMXSXMMSMASASXSXSXMAMXXSAMXMASXXASMSASMSAMAXMAAXMAMMSMSXMXSXMASXXSXMXSAMXMAMAMXSASAMXMMMSXM
XXSXXAAXSSSMSSXMMMAXMASMMMMXMAMMMMXXAMAXAAAAMMMMASAAXASAXMASASXSASASXMAMAASMSAMAMXSMSAMXMAMMMMXMSMMMAMXMAMAMAMSSXMAMMSAMXAMMMAMASAMMSASAMXAA
XMASMMSMMAAAXXXMASXMMMMAAXXAMAMAXXMMAMMMSMSMSXXMSMMMSAMASMAMAMAMAMAMSMSSSMSXSAMXMASXXMAMXAMXAMAXXAXMAMMSAMAMAXAXAAAAMAMMSSXSXXMAMAMXMAXASMMM
SMAMXMAXXAMMMMMXAXAXSSSSSSSXSSSXSASXMMAAAAAAXMMXAXXAMXMSMMSSXMXMAMAMXMAAAAXASAMXMAMXMAAMXXXMAMMSSMMMMSASXSXSAMMXXMXSXAXMAMASAMSSSMMMXMMMMAXA
XMMSSSMSSMSAXAAMSSSMMAXAAAAAXAAASAMXASMSSSMMMAMSMMSAMXXAMAAXAMXSXSAAXSMXMMXMXAMXMMSMAMAMAASXXSAAXXMAMXMXXMAAXMMASMMMMXXMAMAMAMAASAAMASAMXSMM
MAXAXAAAXXSXXMXSAAAMMMMMMMMMMMMMMAMSMMMAAAAASXMAAASAMMSMMMSSMMAMMMMMXMMXSAMSSSMXMMAAASAMSMSAASMSSXSASMSSMMMAMSXXXAAMSSMSMMXSMMMMMSMSASXSAAAM
AAMXSMMMXMXMASXMMXMMSXMMXMAMAAXASAMAXAMMSMMMMASMSMSXMAMXAXMMMAXXAAASMSAXMASAAAMMXSASXXAXMAMMMMMAMXSASAAMXAMMASMSSMMSAAXAASMMMASMMAXMAMAMMSMM
SMSAXAXAMSAMSAAMAXMASASXMMXMSMSXSXSMSXSXMXXXMXMXAMMMMXMSASXASMSSSXSAAMSSXMMMSMMAXSAXXSMMMMMMXXXXXAMAMMASXXSMAMAAAMSMMSMMXSAASASAMSSMAMAMAXAM
MAMASAMXMSASXSXMASMASMMAMMAMAAXMSASXSMMMXMAMSMSXMAMAMSMSSMMXSAAAXXMMXMASAAMAMXMSMMASMMSASAAMSSSMAMMSMMAXAAXMAMMMXMXAXAAXASMMMMXAMMAMAMAMMSXM
MMMMMXMSMMXMAXXMAXAAMASXMSASAXSAMAMMXAMSSXSAAAXAXMSMMAMSAMAMMMMXMXXXXMASMMMAXMXMSMAMAAXXMSXSAAAXXMAAMMMMAMSMXXASASMSSSSMXSXMASXSMSAMXSASMSXS
MXAAAXMAMXSMMMMMMSMXSXMAXXAXASMAMAMAASAAXAXSMSSMMXAXSSXSAMXXAXSSSMMSAMAXXAMAXSAMAXSSMMSSMMMMMMMMXMXXSAMSAMXMASXSASAAXMAXAXASXSAAAMMSMMASAMXM
XSSMSSSMSMMAMXMAXAMMAASXMMSMMMMAMXASAMMMMAMAXXAAASAMXMASMMSMMMSAAAAMXMMMSXSXXSASMXMAXMAAAASMSAXAMMMASAMSAMAMMMMMMMMMMSMMSSMMAMXMMMMAASXMMMAS
AMAMAXXXAAXAMXXXXMSAMXMAAAXAXASMSXAMXXXXMAXXMMSMMSMSSMAMXAAAAMMXMMMSMXAAXMAXMXXMXMSASMSSSMSASAXSASAAMAMSAMAMAAAAMSMMAMAAAAXMXMSXAAXMMMAAMSAS
MSAMMMMSMSSMMSSSSMAXXASXMASXSMSAAXXXMAXSMSSSMMASXXAAMAMXMMSSMSASXSXAMSMMXAMXMMSXMAXASAMAXAMXMXAMMXMSSSMSASMSSSSSMSAMMXMMSSMMAMAMSMSMMSMMMSXM
XSXMAAAAAMXXSAAAASASMXMXMXMAAAMXMMXMAMXSAMAAXXAMMMMMSMSMMMMMMMMMAASAMAMXXSASAASAXMMMMMMAMXMSSMSMSMXXAMAMXMAAAXAXASAMMASXMXAXXSMXAMAXMAXMMMAM
XMAMSSXMSMMMAMMMMMMMXAMXAAMSMMMAXAXSSMAMAMXMMMSMSASAMAAAASASXMMMXMSXMSXSXXASMASMMXXXAAMXSSMMAAAAAAMMMMAMSMMMSMMMAXXMSAMASMSMASXSASAMSXMSASAM
MSSMMMMMAAAXMXSAMMSMSMAMSXXXAMSMSXMAMXASXMAXXXMASASAMSMSMSAMMXSAMXMMMMMMAMMMMAMMSAMMSMMAXAAMMXMSMXMMAMAAMAMXMXXSSMMMXMMAMAXMAMAXAMAXMMASASXS
MXMXSAAXSSMSMAXASAAMAMAMXMMXSMMXSXXSXSXSMSMSXMMMMXMXMXAAAMAMSASAMAMAAAAMAMAXMMSAXMAXAMMMSSMMAMMAXXASXSSMSAMAXAXMAASAAAXSMMXMMMMMXMXAAAXMAMAS
XASAMXMMMXMAMMXMMXXSMXAMAAMAXAAASAMXMMMSAASAASAMXAMASMSMSMMXMASMMASMSSSSMSMSMXMASMXSASMXAMXMMMMAMMXMXXAASAMASMSSXMMMXMSAAXXXXAAXXMMSMSAMXMSM
SMMMSAXAMMSAMSASXSMAMSMSMSMASAMXSMAAAXASMMXSXMAASXSASAAMXMXXMXMMSASAMXMMMMXSXAMAMXAMASXAMMSASASXSXMSMMMMMAMXAXMAMSMSMSMXMXMAMSMMASAAAXXMXMAM
AXAXXMXASAXXMSXXAAMMMAAAAMMMMAMXSXSSSMMSASXAMMMXSXMASXSXMMSMXSAMXAMMMAXMASAMMXASMMXMAMMMMASXMASAAMXAAAXXXSMSXMMAMAASXSAMXAMMXAMMAMSXMXAMXMAM
MSMSAAMXMAXMMSXMSMMXSXSSXSAMXAMMSAMXMAMSAMXMAASXXAMAMAMXSXMAAMMMMXMSSXSMAMAMAXAMASXMASMXMXXAMXMMMASXMMSSXMAAXMSMSMSMAMAMSSSSSMSASMXXMSAMXSAS
XAAMXMASMMAMXMAAAAMAXAAAXSASXSMXMXMAMMMMXMXXSMSMSSMASMMAMAMMMXASXSMXMXMMASMMSAASAMXSAMXAXMMMMAXXMMASAXAXAMSMMMAMAXXMXMAMAAXAXASAXAXXAAAXMMAS
SMXMAXMAAASMMSSMMXXAMSMMMSAMAXMXMSSMXSASXMMMXXSAMASAXXMXXAMAMXAXAXMAMAMMASMAAMMMMMAMASMSSMASMMMXXMASXMASMMMAXMAXMSSMXXMMMXMAMMMMMMMAMSMSSMAM
XSSXSSSMMMMAAAMMSAMSXXAXXMSMAMSMMAAMASMSAAAAMAMAXAMMSMSMSMSASMSMSMSASXXMXSAMSXMASMMSMMXAXMASASXSXMAMAAXAMASAMXXSXAAXSMMMSMMXAXAAAAAMMAAXAMSS
MXSAAAXXSXMXMASAXMAXAMXMSXMMMMMXMXMMMXMSXMMSSXXAMSSMAXAAAXMASAAAAASAMAASAMAXMMSAMXMMASMMSMMSAAAXXMAMMASMSASASXXAMSSMAAXAMAMMXSSSSSMSAMXSMMAX
XAMMMMMSAAASXMMXSXSMXMAAXASXMASMSSMXXMXSMMMAMAMSSMAMXSMSMSMMMMMSMXMMMSMMASXMAXSSSXXMASAXXAAMMMMMMMSXSASXMAMMMMXSAMXMSMMMSAMSMMMXMXASXSXMAMXM
MMMXXXXMMSMXASMXMAXAMXSMSAMASXSAAAXMXMXMASMAXAAXAMAMMMXAMXAAAXXMMXMXMAMMAAXSMMMAMMXMASMMSMMXSAMASXXAMXSAMSMSAMMAAAXMAXMAXXSXASMSSMXMASASXMAS
AASMMMSXMXXSMMMAMAMAMMAXXAMAMSMMSMMSMSMSAMMSSMMSAMXMAMSSSMMMSXMXSAXSAMXMMSMAAAMAMSASAMXMXAAAXASASMMXMAXXMAMSAMAMMMMSMSMMSMMMMMAAAXMXMSAMMSAA
XXAAAAXXMXMMMASMMMSSMAMSXMMMMXXAMXASMSAMXSAXXXMAMXXSXMAXSAMXMXMASMSMXXMASMAXMMMXMMAMXAAMMSMMSAMMMAXSMSSMMAMSXMMSAAAAMAMMAAMMMMMMMMMAAMAMAMSS
MSSXMSXXMAAASXSMAAMAMMXSMMAXXSMSSMMSAMSMAMASMMSMASXAMMSMSSMAMAMXXXXMAMMXMASMMSMSMMAMMSMSAMAXXAMXSSMSAMAMSMXXXAMMMMSSSSSSMSAAASXMAMXAMMAMXXAX
XAAMSAMSMMXASMXXMXSAAXXMAXMSXXAXSAAMXMAMXMXXAAXMASMMXAAAXAMSSXMSMSMXSMMXXAAMAAAAMXASAAAMASASMMMXMXAMSMAMMMSSMSMMSMXAAXAXAAMXMXASXMSASXAAMMSS
SMSMMASAASMMXXAXMAMXSMSMSAXAAMMMSMMSXMAXMMMSMSSXXXAXMSMSMXMMAMXAAAMMXAMXSSMMSMSMSSXSMMMMXMXXAASAMMAMXMSSXAAXMASAAAMMSMMMXMMSSSMMXAAAMXXMAAAM
XXAAMSMMAMAMAMMSSSXAAXAAMMAXXMMASAMXASXXSAAAMMMMAMSXXMAMXAXSMMSMMMSASAMAMAXAXXMAMAAMAXXSAMASMMMASXMXMAAMMMXSXMMSSXSAAAASMXMAAAXSMSMMMXMSMMXX
XSSMMMAXMSSMAXXAAXMAMXMXMXXMSXMAMMMSMMAASMXMMAAMAMXMSMMMSXXAXMXSAMMMSAMASXMMMSMSMSXSAMMAMMXAMXSXXAXAMMMSXSMXAXXXXMMMSSMSMAMMMMMMAAXAXXAAXMSS
XMASMSMMMAMXMSMMSMAAAASXXSAAMAMSMSASMMMMMSMASXSSMSAXXAXASMXMMAASXXAXXMSMSXAAAAAMXMXMASAAXSAMXMAMXMMXSAMXAMXSMMMAMSAAMAMXMSSMXSXMSMSSSMSSSXAA
MMAMXASXMAXAMAMAAXMMXXSAAXMASAMMAMASMSMMAXMAMMAAASMXSAMXXAMXXMXSASMXMXAAMXSMSMMXAMXAXXMASXSXXAAXMXSSMMSMAXAMAAXASMMMSASMMMXXMXAMXAAMAXAAMXMM
SMAMSMMXSASXSSMSXSXMSSMMMMXAXASMMMMMMAAMXSMASMMMMMMXMXASXSMSASMMAMAASXSSXAXXXXAMXMSXMSSMSAMSSSMAMAMAAAXMSMMSSMSXSAAXXASXSXAMMSMMMMMMSMMAMAXX
SMMXAAXMMASAAXMMASAMXAAXMASMSMMMXAXASXSMAXXAXXXMAMXAMXSMSAAXASAMXMSMMAAMMMMSAMSAMXSAAAAAMAMAMAMAMASMMMSXXAAAAAXXSMMSMSMAMMMSAAXAAAMXXXSASXSX
MAMXSMXAMAMMMMAMMSMMMXMASASMAXMASMSMXMAMMMMSSMMSAMSASMMSSMMMXMXXAAXXAMMMAMAAAXMASXSXMMSMSSMMSASMSAMAAXAMSMMSMMMXXMAMMAMAXMASMSSSSMSXMASAMMMM
MAMXMSXMAMXMMSMSXMMSAXXXMASASMSAMXAMAXAMSAMXAAXMMASAMASXXMASMMSSMSMSXXXXSMXMXMXMXXMASMMAAAAASAMAMXXMMMMAAMMXXMMMAMMXSASXMMXSAXXAMXSAMAMSMSAM
SASAAMMSMSMSAAXSAAAXMAXMXSXXMASAASMSMSMSSSSSMMXAMAMASXMMASASAAAXAAAASAMXMXSXSMSMMXSAMAXMSSMMMMMSXMMSAMXSMSMAMXAMASXASASXASAMMMXMMXSAMASAXSAS
SSSMSMAAAAAMSSXSAMMSXSXAXXXXMAMSMSAMAAXMXAMXAXSXMXSAMMASAMSSMMMMXMXMMXMAMMAAAAAAMAMASAMXAMXSXXAXAMAAAMMMXAMSMSXSASMXMAMMXMASAMSAMASAMXXMASAM
XMXAMMSMSMSMAMASXMAXAMMXMSMSMSMMMSMMXMSXXSMSSMMASAXMASXMASAXAMMSAMAXAAMAMAMSMXXMMASAMXXMASASXMSSXMMSSMASXMMMMMAMASAMMSMAMSSMAMXAMASAMXSXXMAS
MAMXMAMXMMMMXXAMXMXMXMAAMAASXMASAMXMSMMMMMAMXASXMASXMSAMXMMSXMASASMSSSSSSSXAXAXSSMMAXXXMAMXSAXAMAMMMAMASAXAAAMAMXMXMAAXXAXAMSMSSMXSAMSAMXSAM
XSXSMMSMSAAAXMSMMAAXAMMXSMMMAMAMAMMMAAAAAMMMSMMMMMMAASMMASXMAMMXXAAAXXAXAMXSMXMAAASMMAXMAMMMAMXSAXAMAMXSMSSSSMMSXSSMSMSASXXMMAAXXXXXMAXXAMXS
XXAMXMAASXMSSXMAMSMSSSMAXMASXMSSXMXMMMMXXSMMAAAMAAMMMMXMXSAMXMXXSMMMSMSMMMMAASMSMMAAMAMSSMMXSXMSMSMSXSAXXAMMXAAXAXMAAAAXXMASMMMXMSMSMSAXXMMA
XMSMAXMXMMSXMASMMAMMAAMSMXXMAAAMXSMSMXMSMXAAMXSSSSSXSXMXASMMAMXMMAAAXXXAAAAMSMAXAMSAMAXAAASAXAAXAXAAXMAMMMSAXMMMSMMMMMMSMSMSMSMSAAXAAMMSMSXA
SAMMSXSAAXMASAMXMAMMSAMMASXSMMMMMXAAAASAMSMMXAXMAAXXMASMAMMMMXAASXMSSSSSMSXXMMMMXAMAMMMSMMMAXMMMXMXMXMXXSXMXSSXXAAMASXMMAAAMAAAMXMMMMXXAAAMX
SASAXXSSXMMXMXXMSXSAMAXSAMXAASAAMMSMSMSAMMXAMSMMMMMSXAAMSMSASXMXMAAXAXAAXMASXXAMSXSSMXMMMSMMMAXAMXAXASAMXASAAAXSASXASASMSMSMMMSMAXXAASMMSMSA
SAMASMMMXSSSMMMMAXMAMAMMMXSMMMSMSAXMXASXMSMSXMASAMXSMSSXAASAXXXXSMMMXMSMMSMMASMXMMAAAMMMAAAASMMSASMXAXAMSMMMMMMSAMMXMAMMASAMXAAMSMMXMSAAAAMM
MAMAMAXXXAAAXAAMXXSAMAMASMSXSXAXMXSAMMMAMMAMAXMSASAXAMMMMXMAMSMXMASXMMMXAMXXMMMAASMMMMXMSMSMSAMAXAMMMMSAMXXAXSAMASMSMAMMMMSMMSMAAAMXMSMMMXMX
MXMXMAMSMMSMSSSMMASXSMMMSAMAXXXMXXMMMAMMMMAMMMXSXMMMXSAAMASMMSAAXXAXAXMMMMXMXAXSMMAAAXXMXXXXSMXSMMXAAAMXMXSMSMASMMAAXSXXAAXXXXMSSSMAAMMXXSXM
SASMMSMSAAXAAAMASAMXAAAXMMMSMMMMXMSXSSSSXSASMSAMXSMAAAMAXAXAAXSSSMMASMMXSASMSSMXASMMMMXSAAMXMXMXAMSSSMSASASMXXAMAMSMSMMSMSSMSXMAMXMMSXMSMMMA
SASAAMASMMMMMXSXMASASMMSAASAMMAMAXMAAXAMASAAXMASAMMMXMSSMSSMMXAMAAMMXMAAMASAAMAXAMXMAMMSMMMAXAASAMXAXASXMASAMMSSSMXSMAAAMMAAAXMASAMSMXMAAASM
MXMMXMAMASXXAXMAMXXAMAAMMMSASMSSMSMMMMAMAMXMASAMXSMMSMAAAXXASXSSXMMXXMMSSSMMMMSMMXAMAXAXAAXMSMMMXAMXMXMMMXMXMAMMXXMAXMXSMSMMMSXAXAXAAAMSXMXX
MASAXMASAMAMXXXAMXMSMMMMMXSXMAMAXAXMAAXMXSXMMMMSAMAASMSMMMSMMAMMASMMMSAAXAASXAXMAMMMMMMMMMXXAMAXASXSMXMAMASMSMXXXMSSMSAXAMSAAXMMSSSMSMXMMSSS
SASAMXAMMSAMSSMSSSMASAAXXAMAXSSMMMMSASMSAMAXMAXMAMMMSAAAAAXXMXMSAMAAAMAMXSMMMAMSAMXASASXAXMASMXSAMAASXSMSAMAAMXMSAAAAMASASMMMXMMAAAAMXAAMXAA
MAMMXMASMSAXXAXXAMXAXMMMSSMMMAAMMXASMMXMASMMSSMXAMSAMXMMSMMXMXMMMSSSMXSSMMSSXMASAXSAMAXMXXMXMAXMAMSMMXAAMAMSMMAAAMMMSMXMMMAAMSSMMXMMMXMXMMSM
SSMSXSASASMMSSMMAMMMSAAAAAMXXMAXMMMXAXSSMMAAAMMSMSMSSSMXXAMSSSMAMAMAXAMAXAXSAMXSAMMSMSMSSSSSMMMMAMXAXMMMMAMXASMSSSSXMXMMMSSMSAXAXASXSMSAAMAS
SAAXAMAMAXMAXAMSSMAXSXMXXSASMXSMAMASMMXAASMMMSAAXSXXMASAXAMXAASMMASAMXSMMMSSXMAMXMAXSAASAAAXAXASASXMMMXAXMMSAXAAAXMASMMAAAAMMMSMMMAAAAMMMMAS
SMMSXMAMSMMSSMMAASMMMASXMAMAAAXSAMXAXMSSMMXXSMMSXMAAAAMMSSSMSMMMMMMXSAXXAXAMAMXSMMXSXMXMMMMSXSASXSXSASXMASASXMMMSMSAMASMSSMMAXAAAXMMMMMXSMSM
XSAMXMXSXAAAAXMSMMXASAMAAMXMMAMMXMAMXXAAASAMXAMMXSAMMSSXAAMMASASMMAMMMSSSMXXAMXXAXMAMXXMXMAAMMAMASASASAMXMMMXMXAAXMASAMXXAXSAMXSSSXSXXMAMXAX
MMMMXMXMXMXMMMMXXMMMMAXAMXSXSSSSXSAXSMSSMMMASMMMAXASXAAMMSMSAXMSAMXSAAXAMAMSMXMASMMSXMXXAXMSXMAMAMMMXMMSXMXSAMMSMSAASASMMMXMXXMXXMAXAMMMSSSS
XMASAMXXAMSMSSXSASAASMSSMMSAMAAAASXMXXMAXXMMMSAMXXSMMMSXAMXMMSMSXMAMMXXMMAMAASXMXAAMAMASMSXMASAXAMXMASMAAMAXASMAMXMASAMAAAMMMMMMAMAMSMMSAXAM
MXAAAAXMMAAAAMAXAMXMXXAASAMXMMMMMMMSMMAMSSXAASMSAXMAAXXMASAMXAASXMASXSMXSASXMXAXSMMMAMAAXSAXMMMXAXXMASMSSMASMMMASMSAMXMSMMSMAAAXAMXXMASMMMMX
AMASAMXAXMMXMXAMSMSXMMMMMMMXSXMXXSAMASXMAXSMMMAMMAXSMAAXXSASMMXMASAXAAXASASXXXMMSAMSXSSMMMAMSAMSAMXMAXXAMXAXMASXXAXXAAMASXAXSSMSMXSAMXMAAXXM
XAXXXAXSSSSMMMSSMAAASAMXMSAXMASXMMXSAMXMSMMXSMAMXMAAXXMAXMMMASXMMMSMSMMMSXXMMXSAXAMAXMAASMSMSAMAAAAMASMMXMAMSMMASXSAMXMAXXMMMAMSXAAAXAXSMSMA
MSAMMXMMAMXAAAXAMAMMMXSAAXMASMMASAAMMMSAXAMAXMXXAXSXMMXMMASMSMAXSAMXXAAAXMMXMAMAMSMMMMSMMAXMXXMMSSSMMSASXSSMXAXXAASASMMSSXSAMXASMMMSMSXXMSMS
XMASAASMMSSSMMSAMXXAXASMSMXXXASMMMMXASMMSMMMMASXSXMASMAMMMMMAMSMMASASXMSSXMAMAMXMXASMMMMMMMXXSAMMXMAXSAMAAAAMSASMMSAMMAAAMSXMSSXAAXXAXASASAA
XSAMXMSAAXMASAXASMMSAMXAXAMXSMMASXSSMSAXXMAMMAMAXMXXMSASASAAAAXASXMMSASAXASXSAXSASAMMAAXAASMMMASMMXXMMAMMMMSMMAXXAMXMMMMMMXXASASXMSMAMAMAMSM
XMSSMXSMMSXAMSSXMAAXMXMMMMAXMASAMXMAMSXMXMASMSMSMSMMMXXSASAXXSMXMAAXMMMASMMMSMSAMMSMSSSXSMXAXSAMMASXMSXSAMXXAMXMMAXMSASASMXMMSAMXXXMAMAMXMAX
SXAXMASAMXMMSAXMMMMMAAXAAXMMMMMAMXSAMSASXMAMXAAAAAXSXSMMMMXMSXXASMMMXXMAMXSXSSMAXAXMXAAMMASXMMASMAMAAAAXXAMMMMMXSXSAAASAAMAMXMAMXMSSMMAXAMAX
SMMSMMSAMAASMXSMSAAXSSMSSXSAASMSMAXXSMMAMAMSSMMMSMMASMASMAAMMASMSXMMMXMMMAMMMAMSMMXXMMMMXAMMASAMMSSMMMSMSMSASMSMMMAMXAMXSSXSASAMAMAAXSMSSMSS
XAXAXXMXMAMSAMSASMMMAMAMAMXXAXAMMMMMMXXXXXXAXAAMAMXMASAMMXXAMXMXSMSAAXSAMASASMMMASAASXSSMSMXXMASAMMXAXAAAASAXMAAASMMMXXXMAASASASXMXSMAAAAAAX
SSMMMXMAXMMMAMMMMSXXAAMMAMXMSMMXASAMXSXMMAMMSMMSAMAXAMXSASXSXMAXXASAMXMXSASMSXXSAMSSMASMAMXMASXMASXSAXMMMMMAMSMSMSXXMAMXMMMMXMAMMMSXXMASMMMS
XMASMASAMXASXMXSMMXSMMXSXMXAAAXSMMAXAMMXMAXMAAMSASXSMMMSASAXAMXSMAMMSAMXMASAXAMSXMXMMMMMAMAXXMAXAMMMSXASMMSSMAAMXMMMSAMMXMXMAMXMXMAXAMXAMXXX
XSAMSMMAXXAXAXAAAAAXASAMMMXXXXMAMMSMAXAAXMMSXSMSAMAAAXAMXMAMXMAXAMAASAMMMSMAMMMMXXXXASAMMSSMXMMMMXSAAMAMXAAMMSSMASAXSAMAAAASASASXMMSAMMSMMMX
MMMXASMASMSMAMSSMMXSAMMMXSAMXXSASAMSSSSMSAASAXMMSMXSMMMSMMAMAMAMMMMMXMMSSMXSAMAASMMSMMASAAAMXXSAMAMSSSXMMMMXAAAMXMSXSAMSXSMSAMAMAAXMXMAXMASM
SAMXAXMASAMMSMXAAAXMXMAMAMASAASAMMMAMXAMXMAMAXXAAXAMXXXAASXSMSASMAXXSMMMAMAMASMXSAASMSMMMSSMMAMAMXXAMXAXMSSMMSSMXXMMMAMXMMMMMSMSAMXSAMXXXAXA
SASAMXMXMAMAAMXMMMXXAXAMASASMAMXSAMXMMSMXSSMSMMSSSMMASXXXXAMXSASXMAMAAASAMXMAMXSSMMMAAXMMAAMAAXAMXMASXSSMAMXAMXXXSAAXAMXAXXAAMXAAXMMMSMSMMSM
SXMAXXAXMMMSSMASASMSMMSXMMASXXMAXXMSAXAAXAAAXSAMXAAAXSASXMMMAMMMMMSSSSMSXSSMSSMMXSAXXMASMSSMSMSMMMSMMAAAMASXMAAXMXMSSSSMSASMSSXMMMAAMAAAAAAX
XMSSXXSMMSAAAXMSAXAAMAXAMMMMMAMXSAXAASMSMMMMMMMMSSMSAMAMMAXMASAAAAAMXXAXAAAAAXMMASXSXAAMAAMXXXAAAMASXMMMMASAXMMSMSAMAAAAXXMAMXMXSXSSSMXMSSMS
SXAAMXMAAMMSMMMMXMSMMASAMASASXSMMXMMXAMAAAAAAXAAMAMAAMSSSSMAMXMSSMSSSMMMSMMMMMSMAXASAMXMMMSMXMMXMSASMSAXMASXMASAAXAMMSMMMSSSMMAMXAMAAAXXAMXX
AMAXMAMMMSXXASXXMAAXMASXMASASAAXXAAXMMSMSMMXMXMSSMMSXMAAXMAASXMXMAMXAMXAXXXXXAMMSMXMXSAAAAAASMSSXMAMASMSMMMMAMMMSMXSAXASAAMAAXSMMSMSMMMMAXXX
MMAMSASMMMASAMXMASXSMMXAMAMXMMMMMMSSMMAXXMXSMSMAXAAXAMMXMXSMMAXXMXMSMMXSXMMMMSAAXAMMSSMSMSSXXAMAXMAMXMXAMAAMSXAAAXMMASAMMSSSMMMAAXAAXSXSSMSM
XMAMMASAAMMMMMSAXMXMAMSMMSSMASXAAAAAAXMXMSXSAAMASMXSXMMXXAXMSMMMSAMAXSMMMSAAAXMASAAXXXMAMXMAMSMMXSASMMMMSSSSMXMSSXXMXMMMAAAAMASMMMMMSXAAAAAM
XSMSMXSMMXSAXAXSMMMSAMAAAXAMASMSMSSSMMSMAAAMAMMMXMASMAXMMSSMASXAMASMMMAAAXMMMXMASXMMMMSMSAMXMMAXXMXSXMXXAXMAMAMAXMXSSSXMMXMMMXMXXASMXMMMMSMX
MSAXMAXASASXMMSAMAAXASMSMSXMASAMAXAMXAAMSMSAAMAXASASMMMXAAAMAMMMSAMXASXMMSXSMXMAMXXAAAXXMXSSMSMMMMMSAMAMMSSSMMMASXXMAMMMSAMSXSMMSASMSASXMAMM
AMMMMASXMAMXSXSXSMSSXMAAMMAMAMAMMMSMMSSMXAMXSSXSASAMAMSMMSSMXSAMAMASXMASMSAAAXMASMSMSMMMMMMMAAMAXAASXMASXAXAAXMAMXMMAMAAMAXSAMSAAAXAXASXSASX
SAXXMMMMMSMMMAMAXAXMMMMMASAMAMSSXAXXXAXMAXSAMXAMMMMMAMAAMXXMXAMSASXMASAMAMSMMSSXSAMAMXMAAAASXMSSMMXSAMXSMXSSMMMASAXSASMSSSMMAMMSSSMMMSMAMASX
XXMSMAAXAXAAMAMXMAMMSAMXMSSSXSAAMMSMMMSMMMMAMMXMMAMSSSSSMMSXMMMSAMMSAMMMSMXMAXASMAMAMSMSXSMSAXAXSMAXMAMMMMMAMSSMSXXMMMAXAMXMMMAMXMAXSAMSMAMX
MAMASXXMSSSMSMSAMXXMAMXAXXMMXMXMAAAMAAAAAXSXMXXXMXMAAMMMXAMASXXMXMAMXXXAMASAMXMMSXMSASMXXXXMXMAXMMXSXSAMXAXAMXAXSXSASMMMAMSSMMASXSXMMAMAMXSX
MASASMSMMAMXXAXAMXXXMSMMMSAMXXMSMXSMMSSSMMSASAMSASMSMXAMMMSAMAXMMMMMSXMASMMAXAXAMXMMXXAMASMSMSSSSMAMAXMAMSMSXSAMXASAMSXMXMAAXSXSAAMSSSMMXASX
SMXXMXAMXMAXMSMSSMMMMAAAAXASMSMAXXMAXAXAXAMASMASMAAAMXMMMXMASMMSAXAASAXASAMXMMMMXAXSSMSMAMAAASMAAMXSASXSXMAMAXAAMMMAMAXSXSMSMMASMXMMAMSXMMMS
XXXMSSMSMSSSMXXMAXAASMSMSMXMAXXAXMMXMASXMMMAMXXMXMSMSASAAMAAMXAXMSMSSXMXSAMMASAASXSAAAXMAMSXSMMSMMAMASAMXMSMMSMMMXASMMASAMMMAXAXMAXMAMMMXAAS
SXSAAAAXMAMAXXMSMASMSMMAXMMMSMSSXSAASAMASXMMXSAXAXMASASXSAMMSMXXXAMAMMSASXMASXXXAMXMMMXMMMMMXXAXASAMMMXMSMXAXAASMMXXAXAMAMSSMMSXSXXMASXSSMSS
SASMXMMMMMSSMSMAXMMXMAMAMASXXAMAAMSMMASMMAMMAXMSSSMXMAMAXXXSAMMSSXSAAAMASMMMAMMSAMXXAMXMMAMMMMMSMMAXMAXSAMMMMSSMAMASMMMSMMAAXAMMSAAMASMAASAM
MMMSAASAMXAAAXSASXMASXMMSAMXMMMMMMXMSAMXXAMMMXXAMXXAMASMMSMSASAMMASXXAMXMASMAMASXMXMAXAAMASMAMMAMMXMMAMAMMXSAMAMMMXMAMAAXMSMMXSAXSSMASMSXMSS
MXAXSAMXSMSSSXXMXAMASMAAMAMXAXAXAMAMMXSASMSSSSMSXSAMSAMAMSAMAMMSMAMXSAMXSAMMAMXSASASXMSXSASXSMMASXSMMSSMXAAMMXAMXMMMXMSSXMAAASMMMAMXAXAXAMXM
MMSMXMAXXAMMXMAXSAMXSXMMMAXSSSMSMSASMAMXSAAXAAAMASXMMMSAMMAMSMMSMMXAAMSXMASMSSMSAMMSAAAAMAMMMMSASAAMAMXXMMXXSMSSSMAAAAMAMSSMMSAMMAMXAMXMAXAS
SXMAMMSSMAMAXSAMXSAMXAMSMMMMAAMAAXXXMASMMMMMSMMMAMAXAMMXXMXMAAXSASMXSAAXXXMAXAXMAMAMMMMXMAAAAXMAMXMMSSSMSSSMSXAAMXAMASMXMAXAAMMMMXSSMAMSMSAS
AAMSMAAAMXMAMMMSSXMMXMASASAMSMMMSMSMMAXXAAMXAMSMMSAMXSSSSMSSSXMSAMAMAMMXXXMASMMSXMSXSASXSXMMXXMAMXSXMAAXAAAAXMMSMSMSAMXSMXXMMSXMMAMAMSAAMMXM
MSMAMMSSMXMASAXMAMXXAXMSAAMMMMMMMASAMSSSSMSXSXXAAXXAAXAAAAAMMAXMMMAMXMXMAXMASMAMXAASAAAXMMSSSMSMXAAAXXXMMSMMMAXXAAMMXMAAXMASAXAMMSSXMMMXMMAX
MXXMMMXMAXXMSMSMXMXSASMMMXXAMASAMMMAMAAXAASAXASMMSMMMMMSMMXAXXMXXXXMAXAAMXMAXMAMXMMSXMMSXMAAAAXMMSSMMMMAXXAXXSMMMMSSMMSMAMXMASXMAXMMXSXMASXS
SMMSMMMXMMSMMAAAASASXSXAXMMXXAMASMSMMMSMMMMASASAAXAAAAXXXMSXSAMXSXASMXMSMMMSSSMSMAXMXMXXAMMXMMMXAMAAAAASMXMXMAXAMXMXAAAMAAXAAMAMSSMASAASXMAS
SAAAAAAMXMAAMSMSMMAMASXXSASXMSSMMXAAAAAXAAMXMASMMSSMMXXAAXAASASAMSMMSAAAAXAMAAAMAXAMAXSSMMSXSSSMSSSMSMSAMASAMMSSSMMSMMSSSSSMXSXMAXAXXSMMSMAM
SMMSSMXXASXSMAXXXMSMSMAMSXMAXAAXMSSSMSSSMMMAMMMAAAASMMXSMSMXSAMXMAXAXMSSXMXMSMMSSXMSMSMXMXMAXAAAMAXAXMXAMXMAMMAAAMMAXXXMAAXMMMMSMMSXMMXAXMAS
XAAXMMXMMMAAXAMXAAAXAMSMSASMMSAMXAAMMMAAXSSSSSSMMSXMMSAAAXXXMXMXMSMMSXXMASAMXXAXXMMAMXMAXAMSMXMSMMMMMMSXMASMMMMMMMSMSMXMMMMAMAAAXAMAMXMMMXSS
SMMSMAAXXMSMMMMMMMMSSMXXSXMXMMMSMMSMAMMMMMAMAAMMXXXAAMXMMMMXMAMAXAAXSAXSAMAXMMMSMXSAMSSXSASAMXXAAXAXAXMASMSXMAMMMXAAAAMXMASASMSSMMSSMXMXSMXS
XMAXMSXSAXXXMMMAAAXXMASAMSMAMMASXAXXXSSMAMXMMMMSAMMMMMMXMASASAXXXMSMXAXMASXMXAMXAAXAMAAASXSAMXMSSSXSAMMXSAMAMAMSSSMSMSAASMSXSXMAAXAMXXSAMXAX
SXSXAAMMXMXASASMSMSAMXMAMAMAXMAXXAMXXXAXXMASXXAMASXSAMXAMMMAMMMSXSAMMXMSAMMASMXMSMXMMMSMMAMXMAAXMMXMXSSMMASAMASXAAAMXXMAMXMAXAMSMMASXXMMMMXS
MAMMMMSSMXSAMASXAASMMSXMMMXSXMXSAMASMSMMMSMSMSSSMMXSMSSSSMMSMMASMSASMAMMSSMXMSAXAMASAMMAAXMSSSSMMSAMSAAASAMXSXSMMMAMMXXXMASAXSMMAMXXMASAASMA
MAMMMAXAAXMXMAMMMMMSMAASXMAXASAMXSXMAAXAXAAXAAXMAMXMMXXMAXAAAMAXASAAXAXXAXXXAMMSXSASASXMXASXAAXAASASMSSMMMSAMAXAXXMXSAAMMMSXAMXMAXAAAMMMMXAM
MSSXAMSMMMMAMAMAXAAAMSMMAMASXMAMXSAMSMSSSMSMMMMXAMXXXMASXMSSSMMSXMXMSSSMMSSMAMXMAMASMMAMSMAMMMMSMMMMXAMMAAXASMSMMMMAMSSMAXXMAMAMAXSXMXASMSSX
XAMMSAMXAAMASMSMMMSXMAXSSMAMMSMMAMMMXAXAMXMASMSSSXSAMMMAAAAXXMXMMAAXXXAXXAAXSMMMMMAMASXMASAAASAMXSMSMSSSMSSMMAAXAAMAMAXMXMAMMSAMAAMAMSMSAAXA
MSSMMAXMXXSASAAXXAAMXMAMMXAMAAAMAXSAMXSMSASXMAAAAAXMMAXMMMMSXMASXSMSASAMXSMMXMAXAMMSMXMXAMMSMXAMASAAMXMXXXXMMSMSXSSXMASXMXMMMAXMMXSAMAAXMMXA
AXAASAMMAAMAMMMXMASMSSXSASMMSSXSAXMMSXMASASAMMMSMSSXSAMSXSAMXMAXAAAXMMMSMMXXXASMMXMAMMSMSSMAXMAMAMSMSXMMSMSMAXXXAXXXMAMAXASASAMXSASMSMSMXXSS
SSMMMAXMMSSMXXSSMMMMXAAXAAAAMAMXMSMMSXMAMXMAXMXMXMMAXAXSAMMSMXSMSMMSMAXAASMSSMMASMSMXASXMAXAMXAMXXAMAAXAAAXMAXSMSMASMAMSMMSAMAXXMASAAMAXSAXA
MAXMMSMXMMAMSXMAAXXSMMMMSMSXSXSMAAAXSAMMXSMMMMAAAMMSMSMMAMASMAMMMAAXXASMXMAASXSAMAASMXSAXAMSSSSSMMAASMMSSXSASXSAMXXMSSXMAMMMMMMMMAMXMSASMAMX
AXMXMAXXMMAMSASXMMAXAASXMAMMMMSASMSMSAMAAMASASXSMMAAAAAXXMASMXMAXMXMMMMXSMMMSXMAMXAMMMMXMSSXAMXAASXMAXAMAASAMXMSMSMMXMASXMAAMASXMAMAXMXMMAAX
SMSAXXSMSSSMSAMXMXMMXMSAMMMMXAMXMAAASXMMMSASAMMAASXMSMXSAMASXSAMXSXMASXMXXAXMASMSMSMSSSSXMXMMMSSMMMSMMXSMXMAMSMMMXAXAMAMXMMXMASXXXMSMMMMXMXM
XAXXXSAAAAMAMMMMSAMXSAXXMAAMMSMSMXMMMXAAMMMMMMMMMXMAXAAXXMMSMSAMMSAXAMAMMSSMXXMAXAXAAASAMXXMXAXMMSXAXMASMMMAMAAMMMSXSMMXMSMSMASMSAAAAASMMXAA
MAMSXMAMMMMAMAAASASAAAXSSSMSAXMSAMXMXMMSSMXMAMXXAMMMMMMSMSXSXSXMASAMSSXMAXAXSSXAMSMMMSMMXMASASXMASXXMAMXAXSASXSMAAMXMAMXASAAMXMASMSMSMSAASXS
MAMAAAASMXSSSSMXMMMMMMMMAAAMASAXXXXAAXXAMXAASMXSASMXSAMXXMASAMSMXMASAAAMXMMMAAMSXMAXMAMXMAXMAXXMASMMSSXSSMSAMXAMXMMASAMXSMSMSAMMMAXAMAMMMMAA
SXMXXMXMAAMAAMXASMASXAXMMMMMAMMMMMSSSSMAMXXXXAAXMMMAMAXMSMAMAMXMASMMXSXMAMAMAXAAASXMSASAXXXMAMAMMSMAAAMAMXMAMSSMSSXASAMMMAMMSASXSXMXMAMAAMXM
AMSXSAMXMMMMMMMAASAXMXMXAAAMMXXAAMAAAXXXSSSXSAMXSAMMSSMMAMASAMXMAAAAAXAMASXSXSSMMMSASASXMMXMMSMSSXMMXSMAMAMAMXAAAXMAXAMAMAMXMAMAMAMXMSXMMXSX
MAXMASMXAAXASXXAMMMSMAXXXSAMXSSSSSSSMSSXMAAXSAAXSAXXAMASMXMSXXXMSSMMSXMMASAAAXAASAMMMMMAMSAMXAMXAMASMXXAXMMMMMMMMSASXMMSXMXAMAMXSAMXXMMXSAMX
XSSMAMXXAMXMMMMMXAXAMMXSMMXSAMXAXAMXXXMAMXMXSAMMSSMMASXMSAMXMMMXMAMSMASMMMXMXMMMMAMXAAMMAMASMSSMXMAXMAXSMSAAAMAXXXMXAMAAAMSSSMSMSXSXASAAMMSM
XMAAASXSMSAAASXSSSSSXSASAAAMXSMSMMMXMASMMASXMXMXMAMSAMXASMSAXSAMXMSXMAMAXAAXAMXMSMMSSSSXSSMMAAMMAMXXMSMXASMSMXSAMXASMMSSMMAAAXAAXASMMMMMSAAM
MSAMMSASASXSMSAAAAMXAMASMMMXSAMXAMXAMMMAXASAMMMASMMMXSMXMXXMMMXSXMMAMMXSMSMMMXAXAAMMAAXXMAMMMMMSMMMSAXAMXMAMAMXAXAXASXMAXXXSXMMSMXMAXSXMMXSS
AXASAXMMAMAMAMMMMSMMXMXMASAXMXMXAMSXXAXAMXSMMASASXAAMSMMXSMMAMXMASMSMAAMXMXMSSMMSSMMMMXSAMXSXMAMAAXMAMXMMMXMAMXMASAMAXSAMXMMMSXAXMSXMAMAMXXM
SXSMMSAMXMMXXMMXAMXMXMASMMMSMAXMAMAMSSMSAMXXSXSASXXSAXAMAXMSXXASMMAAMMMMASMXMAXAMXXXAXMAMSXMAMMXMMSSSMSSSMSXSMAMAMAXMXMAXXAAXMSMSAMSMXMSAMXX
XMXAAMMASMMSMSSMMMAXAMAMAAXAMAMMAMAXAMXAXAMAMXMAMXMAXXAMAXMAAMMSSMXAMXXSAXAAMAMSAMXSXXASMSASMMSAAMAXMXAMAAMAMXXMAXXMXXMXMSSMMMXMXXMAXMAMMSMS
MASMMXSASAAAAAXAMSMSMSSSSMSXMASASMMSAMXMMXSAAAMMMAAMSSXMSSMMSAAMXMMMSAXMAMSMSSMXASAMXMSMAMAMAASMSMASXMMSMMMAMXMSSSXMAMMAMXAMXSAMSSSMSMMXAAAA
AMAAAAMASMMMMMSAMAAAAAAMAAMXXSXAMAXSXMMXAASMMMMASXSAAAAMAAXAAMAMASAAMMSMAMXAMXASAMMSAXAMMMSSMMMAMAAMAAAAASMXSXAAAAMXAXSAMSXMASASAAAXSAAMSMSM
SXSAMSMAMXXXMXXMSMSMMMSMMXMASAXXSXMMMAXXMMSAMXMAXSAMXSSMSSMSSMMSASMSMMMMASMAMMMMAMXSXSASAXXAMXMXMMSSSMMSSMAASMMMSMAMXMSAXXSMMSXMMSMMXMAXMAMX
"""

print(day4b(input: input)) // 1815
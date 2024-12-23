import Foundation

func day6a(input: String) -> Int {
  let grid = input
    .components(separatedBy: "\n")
    .map { $0.split(separator: "") }

  var y = grid.firstIndex(where: { $0.contains("^") })!
  var x = grid[y].firstIndex(of: "^")!
  var direction = Direction.up

  func stepForward() {
    switch direction {
      case .up: y -= 1
      case .down: y += 1
      case .left: x -= 1
      case .right: x += 1
    }
  }
  func stepBackward() {
    switch direction {
      case .up: y += 1
      case .down: y -= 1
      case .left: x += 1
      case .right: x -= 1
    }
  }

  var visited = [(y, x)]

  while true {
    stepForward()

    if y < 0 || y >= grid.count || x < 0 || x >= grid.first!.count {
      break
    } else if grid[y][x] == "#" {
      stepBackward()
      direction.turnRight()
    } else {
      if !visited.contains(where: { $0 == (y, x) }) {
        visited.append((y, x))
      }
    }
  }

  return visited.count
}

enum Direction {
  case up, down, left, right

  mutating func turnRight() {
    self = switch self {
      case .up: .right
      case .down: .left
      case .left: .up
      case .right: .down
    }
  }
}

let input = """
....#.......#.............#..##...................#..#..#..................................#....#.................................
................................#..#.............##.....#....#....................#.............................................#.
.#....#.........................................................................................#.#...............................
.......#.......#..................#........#..................................#...............#...........#.......................
..#......................#.....#...........#..........................................................................#...........
.#.............#.............#....#...............#..#................................................#..........#................
.#............................................#........#........................................#...............................#.
...............#...........#....#............................................#.......#...................................#........
.#.........................#................#.........#..##.....#........................................#........................
.........#...#......#..................#...........................................................#...#..............#...........
..................#..#....................#...................#.....................#......#....#...........#..#.........#........
.........................................................................................#..........#.............................
...........#...........#.....#..................#....................#............................................................
........#...........................................#............#...........................#.........................#..........
....##....##..............................#.................................................................#....#....#.......#...
..#............#.........##....................................................#.....................#.....................#......
......#.......#.##.......##...........................................#........#................#.................................
..#...#.........................................#....................#.....#........#....#......#......#................#.........
.#...................##............................................................#....................#.......................#.
......#....#.....#............#............#.................................................#..#.......#..........#..............
...............#....#.........#.............................................................................................#.....
...........#..........................#..............................................#.........#...............#..#..............#
...........#...#.................#........................................#...................#....#..............................
........#................................#...........................................................#.......#....................
...........#....................#.....#.........................................................#..............#....#...#.........
..........#........................................................#..............#..............................#................
..............................##...........................................#.....................................................#
...#..#........................................................................................................#........#.....##..
.......#........#........#.#.....................#................................................#.......................#...#...
...............#.......................................................................#.........#......#.#.##....................
......#..................#.....#..................#..#..................#.................#..#.....#...................#....#.....
.....#........#.............#....#...............................#.................#..............................................
....................................................#.......#......................................#....#.........................
...#.............#...............#.............#......#.#..............#......#.............#.....................................
..............#..................#............................................#..#.........................#......................
.............#............#........#........................................#.....................................................
...#.........#.............#.........#............#..........................................#................#...#...............
...........#.................#...................................................................#................................
...#..............................................................................................................#...............
..........#...............#...#......#...............##..............................................#....#...................#...
.........................................#...................................................#..#.....................#...........
......#..#.........#....................................#....................#..........#......#..................................
........#.........................................#................#.#.......#.......................#............#..............#
..........................#...............#....................#.............................#..............#.....................
..........................#...........#............................................#....#...#.....................................
...........#........#..........#..............................................................#...##......#.......#......#........
....#..........#...#...................##..........#.........................................#....#...............................
...............................................................#................................................#..........#......
................................................................................................................#.....#...........
...#.....................#......................................................................#....................#............
......................##...........#.......#.......#.......................................#......................................
......#......#........#....................................................................................#......................
.......#......................#.........................................................#.......#.................................
...............#..........#...#.#..........#.....#..............##.......#.....#....................................#.............
.......##....................................................................................#.#...#..........................#...
......#.............#.#.........................#....#......#......#...............#.........#..#.................................
.........................#........#.........................#....#..................#.................#............#......#.#.....
............#............#......................#.#................##........#....................................................
......#..............................#...........#.......#........#.................#.............................................
............................................#.....................................................#.................#...#.........
.................#.......................................#..................##...#..............................#......#.......#..
.#..#................#.#......................................#..........#..........#...........................#.......#.........
.........................................................................#.....##.............................#.............#.....
.#.......................#.....................#....##....#........................................#..............................
......#...........................................##..........#......#.........................#..#..........#....#...#...........
........#.#....................................................................................#..................................
..........#..............................#.....#......#.........#............................#........................#...........
....................#................................................................#...............................#........#...
....................................#.......#...................................##.........................#......................
.....................#.....................................#.........#..........................#.................................
.......#.................................#.....................#........................................#....................#....
......................................................................#.....#........................#.......................#....
..#............................#..................#...#.........#..........#..#.........................................#.#.......
....#............................................................................#.............................#..#.....#.........
......#..................................#.............................................................................#.........#
....#......................................................................#................#.....#...........................#...
.............#.........................#.#....................#........................#......................................#...
....#......................................................................#...#..................#..........#....#...............
.......#....#.#..#..#....#........#.....................................................#..................#..#...................
#..............#....................................#.......................................#.....................#...........#...
#.........#....#..#.........#.................#..................#.#..............................##......................#.......
................#.........#......................................................................................................#
...............................#.........#.................................................................#.....#.#..............
..........#................#.............................#.............#.......#..........................................#.......
.....#.........#........#..............#.......................................#.........^........................................
........................#................#........#.......................................#............................#...#......
......#.....#.......#.................................................#...............#.....#.....................................
..................................................#......#.....................................#....#....#.##....................#
.........................................................................#...#..............#...............#.....................
..........#.................#...................#.........................................................................#....#..
...........#.....................#.....#.......................................#....................#............#........#.......
......................#...........#........................................................................................#......
..........#.......#.................................................................................#.......#.....................
........#.....................................#..................................................##...............................
.......#................................#.........#..#..................................................................#.........
...........#...................##.............#...............................#..........#....................#.....#...#.........
....................................##..#..........................................#..............................................
...............#..#............#..............................#.#.#........#......#...............................................
..#..................................#....#.......................................................................................
........................#.................##.........#......................#........................#.#.#........................
.......................................#.##....................................................................#..................
..................................##............#..............................................................................#..
..#.................................................#.....................................................................#.......
................#..#..#...#.........#...#.................................................................#.....................##
.....#......................#...........#.............#...........................................................................
........#.....................#..............................................#................#..............................#....
........#.............#.........................#.............................................#................#..........#......#
#........#...................................#....#......#...............................#........................................
...........#........#..................................................#.............#..........................#.............#...
....................#..#.#.................................................#.#...........#................................#.#.....
.......................#...................................................#....................................................#.
......#......................................#..........##.......................#...........#.........#..........................
.......#..................#..................#......................#............................#.............#...#..............
.....................................................................................#........#................#.........#........
............................#..............................................................#.....#........#......#................
..#..........................#.........#.................#...........#...#....#........................#.......#.............#....
.#.....#.....#.....................#........#...............#............#.##........#..................................#.........
............#.#..................................#..#.........#.................#............................#........#.....#.....
............#.........................#..................................#........................................................
....................#................#...........#..........................................................................#.....
....................#.....................................................#.........#......#...........#...#.#..................#.
........#..........#.......................................#...............#....#............#.....................#..............
.......#...#......#...................#.......#..........................#.........................#...................#..........
.#............#....###...............###................................#.............................#...........................
.............................#.......#..............................#.#.........................................#..#..............
...............#.........#...................#...................................#..#..................#..........................
........#.......#..#..................#........................................................................#...............#..
.#.............#.....................#........#..........................#.........#..........................#...........#.......
.....#.............#.....#..........#.....#.............#............#.............................#..........................#...
...................#.......................#......#.#..............#..###.....#......................#...........#.......#.#......
"""

print(day6a(input: input)) // 4982
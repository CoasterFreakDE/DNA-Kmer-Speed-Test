import Foundation

func convert(_ c: Character) -> Character {
    switch c {
    case "A":
        return "C"
    case "C":
        return "G"
    case "G":
        return "T"
    case "T":
        return "A"
    default:
        return " "
    }
}

func main() {
    let program_name = CommandLine.arguments[0]
    guard CommandLine.arguments.count > 1 else {
        print("Usage: \(program_name) <length>")
        return
    }

    guard let length = UInt64(CommandLine.arguments[1]) else {
        print("Invalid length argument")
        return
    }

    var s = [Character](repeating: "A", count: Int(length))
    let sLast = [Character](repeating: "T", count: Int(length))

    let start = Date()
    var counter: UInt64 = 1

    while s != sLast {
        counter += 1
        for i in 0..<s.count {
            let old = s[i]
            s[i] = convert(old)
            if old != "T" {
                break
            }
        }
    }

    let deltaMs = Date().timeIntervalSince(start) * 1000
    print("Number of generated k-mers: \(counter) - took \(deltaMs)ms")
}

main()
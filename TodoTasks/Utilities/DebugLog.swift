//
// DebugLog.swift
// TodoTasks
//
// Copyright © 2019 MasaMatsu. All rights reserved.
//

import Foundation

class DebugLog {
    static func write(
        obj: Any?,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    ) {
        #if DEBUG

        print("[\(function)] \(NSString(string: file).lastPathComponent):\(line): \(obj ?? "nil")")

        #endif
    }
}

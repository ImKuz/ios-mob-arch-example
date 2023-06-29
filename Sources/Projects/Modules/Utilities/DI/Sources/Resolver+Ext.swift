public extension Resolver {

    func resolve<T>(
        file: String = #filePath,
        function: String = #function,
        line: UInt = #line
    ) -> T {
        if let dependency = resolve(T.self) {
            return dependency
        } else {
            fatalError("""
            Fatal Error | Unable to resolve dependency \(T.self)
            \(file).\(line) | \(function)
            """)
        }
    }
}

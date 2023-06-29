import DI

final public class AppAssembler {

    public init() {}

    public func rootContainer() -> Container {
        let rootContainer = Container()
        let diAssembler = Assembler(container: rootContainer)
        diAssembler.apply(assemblies: assemblyList)
        return rootContainer
    }
}

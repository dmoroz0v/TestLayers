

import Foundation
import NeedleFoundation
import NoteEditApplication
import NoteEditScene
import NotesCore
import NotesListApplication
import NotesListScene

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class NotesListDependencyecb0d872d282a504a53aProvider: NotesListDependency {
    var notesProvider: NotesProvider {
        return notesComponent.notesProvider
    }
    private let notesComponent: NotesComponent
    init(notesComponent: NotesComponent) {
        self.notesComponent = notesComponent
    }
}
/// ^->NotesComponent->NotesListDepComponent
private func factory61585c1626df66ba32d262654e1cb4236443be67(_ component: NeedleFoundation.Scope) -> AnyObject {
    return NotesListDependencyecb0d872d282a504a53aProvider(notesComponent: parent1(component) as! NotesComponent)
}
private class NoteEditDependency36675e35eb09466167a6Provider: NoteEditDependency {
    var notesProvider: NotesProvider {
        return notesComponent.notesProvider
    }
    private let notesComponent: NotesComponent
    init(notesComponent: NotesComponent) {
        self.notesComponent = notesComponent
    }
}
/// ^->NotesComponent->NoteEditDepComponent
private func factory33f34f6b0c35f1d4590962654e1cb4236443be67(_ component: NeedleFoundation.Scope) -> AnyObject {
    return NoteEditDependency36675e35eb09466167a6Provider(notesComponent: parent1(component) as! NotesComponent)
}

#else
extension NotesComponent: Registration {
    public func registerItems() {

        localTable["notesListSceneAssembly-NotesListSceneAssembly"] = { [unowned self] in self.notesListSceneAssembly as Any }
        localTable["noteEditSceneAssembly-NoteEditSceneAssembly"] = { [unowned self] in self.noteEditSceneAssembly as Any }
        localTable["notesProvider-NotesProvider"] = { [unowned self] in self.notesProvider as Any }
    }
}
extension NotesListDepComponent: Registration {
    public func registerItems() {
        keyPathToName[\NotesListDependency.notesProvider] = "notesProvider-NotesProvider"
    }
}
extension NoteEditDepComponent: Registration {
    public func registerItems() {
        keyPathToName[\NoteEditDependency.notesProvider] = "notesProvider-NotesProvider"
    }
}


#endif

private func factoryEmptyDependencyProvider(_ component: NeedleFoundation.Scope) -> AnyObject {
    return EmptyDependencyProvider(component: component)
}

// MARK: - Registration
private func registerProviderFactory(_ componentPath: String, _ factory: @escaping (NeedleFoundation.Scope) -> AnyObject) {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: componentPath, factory)
}

#if !NEEDLE_DYNAMIC

@inline(never) private func register1() {
    registerProviderFactory("^->NotesComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->NotesComponent->NotesListDepComponent", factory61585c1626df66ba32d262654e1cb4236443be67)
    registerProviderFactory("^->NotesComponent->NoteEditDepComponent", factory33f34f6b0c35f1d4590962654e1cb4236443be67)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}

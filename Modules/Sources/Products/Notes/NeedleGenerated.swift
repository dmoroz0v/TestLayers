

import Foundation
import NeedleFoundation
import NoteEditDI
import NotesCore
import NotesListDI

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class NotesListDependency2ac0ecde6263307d829eProvider: NotesListDependency {
    var notesProvider: NotesProvider {
        return notesComponent.notesProvider
    }
    private let notesComponent: NotesComponent
    init(notesComponent: NotesComponent) {
        self.notesComponent = notesComponent
    }
}
/// ^->NotesComponent->NotesListComponent
private func factorybd6204e5520a4840886162654e1cb4236443be67(_ component: NeedleFoundation.Scope) -> AnyObject {
    return NotesListDependency2ac0ecde6263307d829eProvider(notesComponent: parent1(component) as! NotesComponent)
}
private class NoteEditDependency054c984a1b3f758e8b3bProvider: NoteEditDependency {
    var notesProvider: NotesProvider {
        return notesComponent.notesProvider
    }
    private let notesComponent: NotesComponent
    init(notesComponent: NotesComponent) {
        self.notesComponent = notesComponent
    }
}
/// ^->NotesComponent->NoteEditComponent
private func factoryc7fd598a8e0da481c3a562654e1cb4236443be67(_ component: NeedleFoundation.Scope) -> AnyObject {
    return NoteEditDependency054c984a1b3f758e8b3bProvider(notesComponent: parent1(component) as! NotesComponent)
}

#else
extension NotesComponent: Registration {
    public func registerItems() {

        localTable["notesListAssembly-NotesListAssembly"] = { [unowned self] in self.notesListAssembly as Any }
        localTable["noteEditAssembly-NoteEditAssembly"] = { [unowned self] in self.noteEditAssembly as Any }
        localTable["notesProvider-NotesProvider"] = { [unowned self] in self.notesProvider as Any }
    }
}
extension NotesListComponent: Registration {
    public func registerItems() {
        keyPathToName[\NotesListDependency.notesProvider] = "notesProvider-NotesProvider"
    }
}
extension NoteEditComponent: Registration {
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
    registerProviderFactory("^->NotesComponent->NotesListComponent", factorybd6204e5520a4840886162654e1cb4236443be67)
    registerProviderFactory("^->NotesComponent->NoteEditComponent", factoryc7fd598a8e0da481c3a562654e1cb4236443be67)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}



import Foundation
import NeedleFoundation
import NoteEditApplication
import NoteEditAssembly
import NotesCoreDomain
import NotesListApplication
import NotesListAssembly

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class NotesListDependencyc80f763c1a0c643ee717Provider: NotesListDependency {
    var notesProvider: NotesProvider {
        return notesBootstrapComponent.notesProvider
    }
    private let notesBootstrapComponent: NotesBootstrapComponent
    init(notesBootstrapComponent: NotesBootstrapComponent) {
        self.notesBootstrapComponent = notesBootstrapComponent
    }
}
/// ^->NotesBootstrapComponent->NotesListComponent
private func factoryb965523897956df7b395f9d7cf758ea41e150465(_ component: NeedleFoundation.Scope) -> AnyObject {
    return NotesListDependencyc80f763c1a0c643ee717Provider(notesBootstrapComponent: parent1(component) as! NotesBootstrapComponent)
}
private class NoteEditDependency522f2f4a8a43357f9072Provider: NoteEditDependency {
    var notesProvider: NotesProvider {
        return notesBootstrapComponent.notesProvider
    }
    private let notesBootstrapComponent: NotesBootstrapComponent
    init(notesBootstrapComponent: NotesBootstrapComponent) {
        self.notesBootstrapComponent = notesBootstrapComponent
    }
}
/// ^->NotesBootstrapComponent->NoteEditComponent
private func factory8566686b2cfba3594b72f9d7cf758ea41e150465(_ component: NeedleFoundation.Scope) -> AnyObject {
    return NoteEditDependency522f2f4a8a43357f9072Provider(notesBootstrapComponent: parent1(component) as! NotesBootstrapComponent)
}

#else
extension NotesBootstrapComponent: Registration {
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
    registerProviderFactory("^->NotesBootstrapComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->NotesBootstrapComponent->NotesListComponent", factoryb965523897956df7b395f9d7cf758ea41e150465)
    registerProviderFactory("^->NotesBootstrapComponent->NoteEditComponent", factory8566686b2cfba3594b72f9d7cf758ea41e150465)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}

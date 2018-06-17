//
//  Dynamic.swift
//  code-demo
//
//  Created by Tancrède Chazallet on 17/06/2018.
//  Copyright © 2018 BitBuildr. All rights reserved.
//

import Foundation

class Dynamic<T> {
	class Listener {
		typealias ListenerAction = (T) -> Void
		
		weak var listener: AnyObject?
		var action: ListenerAction
		
		init(listener: AnyObject, action: @escaping ListenerAction) {
			self.listener = listener
			self.action = action
		}
	}
	
	/// Updating that value won't trigger any binding
	internal var silentValue: T
	/// Updating that value will trigger all bindings
	internal var value: T {
		get {
			return silentValue
		}
		set(newValue) {
			silentValue = newValue
			fireAll()
		}
	}
	
	private var listeners : [Dynamic<T>.Listener] = []
	
	internal init(_ v: T) {
		silentValue = v
	}
	
	internal func bind(_ listener: AnyObject, _ action: @escaping Listener.ListenerAction) {
		cleanListeners()
		listeners += [Listener(listener: listener, action: action)]
	}
	
	internal func bindAndFire(_ listener: AnyObject, _ action: @escaping Listener.ListenerAction) {
		bind(listener, action)
		fire(listener)
	}
	
	internal func bindAndFireAll(_ listener: AnyObject, _ action: @escaping Listener.ListenerAction) {
		bind(listener, action)
		fireAll()
	}
	
	internal func fire(_ listener: AnyObject) {
		if let listener = listeners.first(where: { $0.listener === listener}) {
			listener.action(value)
		}
	}
	
	internal func fireAll() {
		listeners.forEach({ $0.action(value) })
	}
	
	internal func unbind(listener: AnyObject) {
		if let index = listeners.index(where: { $0.listener === listener}) {
			listeners.remove(at: index)
		}
	}
	
	internal func unbindAll() {
		listeners.removeAll()
	}
	
	private func cleanListeners() {
		if let indexToRemove = listeners.enumerated().first(where: {$0.element.listener == nil})?.offset {
			listeners.remove(at: indexToRemove)
			cleanListeners()
		}
	}
}

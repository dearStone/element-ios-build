//
// Copyright 2026 Coconut
//
// SPDX-License-Identifier: AGPL-3.0-only
// Please see LICENSE in the repository root for full details.
//

import UIKit

/// The app's main window.
///
/// Locks the Dynamic Type size to the default (Large) category so that the
/// in-app typography does not change with the system "Text Size" / "Display
/// Size" setting.
final class CoconutWindow: UIWindow {
    
    override var traitCollection: UITraitCollection {
        UITraitCollection(traitsFrom: [super.traitCollection, UITraitCollection(preferredContentSizeCategory: .large)])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        lockContentSizeCategory()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        lockContentSizeCategory()
    }
    
    /// Uses the iOS 17+ trait overrides API in addition to the `traitCollection`
    /// override above, as UIWindow's trait propagation ignores overrides on
    /// iOS 17 and later.
    private func lockContentSizeCategory() {
        if #available(iOS 17.0, *) {
            traitOverrides.preferredContentSizeCategory = .large
        }
    }
}

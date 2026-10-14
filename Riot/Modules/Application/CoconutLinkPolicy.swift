//
// Copyright 2026 Coconut
//
// SPDX-License-Identifier: AGPL-3.0-only
// Please see LICENSE in the repository root for full details.
//

import Foundation

/// Blocks links that point at the Element/Matrix public ecosystem so that they
/// are silently ignored instead of being opened.
///
/// Covers `element.io`, `matrix.org` and `github.com` including all subdomains.
@objcMembers
final class CoconutLinkPolicy: NSObject {
    
    /// Domains that must never be opened.
    private static let blockedDomains = ["element.io", "matrix.org", "github.com"]
    
    /// Returns `true` when the URL must not be opened.
    static func isBlocked(_ url: URL) -> Bool {
        guard let host = url.host?.lowercased(), !host.isEmpty else {
            return false
        }
        return blockedDomains.contains { host == $0 || host.hasSuffix(".\($0)") }
    }
    
    /// Convenience wrapper for Objective-C call sites that hold a URL string.
    static func isBlockedURLString(_ urlString: String) -> Bool {
        guard let url = URL(string: urlString) else {
            return false
        }
        return isBlocked(url)
    }
}

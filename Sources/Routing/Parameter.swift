import Async
import HTTP

/// Capable of being used as a route parameter.
///
/// http://localhost:8000/routing/parameters/#creating-custom-parameters
public protocol Parameter {
    /// the unique key to use as a slug in route building
    static var uniqueSlug: String { get }

    // returns the found model for the resolved url parameter
    static func make(for parameter: String, in request: Request) throws -> Future<Self>
}

extension Parameter {
    /// The path component for this route parameter
    public static var parameter: PathComponent {
        return .parameter(uniqueSlug)
    }
}

import XCTest
import MMDB

class MMDBTests: XCTestCase {
    var database: MMDB!
    
    override func setUp() {
        super.setUp()
        database = MMDB(Bundle(for: MMDBTests.self).path(forResource: "GeoLite2-Country", ofType: "mmdb")!)
    }

    func testExample() {
        XCTAssertEqual(database.lookup("202.108.22.220")?.isoCode, "CN")
        XCTAssertEqual(database.lookup("8.8.8.8")?.isoCode, "US")
        XCTAssertEqual(database.lookup("8.8.4.4")?.isoCode, "US")
        
        XCTAssertNotNil(database.lookup(IPOfHost("youtube.com")!))
        XCTAssertNotNil(database.lookup(IPOfHost("facebook.com")!))
        XCTAssertNotNil(database.lookup(IPOfHost("twitter.com")!))
        XCTAssertNotNil(database.lookup(IPOfHost("instagram.com")!))
        XCTAssertNotNil(database.lookup(IPOfHost("google.com")!))
    }

    func testCloudFlare() {
        let cloudflareDNS = database.lookup("1.1.1.1")
        XCTAssertNotNil(cloudflareDNS)
    }
}

// See http://stackoverflow.com/questions/25890533/how-can-i-get-a-real-ip-address-from-dns-query-in-swift
func IPOfHost(_ host: String) -> String? {
    let host = CFHostCreateWithName(nil, host as CFString).takeRetainedValue()
    CFHostStartInfoResolution(host, .addresses, nil)
    var success = DarwinBoolean(false)
    guard let addressing = CFHostGetAddressing(host, &success) else {
        return nil
    }

    let addresses = addressing.takeUnretainedValue() as NSArray
    if addresses.count > 0 {
        let theAddress = addresses[0] as! Data
        var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
        let infoResult = getnameinfo(
            (theAddress as NSData).bytes.bindMemory(to: sockaddr.self, capacity: theAddress.count),
            socklen_t(theAddress.count),
            &hostname,
            socklen_t(hostname.count),
            nil,
            0,
            NI_NUMERICHOST
        )
        if infoResult == 0 {
            if let numAddress = String(validatingUTF8: hostname) {
                return numAddress
            }
        }
    }

    return nil
}

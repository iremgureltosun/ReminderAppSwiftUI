//
//  LecturePersistentManagerTests.swift
//  RemindMeTests
//
//  Created by Tosun, Irem on 26.10.2023.
//

@testable import RemindMe
import XCTest

final class LecturePersistenceManagerTests: XCTestCase {
    @Inject var  lectureManager: LectureStorageProtocol

    func testInsert() {
        let lecture = Lecture(id: UUID().uuidString, title: "History", subtitle: "Atatürk İlke ve Inkılapları")
        do {
            try lectureManager.save(lecture)
            let recordFromDb = try lectureManager.fetch().filter { $0.id == lecture.id }.first
            XCTAssertTrue(recordFromDb == lecture)
        } catch {
            XCTFail("Error occured \(error)")
        }
    }
}

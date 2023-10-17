//
//  RemindMeTests.swift
//  RemindMeTests
//
//  Created by Tosun, Irem on 22.09.2023.
//

@testable import RemindMe
import XCTest

final class StudentPersistenceManagerTests: XCTestCase {
    @Inject var studentManager: StudentManagerProtocol

    func testInsert() {
        let school = School(id: UUID().uuidString, schoolName: "Ted College", schoolDescription: "Primary school", students:[])
        let student = Student(id: UUID().uuidString, name: "Irem", surname: "Tosun", school: school)
        do {
            try studentManager.save(student)
            let studentFromDB = try studentManager.fetch().filter { $0.id == student.id }.first
            XCTAssertTrue(studentFromDB == student)
        } catch {
            XCTFail("Error occured \(error)")
        }
    }
}

//
//  RemindMeTests.swift
//  RemindMeTests
//
//  Created by Tosun, Irem on 22.09.2023.
//

@testable import RemindMe
import XCTest

final class StudentPersistenceManagerTests: XCTestCase {
    @Inject var studentPersistenceManager: StudentPersistenceManagerProtocol 

    func testInsert() {
        let school = SchoolModel(schoolName: "Ted College", schoolDescription: "Primary school")
        let student = StudentModel(name: "Irem", surname: "Tosun", school: school)
        do{
            try studentPersistenceManager.save(student)
            let studentFromDB = try studentPersistenceManager.fetch().filter { $0.id == student.id }.first
            XCTAssertTrue(studentFromDB == student)
        }catch{
            XCTFail("Error occured \(error)")
        }
    }
}

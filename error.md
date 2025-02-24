# Error Log

## Timestamp: 2023-10-10 10:00 AM
**Errors Identified:**
1. **Duplicate Class Declarations**:
   - `_LearningApiService` was declared in both `learning_api_service.dart` and `learning_api_service.g.dart`.

**Resolution:**
- Removed the manual implementation of `_LearningApiService` in `learning_api_service.dart`.

---

## Timestamp: 2023-10-10 10:30 AM
**Errors Identified:**
2. **Return Type Mismatches**:
   - Several methods in `AttendanceRepositoryImpl` and other repositories had return types that did not match their overridden methods.

**Resolution:**
- Updated the return types in `AttendanceRepositoryImpl` to match the overridden methods.

---

## Timestamp: 2023-10-10 11:00 AM
**Errors Identified:**
3. **Undefined Getters**:
   - Getters like `statusCode` and `statusMessage` were not defined in classes such as `AttendanceResponse` and `ScheduleResponse`.

**Resolution:**
- Implemented the `fromJson` method in `AttendanceResponse` and `ScheduleResponse` to ensure proper data handling.

---

## Timestamp: 2023-10-10 11:30 AM
**Errors Identified:**
4. **Constructor Issues**:
   - The constructors for `DataSuccess` and `DataFailed` were not being called correctly.

**Resolution:**
- Ensured that the constructors were called with the correct parameters in the repository implementations.

---

## Timestamp: 2023-10-10 12:00 PM
**Errors Identified:**
5. **Method Not Defined**:
   - Methods like `handleResponse` and `SuccessState` were not defined in their respective classes.

**Resolution:**
- Implemented proper error handling directly in the repository methods instead of relying on undefined methods.

---

## Timestamp: 2023-10-10 12:30 PM
**Errors Identified:**
6. **Login Method Missing Parameters**:
   - The `login` method in `LearningRepository` was missing required parameters.

**Resolution:**
- Updated the `login` method to include the necessary credentials parameter.

---

## Timestamp: 2023-10-10 1:00 PM
**Errors Identified:**
7. **AttendanceResponse fromJson Issue**:
   - The `AttendanceResponse` class was missing a proper `fromJson` method.

**Resolution:**
- Added the `fromJson` method to the `AttendanceResponse` class to handle JSON parsing correctly.

---

## Timestamp: 2023-10-10 1:30 PM
**Errors Identified:**
8. **PhotoRepository Issues**:
   - The `PhotoRepository` was using an undefined `handleResponse` method.

**Resolution:**
- Updated the `PhotoRepository` to handle API responses directly instead of using undefined methods.

---

## Ongoing Issues:
1. **Jurnal PKL Module Errors**:
   - There are still multiple errors related to the `jurnal_pkl` module, including undefined getters and methods in the `JurnalPKLController`.

**Next Steps:**
- Focus on resolving the remaining errors in the `jurnal_pkl` module, specifically addressing the undefined getters and methods in the controller and views. 
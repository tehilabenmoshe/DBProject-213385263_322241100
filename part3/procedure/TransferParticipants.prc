CREATE OR REPLACE PROCEDURE TransferParticipants(
    from_course_id IN Course.Course_ID%TYPE,
    to_course_id IN Course.Course_ID%TYPE,
    ref_cur OUT SYS_REFCURSOR
)
IS
    TYPE ParticipantRec IS RECORD (
        participant_id Participant.Participant_ID%TYPE,
        registration_id Registration.Registration_ID%TYPE
    );

    CURSOR participant_cursor IS
        SELECT p.Participant_ID, r.Registration_ID
        FROM Participant p
        JOIN Registration r ON p.Participant_ID = r.Participant_ID
        WHERE r.Course_ID = from_course_id;

    participant_rec ParticipantRec;
    err_msg VARCHAR2(32767);

BEGIN
    OPEN participant_cursor;
    LOOP
        FETCH participant_cursor INTO participant_rec;
        EXIT WHEN participant_cursor%NOTFOUND;

        -- Check if participant is already registered for the to_course
        DECLARE
            duplicate_count INT;
        BEGIN
            SELECT COUNT(*)
            INTO duplicate_count
            FROM Registration
            WHERE Participant_ID = participant_rec.participant_id
            AND Course_ID = to_course_id;

            IF duplicate_count = 0 THEN
                -- Update registration
                UPDATE Registration
                SET Course_ID = to_course_id
                WHERE Registration_ID = participant_rec.registration_id;
            ELSE
                -- Skip this participant
                DBMS_OUTPUT.PUT_LINE('Participant ' || participant_rec.participant_id || ' is already registered for the course ' || to_course_id);
            END IF;
        END;
    END LOOP;
    CLOSE participant_cursor;

    OPEN ref_cur FOR SELECT 'Participants transferred successfully' AS message FROM dual;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        err_msg := 'Error occurred: ' || TO_CHAR(SQLCODE) || ' - ' || SUBSTR(SQLERRM, 1, 200);
        OPEN ref_cur FOR SELECT err_msg AS message FROM dual;
        ROLLBACK;
END;
/

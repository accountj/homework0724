DROP TABLE ROOM;
DROP SEQUENCE SEQ_ROOM;
COMMIT;

CREATE SEQUENCE SEQ_ROOM NOCACHE NOCYCLE;
CREATE TABLE ROOM (
    ROOM_ID         NUMBER PRIMARY KEY,
    ROOM_NUMBER     VARCHAR2(10) NOT NULL,
    ROOM_TYPE       VARCHAR2(20),               -- 예: Single, Double, Suite
    STATUS          VARCHAR2(20),               -- 예: 예약가능, 예약중, 청소중
    RESERVER_NAME   VARCHAR2(50),               -- 예약자 이름
    CHECKIN_DATE    DATE,
    CHECKOUT_DATE   DATE,
    DEL_YN          CHAR(1) DEFAULT 'N' CHECK(DEL_YN IN ('Y','N'))
);

INSERT INTO ROOM (ROOM_ID, ROOM_NUMBER, ROOM_TYPE, STATUS, RESERVER_NAME, CHECKIN_DATE, CHECKOUT_DATE)
VALUES (SEQ_ROOM.NEXTVAL, '101', 'Single', '예약가능', NULL, NULL, NULL);

INSERT INTO ROOM (ROOM_ID, ROOM_NUMBER, ROOM_TYPE, STATUS, RESERVER_NAME, CHECKIN_DATE, CHECKOUT_DATE)
VALUES (SEQ_ROOM.NEXTVAL, '102', 'Double', '예약중', '홍길동', TO_DATE('2025-07-25', 'YYYY-MM-DD'), TO_DATE('2025-07-27', 'YYYY-MM-DD'));

INSERT INTO ROOM (ROOM_ID, ROOM_NUMBER, ROOM_TYPE, STATUS, RESERVER_NAME, CHECKIN_DATE, CHECKOUT_DATE)
VALUES (SEQ_ROOM.NEXTVAL, '103', 'Suite', '청소중', NULL, NULL, NULL);

INSERT INTO ROOM (ROOM_ID, ROOM_NUMBER, ROOM_TYPE, STATUS, RESERVER_NAME, CHECKIN_DATE, CHECKOUT_DATE)
VALUES (SEQ_ROOM.NEXTVAL, '104', 'Double', '예약가능', NULL, NULL, NULL);

INSERT INTO ROOM (ROOM_ID, ROOM_NUMBER, ROOM_TYPE, STATUS, RESERVER_NAME, CHECKIN_DATE, CHECKOUT_DATE)
VALUES (SEQ_ROOM.NEXTVAL, '105', 'Single', '예약중', '김철수', TO_DATE('2025-07-24', 'YYYY-MM-DD'), TO_DATE('2025-07-26', 'YYYY-MM-DD'));

INSERT INTO ROOM (ROOM_ID, ROOM_NUMBER, ROOM_TYPE, STATUS, RESERVER_NAME, CHECKIN_DATE, CHECKOUT_DATE)
VALUES (SEQ_ROOM.NEXTVAL, '106', 'Suite', '예약가능', NULL, NULL, NULL);

INSERT INTO ROOM (ROOM_ID, ROOM_NUMBER, ROOM_TYPE, STATUS, RESERVER_NAME, CHECKIN_DATE, CHECKOUT_DATE)
VALUES (SEQ_ROOM.NEXTVAL, '107', 'Single', '청소중', NULL, NULL, NULL);

INSERT INTO ROOM (ROOM_ID, ROOM_NUMBER, ROOM_TYPE, STATUS, RESERVER_NAME, CHECKIN_DATE, CHECKOUT_DATE)
VALUES (SEQ_ROOM.NEXTVAL, '108', 'Double', '예약중', '이지은', TO_DATE('2025-07-23', 'YYYY-MM-DD'), TO_DATE('2025-07-25', 'YYYY-MM-DD'));

INSERT INTO ROOM (ROOM_ID, ROOM_NUMBER, ROOM_TYPE, STATUS, RESERVER_NAME, CHECKIN_DATE, CHECKOUT_DATE)
VALUES (SEQ_ROOM.NEXTVAL, '109', 'Suite', '예약중', '박서준', TO_DATE('2025-07-24', 'YYYY-MM-DD'), TO_DATE('2025-07-28', 'YYYY-MM-DD'));

INSERT INTO ROOM (ROOM_ID, ROOM_NUMBER, ROOM_TYPE, STATUS, RESERVER_NAME, CHECKIN_DATE, CHECKOUT_DATE)
VALUES (SEQ_ROOM.NEXTVAL, '110', 'Single', '예약가능', NULL, NULL, NULL);

COMMIT;

INSERT INTO ROOM (
    ROOM_ID
    , ROOM_NUMBER
    , ROOM_TYPE
    , STATUS
    , RESERVER_NAME
    , CHECKIN_DATE
    , CHECKOUT_DATE
) VALUES (
    SEQ_ROOM.NEXTVAL
    , '111'
    , 'Double'
    , '예약가능'
    , NULL
    , NULL
    , NULL
);


UPDATE ROOM
SET STATUS = '예약중',
    RESERVER_NAME = '유재석',
    CHECKIN_DATE = TO_DATE('2025-08-01', 'YYYY-MM-DD'),
    CHECKOUT_DATE = TO_DATE('2025-08-03', 'YYYY-MM-DD')
WHERE ROOM_NUMBER = '106';


UPDATE ROOM
SET DEL_YN = 'Y'
WHERE ROOM_ID = 3;

DELETE FROM ROOM
WHERE ROOM_ID = 3;

SELECT *
FROM ROOM
WHERE DEL_YN = 'N'
ORDER BY ROOM_NUMBER;
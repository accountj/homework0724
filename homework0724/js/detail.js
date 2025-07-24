function selectOne() {
  const params = new URLSearchParams(location.search);
  const roomId = params.get('roomId');

  const url = `http://127.0.0.1:8080/api/room/${roomId}`;

  fetch(url)
    .then((resp) => resp.json())
    .then((vo) => {
      document.querySelector('#roomId').value = vo.roomId;
      document.querySelector('#roomNumber').value = vo.roomNumber;
      document.querySelector('#roomType').value = vo.roomType;
      document.querySelector('#status').value = vo.status;
      document.querySelector('#reserverName').value = vo.reserverName ?? '';
      document.querySelector('#checkinDate').value = vo.checkinDate
        ? vo.checkinDate.substring(0, 10)
        : '';
      document.querySelector('#checkoutDate').value = vo.checkoutDate
        ? vo.checkoutDate.substring(0, 10)
        : '';
    })
    .catch((err) => {
      console.error('객실 조회 오류:', err);
      alert('객실 정보를 불러오는 데 실패했습니다.');
    });
}

selectOne();

function update() {
  const roomId = document.querySelector('#roomId').value;
  const roomNumber = document.querySelector('#roomNumber').value;
  const roomType = document.querySelector('#roomType').value;
  const status = document.querySelector('#status').value;
  const reserverName = document.querySelector('#reserverName').value;
  const checkinDate = document.querySelector('#checkinDate').value;
  const checkoutDate = document.querySelector('#checkoutDate').value;

  const vo = {
    roomId,
    roomNumber,
    roomType,
    status,
    reserverName,
    checkinDate,
    checkoutDate,
  };

  const url = `http://127.0.0.1:8080/api/room`;
  const option = {
    method: 'PUT',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(vo),
  };
  fetch(url, option)
    .then((resp) => resp.json())
    .then((data) => {
      alert('객실 예약이 변경되었습니다.');
      location.href = 'index.html';
    })
    .catch((err) => {
      console.log(err);
    });
}

function remove() {
  const roomId = document.querySelector('#roomId').value;
  const url = `http://127.0.0.1:8080/api/room/${roomId}`;
  const option = {
    method: 'DELETE',
  };
  fetch(url, option)
    .then((resp) => resp.json())
    .then((data) => {
      alert('객실이 삭제되었습니다.');
      location.href = 'index.html';
    })
    .catch((err) => {
      console.log(err);
    });
}

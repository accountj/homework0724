function selectList() {
  const url = 'http://127.0.0.1:8080/api/room';
  fetch(url)
    .then((resp) => resp.json())
    .then((voList) => {
      const tbody = document.querySelector('#room-body');
      let arr = '';
      for (const vo of voList) {
        let reserverName = vo.reserverName;
        let checkinDate = vo.checkinDate
          ? vo.checkinDate.substring(0, 10)
          : '-';
        let checkoutDate = vo.checkoutDate
          ? vo.checkoutDate.substring(0, 10)
          : '-';

        if (vo.reserverName == null) {
          reserverName = '-';
        }
        arr += `
            <tr onclick="location.href='detail.html?roomId=${vo.roomId}'">
            <td>${vo.roomId}</td>
            <td>${vo.roomNumber}</td>
            <td>${vo.roomType}</td>
            <td>${vo.status}</td>
            <td>${reserverName}</td>
            <td>${checkinDate}</td>
            <td>${checkoutDate}</td>
            </tr>`;
      }

      tbody.innerHTML = arr;
    })
    .catch((err) => {
      console.log(err);
    });
}

selectList();

function insert() {
  const roomNumber = document.querySelector('input[name="roomNumber"]').value;
  const roomType = document.querySelector('select[name="roomType"]').value;
  const status = document.querySelector('select[name="status"]').value;

  // 객체로 묶기
  const vo = {
    roomNumber,
    roomType,
    status,
  };

  const url = `http://127.0.0.1:8080/api/room`;
  const option = {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(vo),
  };
  fetch(url, option)
    .then((resp) => resp.text())
    .then((data) => {
      alert('객실이 등록되었습니다.');
      location.reload();
    })
    .catch((err) => {
      console.log(err);
    });
}

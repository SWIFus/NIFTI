import React, { useState } from 'react'
import './App.css';
import NIFTILogo from './images/NIFTISmallLogo.png';
import { QRCodeSVG } from 'qrcode.react';
import './App.css';

function App() {
  const [visible, setVisible] = useState(false);

  return (
  <div className='qrcode-container'>
      <div className='qrcode'>
          {visible && <QRCodeSVG
          value={"https://playvalorant.com/ko-kr/"}
          size={180}
          bgColor={"#ffffff"}
          fgColor={"#0090ff"}
          level={"L"}
          includeMargin={false}
          imageSettings={{
            src: NIFTILogo,
            x: undefined,
            y: undefined,
            height: 40,
            width: 40,
            excavate: true,
          }}
          />
          }
      </div>
      <button className='qr-button' onClick={() => {
          setVisible(!visible); 
      }} color='#0091ff'>
          {visible ? 'Check QRCode' : 'generate'}
      </button>
  </div>
  );
}

export default App;

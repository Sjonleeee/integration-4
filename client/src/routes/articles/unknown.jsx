export default function Unknown() {
  return (
    <div className="collection-detail unknown">
      <div className="desktop-hidden collection-detail__mobile-nav">
        <a href="../last-collection">
          <div className="arrow-button-black-hor">
            <img src="../src/assets/img/arrow_left.svg" alt=" arrow" />
          </div>
        </a>
        <div className="detail__nav-title">
          <p>THE UNKNOWN</p>
          <p>by Flava Flaviuq</p>
        </div>
      </div>
      <div className="collection-detail__noscroll">
        <a href="../last-collection" className="mobile-hidden">
          <div className="arrow-button-black-hor">
            <img src="../src/assets/img/arrow_left.svg" alt=" arrow" />
          </div>
        </a>
        <div className="mobile-hidden noscroll-title">
          <h1>THE UNKNOWN</h1>
          <p>by Flava Flaviuq</p>
        </div>
        <img src="../src/assets/img/unknown.png" alt="foto van tshirt" />
        <a href="../workshops">
          <div className="button-primary">
            Get your very own
            <svg
              width="41"
              height="15"
              viewBox="0 0 41 15"
              fill="none"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                d="M1 6.5C0.447715 6.5 0 6.94772 0 7.5C0 8.05228 0.447715 8.5 1 8.5V6.5ZM40.2071 8.20711C40.5976 7.81658 40.5976 7.18342 40.2071 6.79289L33.8431 0.428932C33.4526 0.0384078 32.8195 0.0384078 32.4289 0.428932C32.0384 0.819457 32.0384 1.45262 32.4289 1.84315L38.0858 7.5L32.4289 13.1569C32.0384 13.5474 32.0384 14.1805 32.4289 14.5711C32.8195 14.9616 33.4526 14.9616 33.8431 14.5711L40.2071 8.20711ZM1 8.5H39.5V6.5H1V8.5Z"
                fill="#101010"
              />
            </svg>
          </div>
        </a>
      </div>
      <div className="collection-detail__scroll">
        <img src="" alt="person" />
        <div className="scroll-name">
          <p>Warre Warrior, 21</p>
          <a href="">Insta logo</a>
        </div>
        <p>Bunch of text</p>
        <img src="" alt="bijpassende img" />
        <p className="white-text">More text</p>
        <p>More text</p>
        <p>More text</p>
        <p className="scroll-design">The Design</p>
        <div className="scroll-design__step">
          <img src="" alt="" />
          <p></p>
        </div>
        <div className="scroll-design__step">
          <img src="" alt="" />
          <p></p>
        </div>
        <div className="scroll-design__step">
          <img src="" alt="" />
          <p></p>
        </div>
        <div className="scroll-design__step">
          <img src="" alt="" />
          <p></p>
        </div>
        <div className="scroll-design__step">
          <img src="" alt="" />
          <p></p>
        </div>
      </div>
    </div>
  );
}

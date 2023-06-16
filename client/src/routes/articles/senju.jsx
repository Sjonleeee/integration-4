export default function Biniru() {
  return (
    <div className="collection-detail biniru">
      <div className="desktop-hidden collection-detail__mobile-nav">
        <a href="../last-collection">
          <div className="arrow-button-black-hor">
            <img src="../src/assets/img/arrow_left.svg" alt=" arrow" />
          </div>
        </a>
        <div className="detail__nav-title">
          <p>Senju</p>
          <p>by Senju Cyphercat</p>
        </div>
      </div>
      <div className="collection-detail__noscroll">
        <a href="../last-collection" className="mobile-hidden">
          <div className="arrow-button-black-hor">
            <img src="../src/assets/img/arrow_left.svg" alt="arrow" />
          </div>
        </a>
        <div className="mobile-hidden noscroll-title">
          <h1>Senju</h1>
          <p>by Senju Cyphercat</p>
        </div>
        <img src="../src/assets/img/senju.png" alt="foto van tshirt" />
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
        <img src="../src/assets/img/senju-story-two.png" alt="person" />
        <div className="scroll-name">
          <p>Senju Cyphercat, 23</p>
          <a target="_blank" href="">
            <img
              className="insta-logo"
              src="../src/assets/img/instagram.svg"
              alt="instagram logo"
            />
          </a>
        </div>
        <p>
          I'm an international student, so my view of Kortrijk might be
          different from the locals.
          <br />
          <br />
          What I find really cool is that Kortrijk has awesome parties like the
          ones at Bolwerk Funky Fridays, where they have DJ sets by Ubunto, and
          they also have breakdance jams and sessions.
        </p>
        <img
          src="../src/assets/img/senju-story-one.png"
          alt="bijpassende img"
        />
        <p className="white-text">
          I feel in Kortrijk, evenings are usually calm and offer a chance to
          rest. While it's nice to have occasional events, I sometimes wish
          there were more lively happenings.  I enjoy the breakdance scene and
          appreciate the city's small size, which makes it easy to get around
          quickly.
        </p>
        <p className="scroll-design">The Design</p>
        <div className="scroll-design__step">
          <img src="../src/assets/img/senju-story-three.png" alt="" />
          <p>
            Japanese letters stance for Unity because I feel a good unity in the
            break culture of Kortrijk. It's really nice to have people around
            with a same vision and want to express themselves through dance.
            Fingerprint stance for letting a print behind in breakscene so that
            we can inspire the new generation.
          </p>
        </div>
        <div className="scroll-design__step">
          <img src="../src/assets/img/senju-story-four.png" alt="" />
          <p>
            I want to make my mark and leave a fingerprint that inspires the new
            generation and people around me.
          </p>
        </div>
        <div className="scroll-design__step">
          <img src="../src/assets/img/senju-story-five.png" alt="" />
          <p>
            The two abstract pictures actually pictures of me breaking in
            Kortrijk and it’s creatively represented through abstract shapes.
          </p>
        </div>
        <div className="scroll-design__step">
          <img src="../src/assets/img/senju-story-six.png" alt="" />
          <p>
            The global represent me as an International student in Kortrijk
            City.
          </p>
        </div>
        <div className="scroll-design__step">
          <img src="../src/assets/img/senju-story-seven.png" alt="" />
          <p>
            This represents the leieboorden. In general, Kortrijk is a calm
            place in the evenings, offering a peaceful environment where you can
            relax and enjoy some quality time for yourself.
          </p>
        </div>
        <div className="scroll-design__step">
          <img
            className="funky"
            src="../src/assets/img/senju-story-eight.png"
            alt=""
          />
          <p>
            I feel like Kortrijk has hidden gems partys, so like a place called
            Bolwerk they organise funky fridays and other events. You have to
            search for the good stuff!
          </p>
        </div>
      </div>
      <style>
        {`
        .footer {
          display: none;
        }`}
      </style>
    </div>
  );
}

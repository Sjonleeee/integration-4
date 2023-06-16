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
        <img src="../src/assets/img/flava-story-one.png" alt="person" />
        <div className="scroll-name">
          <p>Flava Flaviuq, 20</p>
          <a target="_blank" href="">
            <img
              className="insta-logo"
              src="../src/assets/img/instagram.svg"
              alt="instagram logo"
            />
          </a>
        </div>
        <p>
          The way I see the culture of Kortrijk is a little bit of everything.
          I've gotten to experience lots of things that I haven't encountered
          before like the Paas foor and Sinksen.{" "}
        </p>
        <img
          src="../src/assets/img/flava-story-two.png"
          alt="bijpassende img"
        />
        <p className="white-text">
          Kortrijk seems to always find ways to maintain the community engaged
          and not bored of the daily life. There's always something to do in
          Kortrijk, even if at first look it doesn't seem like it.{" "}
        </p>
        <p>
          I will say, the only think the culture of Kortrijk is missing is more
          engagement with the international community and accessibility for the
          youths such as access to events that are not insanely overpriced and
          spaces where students can express themselves ( like De Stroate, Ajko,
          etc)
        </p>
        <p className="scroll-design">The Design</p>
        <div className="white-text scroll-design__step">
          <img src="../src/assets/img/flava-story-three.png" alt="picture" />
          <p>
            In my design I really wanted to emphesize the hidden spots of
            Kortrijk. The picture in the magnifying glass is of a urban place
            called Bolwerk.
          </p>
        </div>
        <div className="scroll-design__step">
          <img src="../src/assets/img/flava-story-four.png" alt="picture" />
          <p>
            The chinese letters symbolize the different cultures in Kortrijk.
            I’m from Romenia myself, so the international community really
            speaks to me.
          </p>
        </div>
        <div className="scroll-design__step">
          <img src="../src/assets/img/flava-story-five.png" alt="picture" />
          <p>
            The globe represents the opportunity for Kortrijk to leave a real
            impact on the world, more specifically Europe.
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

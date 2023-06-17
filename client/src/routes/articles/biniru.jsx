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
          <p>Biniru</p>
          <p>by Warre Warrior</p>
        </div>
      </div>
      <div className="collection-detail__noscroll">
        <a href="../last-collection" className="mobile-hidden">
          <div className="arrow-button-black-hor">
            <img src="../src/assets/img/arrow_left.svg" alt=" arrow" />
          </div>
        </a>
        <div className="mobile-hidden noscroll-title">
          <h1>Biniru</h1>
          <p>by Warre Warrior</p>
        </div>
        <img src="../src/assets/img/biniru.png" alt="foto van tshirt" />
        <a target="_blank" href="https://kltrx.myshopify.com/products/biniru">
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
        <img src="../src/assets/img/warre-story-one.png" alt="person" />
        <div className="scroll-name">
          <p>Warre Warrior, 21</p>
          <a
            target="_blank"
            href="https://instagram.com/warrewarrior?igshid=MzRlODBiNWFlZA=="
          >
            <img
              className="insta-logo"
              src="../src/assets/img/instagram.svg"
              alt="instagram logo"
            />
          </a>
        </div>
        <p>
          I believe the (urban) culture in Kortrijk has genuinely improved in
          recent years, with expanded offerings for young people. The renovation
          of Luxaplast skatepark is a fantastic addition, and I feel that urban
          culture is experiencing a revival among the youth. Places like De
          Stroate play a crucial and positive role in this transformation.
        </p>
        <img
          src="../src/assets/img/warre-story-two.png"
          alt="bijpassende img"
        />
        <p className="white-text">
          However, from a critical standpoint (not suitable for a t-shirt), it
          would be beneficial to have more involvement in certain projects. For
          example, the continuous repainting of graffiti on the non-concrete
          parts and barriers at Luxaplast seems counterproductive.{" "}
        </p>
        <p>
          It would be cool if the city embraced and preserved this art form
          instead of erasing it repeatedly. Moreover, although there were
          promises of additional skatepark expansions, it's unlikely that they
          will materialize. The participation and communication with the youth
          could be improved in some places and projects.
        </p>
        <p>
          In summary, Kortrijk's culture has shown genuine improvement, with an
          expanded focus on the urban scene and increased opportunities for
          young people. The renovation of Luxaplast skatepark and the presence
          of places like De Stroate are instrumental in this positive shift.
          However, it is important to address concerns such as better
          involvement in decision-making processes, preserving graffiti art, and
          improving youth participation and communication.
        </p>
        <p className="scroll-design">The Design</p>
        <div className="scroll-design__step">
          <img src="../src/assets/img/warre-story-three.png" alt="" />
          <p>
            I’ve always been a big skateboarding fan. This is one of the most
            important things for me in this city. I’ve connected with a lot of
            my best friends through skating.
          </p>
        </div>
        <div className="scroll-design__step">
          <img src="../src/assets/img/warre-story-four.png" alt="" />
          <p>
            I feel like I also do my part for the urban culture, I am vinyl DJ
            and perform often on the events of the urban culture.
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

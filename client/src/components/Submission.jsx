import { Link } from "react-router-dom";

const Submission = ({
  title,
  story,
  designAuthor,
  designLinks,
  datecreated,
  id,
}) => {
  return (
    <>
      <div className="submission__img">
        <img src={designLinks} alt="design" width={600} />
      </div>
      <div className="submission__text">
        <Link to={`/submissions/${id}`}>
          <h2 className="submission__title">
            {title} <img src="../src/assets/img/arrow.svg" alt="" />
          </h2>
        </Link>
        <p>submitted by {designAuthor}</p>
        <p className="submission__story"> {story}</p>
        <p>{datecreated}</p>
      </div>
    </>
  );
};

export default Submission;

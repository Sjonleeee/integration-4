const Submission = ({ title, story, designAuthor, designLinks }) => {
  const design = JSON.parse(designLinks);
  console.log(design);
  return (
    <>
      <div className="submission__img">
        <img src={design} alt="design" width={600} />
      </div>
      <div className="submission__text">
        <h2 className="submission__title">{title}</h2>
        <p className="submission__invisible"> {story}</p>
        <p>submitted by {designAuthor}</p>
        <p>22/06/2023</p>
      </div>
    </>
  );
};

export default Submission;

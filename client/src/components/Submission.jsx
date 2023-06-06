/* eslint-disable react/prop-types */
const Submission = ({ title, story, designAuthor, designLinks }) => {
  return (
    <>
      <div>
        <h2>{title}</h2>
        <p>{story}</p>
        <p>{designAuthor}</p>
        <img src={designLinks} alt="design" width={100} />
      </div>
    </>
  );
};

export default Submission;

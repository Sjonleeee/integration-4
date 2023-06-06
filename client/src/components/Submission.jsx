/* eslint-disable react/prop-types */
const Submission = ({ title, story, designAuthor, designLinks }) => {
  const design = JSON.parse(designLinks);
  console.log(design);
  return (
    <>
      <div>
        <h2>{title}</h2>
        <p>{story}</p>
        <p>{designAuthor}</p>
        <img src={design} alt="design" width={100} />
      </div>
    </>
  );
};

export default Submission;

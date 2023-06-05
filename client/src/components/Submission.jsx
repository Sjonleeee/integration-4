/* eslint-disable react/prop-types */
const Submission = ({ title, story, designAuthor, designLinks }) => {
  const designLinksJSON = JSON.parse(designLinks);
  console.log(designLinksJSON);

  return (
    <>
      <div>
        <h2>{title}</h2>
        <p>{story}</p>
        <p>{designAuthor}</p>
        {designLinksJSON.map((link) => (
          <img src={link.preview} alt="design" />
        ))}
      </div>
    </>
  );
};

export default Submission;

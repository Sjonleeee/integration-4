import { Form, useNavigate } from "react-router-dom";
import React, { useCallback, useState } from "react";
import { useDropzone } from "react-dropzone";
import { getImage, submitDesign, uploadImage } from "../js/designs";

let imageData = {
  fileData: "",
  filename: "",
};

// // Action
export const action = async ({ request }) => {
  console.log("Submit action");
  const formData = await request.formData();
  const updates = Object.fromEntries(formData);
  console.log(imageData);
  const image = await uploadImage(imageData);
  const imageInfo = await getImage();
  console.log(imageInfo);
  const imageUrl = imageInfo.url;
  const result = await submitDesign(updates, imageUrl);
  console.log(result);
  return result;
};

export default function SubmitPage() {
  // const [files, setFiles] = useState([]);
  const navigate = useNavigate();
  const [imageJSON, setImageJSON] = useState();
  const [step, setStep] = useState(0);
  // console.log(imageJSON);

  const FormValidation = () => {};

  const imageInfo = imageJSON;
  imageData.fileData = imageInfo;

  // const handleSubmit = async () => {
  //   await submitDesign();
  //   navigate("/submissions");
  // };

  const handleImageChange = (e) => {
    const file = e.target.files[0];
    const reader = new FileReader();
    reader.onload = (event) => {
      const base64image = event.target.result;
      const image = new Image();
      image.onload = () => {
        const canvas = document.createElement("canvas");
        canvas.width = image.width;
        canvas.height = image.height;
        const context = canvas.getContext("2d");
        context.drawImage(image, 0, 0);
        const image64 = canvas.toDataURL("image/png");
        setImageJSON(image64);
      };

      image.src = base64image;
    };
    reader.readAsDataURL(file);
  };

  // const onDrop = useCallback((acceptedFiles) => {
  //   setFiles(() => [
  //     ...acceptedFiles.map((file) =>
  //       Object.assign(file, {
  //         preview: URL.createObjectURL(file),
  //       })
  //     ),
  //   ]);
  //   handleImageChange(acceptedFiles);
  // });

  // const { getRootProps, getInputProps, isDragActive } = useDropzone({ onDrop });

  return (
    <section className="submit">
      <div className="submit-design">
        <h1 className="hidden">Design submission</h1>
        <p className="mobile-hidden green-text">Now you</p>
        <img
          className="submit-image"
          src="../src/assets/img/submitpage.jpg"
          alt="submit"
        />
        <img
          className="submit-svg desktop-hidden"
          src="../src/assets/img/submit.svg"
          alt="map icon"
        />
        <img
          className="submit-add desktop-hidden"
          src="../src/assets/img/add-button.svg"
          onClick={() => {
            setStep(1);
          }}
          alt=""
        />
        <img
          className="mobile-hidden"
          src="../src/assets/img/submit-now.svg"
          alt="world"
        />
        <style>
          {`
          .submit{
            transform: translateX(${step * -100}vw);
            transition: ease-in-out 0.5s all;
          }
        `}
        </style>
        <p className="submit-cta desktop-hidden">
          Add a JPG of your design here
        </p>
        <p className="submit-text">
          Submit your design and share your unique perspective on Kortrijk's
          culture. Let your creativity take flight, for this is where your
          vision becomes part of the fabric that weaves our city's story.{" "}
        </p>
      </div>
      <div className="submit-drop">
        <h2 className="mobile-hidden">Drag and drop your design underneath</h2>
        <p>Pssst, upload your front and back design in JPG</p>

        <Form method="post">
          <input
            type="file"
            accept="image/jpg"
            name="design"
            onChange={(e) => {
              handleImageChange(e);
            }}
          />
          <label htmlFor="designAuthor">Your name</label>
          <input type="text" name="designAuthor" id="designAuthor" />
          <label htmlFor="email">E-mail</label>
          <input type="email" name="email" id="email" />
          <label htmlFor="title">Title</label>
          <input type="text" name="title" id="title" />
          <label htmlFor="story">Story</label>
          <textarea name="story" id="story" cols="30" rows="10"></textarea>
          <button className="button-primary" type="submit">
            Submit your design
          </button>
        </Form>
      </div>
    </section>
  );
}

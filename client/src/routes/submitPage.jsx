import { Form, useNavigate } from "react-router-dom";
import React, { useState } from "react";
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
  console.log(formData);
  const image = await uploadImage(imageData);
  const imageInfo = await getImage();
  console.log(imageInfo);
  const imageUrl = imageInfo.url;
  const result = await submitDesign(updates, imageUrl);
  console.log(result);
  if (result) {
    window.location.href = "/submissions";
  }
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
          src="../../assets/img/submitpage.jpg"
          alt="submit"
        />
        <img
          className="submit-svg desktop-hidden"
          src="../../assets/img/submit.svg"
          alt="map icon"
        />
        <img
          className="submit-add desktop-hidden"
          src="../../assets/img/add-button.svg"
          onClick={() => {
            setStep(1);
          }}
          alt=""
        />
        <img
          className="mobile-hidden"
          src="../../assets/img/submit-now.svg"
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
            required
            onChange={(e) => {
              handleImageChange(e);
              console.log(e.target);
              if (e.target.value.length < 0) {
                e.target.style.border = "1px solid red";
                e.target.nextElementSibling.style.color = "red";
                e.target.nextElementSibling.innerHTML = "Choose your design";
              } else {
                e.target.style.border.block = "1px solid var(--color-black)";
                e.target.nextElementSibling.style.color = "var(--color-black)";
                e.target.nextElementSibling.innerHTML = "";
              }
            }}
          />
          <label htmlFor="designAuthor">Your name</label>
          <input
            type="text"
            name="designAuthor"
            id="designAuthor"
            required
            onChange={(e) => {
              console.log(e.target);
              if (e.target.value.length < 1) {
                e.target.style.border = "1px solid red";
                e.target.nextElementSibling.style.color = "red";
                e.target.nextElementSibling.innerHTML = "Fill in your name";
              } else {
                e.target.style.border = "1px solid var(--color-black)";
                e.target.nextElementSibling.style.color = "var(--color-black)";
                e.target.nextElementSibling.innerHTML = "";
              }
            }}
          />
          <p></p>
          <label htmlFor="email">Your e-mail</label>
          <input
            type="email"
            name="email"
            id="email"
            required
            onChange={(e) => {
              console.log(e.target);
              if (e.target.value.length < 4 || !e.target.value.includes("@")) {
                e.target.style.border = "1px solid red";
                e.target.nextElementSibling.style.color = "red";
                e.target.nextElementSibling.innerHTML =
                  "Fill in a valid email address";
              } else {
                e.target.style.border = "1px solid var(--color-black)";
                e.target.nextElementSibling.style.color = "var(--color-black)";
                e.target.nextElementSibling.innerHTML = "";
              }
            }}
          />
          <p></p>
          <label htmlFor="title">Title of your design</label>
          <input
            type="text"
            name="title"
            id="title"
            required
            onChange={(e) => {
              console.log(e.target);
              if (e.target.value.length === 0) {
                e.target.style.border = "1px solid red";
                e.target.nextElementSibling.style.color = "red";
                e.target.nextElementSibling.innerHTML =
                  "Give your design a title";
              } else {
                e.target.style.border = "1px solid var(--color-black)";
                e.target.nextElementSibling.style.color = "var(--color-black)";
                e.target.nextElementSibling.innerHTML = "";
              }
            }}
          />
          <p></p>
          <label htmlFor="story">Your story</label>
          <textarea
            name="story"
            id="story"
            cols="30"
            rows="10"
            required
            minLength={150}
            placeholder=""
            onChange={(e) => {
              console.log(e.target);
              if (e.target.value.length < 150) {
                e.target.style.border = "1px solid red";
                e.target.nextElementSibling.style.color = "red";
                e.target.nextElementSibling.innerHTML =
                  "Write at least 150 characters";
              } else {
                e.target.style.border = "1px solid var(--color-black)";
                e.target.nextElementSibling.style.color = "var(--color-black)";
                e.target.nextElementSibling.innerHTML = "";
              }
            }}
          ></textarea>
          <p></p>
          <button className="button-primary" type="submit">
            Submit your design
          </button>
        </Form>
      </div>
      <style>
        {`
        .submit {
          height: ${step === 1 ? "53rem" : "45rem"};
        }
        `}
      </style>
    </section>
  );
}

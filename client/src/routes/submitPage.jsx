import { Form, useNavigate } from 'react-router-dom'
import React, { useCallback, useState } from 'react'
import { useDropzone } from 'react-dropzone'
import { submitDesign } from '../js/designs'

let imageData

// // Action
export const action = async ({ request }) => {
  console.log('Submit action')
  const formData = await request.formData()
  const updates = Object.fromEntries(formData)
  // console.log(imageData)
  const result = await submitDesign(updates, imageData)
  // console.log(result)
  return result
}

export default function SubmitPage() {
  // const [files, setFiles] = useState([]);
  const [imageJSON, setImageJSON] = useState()
  console.log(imageJSON)

  const imageInfo = imageJSON

  imageData = JSON.stringify(imageInfo)

  const handleSubmit = async () => {
    await submitDesign()
    navigate('/submissions')
  }

  const handleImageChange = (e) => {
    const file = e.target.files[0]
    const reader = new FileReader()
    reader.onload = (event) => {
      const base64image = event.target.result
      const image = new Image()
      image.onload = () => {
        const canvas = document.createElement('canvas')
        canvas.width = image.width
        canvas.height = image.height
        const context = canvas.getContext('2d')
        context.drawImage(image, 0, 0)
        const image64 = canvas.toDataURL('image')
        setImageJSON(image64)

        // const imageData = context.getImageData(
        //   0,
        //   0,
        //   canvas.width,
        //   canvas.height
        // );

        // console.log(imageData);
        // const imageDataArray = Array.from(imageData.data);
        // setImageJSON(imageDataArray);
      }

      image.src = base64image
    }
    reader.readAsDataURL(file)
  }

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
    <section className="submission">
      <div className="submission-design">
        <h1 className="hidden">Design submission</h1>
        <p>Now you</p>
        {/* SVG */}
        <p>
          Submit your design and share your unique perspective on Kortrijk's
          culture. Let your creativity take flight, for this is where your
          vision becomes part of the fabric that weaves our city's story.{' '}
        </p>
      </div>
      <div className="submission-drop">
        <h2>Drag and drop your design underneath</h2>
        <p>Pssst, upload your front and back design in JPG</p>

        <Form method="post" onSubmit={handleSubmit}>
          <input
            type="file"
            accept="image/jpg"
            onChange={(e) => {
              handleImageChange(e)
              // if (e.target.files  length > 1048576) {
              //   alert("File is too big!");
              //   e.target.value = "";
              // }

              // (e) => {
              // const file = e.target.files[0];
              // const reader = new FileReader();
              // reader.onload = (event) => {
              //   const base64image = event.target.result;
              //   const image = new Image();
              //   image.onload = () => {
              //     const canvas = document.createElement("canvas");
              //     canvas.width = image.width;
              //     canvas.height = image.height;
              //     const context = canvas.getContext("2d");
              //     context.drawImage(image, 0, 0);
              //     const image64 = canvas.toDataURL("image");
              //     setImageJSON(image64);
              //   };

              //   image.src = base64image;
              // };
              // reader.readAsDataURL(file);
            }}
          />
          <label htmlFor="designAuthor">Your name</label>
          <input type="text" name="designAuthor" id="designAuthor" />
          <label htmlFor="title">Title</label>
          <input type="text" name="title" id="title" />
          {/* <label htmlFor="email">E-mail</label>
          <input type="email" name="email" id="email" /> */}
          <label htmlFor="story">Story</label>
          <textarea name="story" id="story" cols="30" rows="10"></textarea>
          <button type="submit">Submit your design</button>
        </Form>
      </div>
    </section>
  )
}

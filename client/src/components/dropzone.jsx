import { useCallback, useState } from "react";
import { useDropzone } from "react-dropzone";

export default function Dropzone() {
  const [files, setFiles] = useState([]);

  const onDrop = useCallback((acceptedFiles) => {
    setFiles((previousFiles) => [
      ...previousFiles,
      ...acceptedFiles.map((file) =>
        Object.assign(file, {
          preview: URL.createObjectURL(file),
        })
      ),
    ]);
  }, []);

  const { getRootProps, getInputProps, isDragActive } = useDropzone({ onDrop });

  console.log(files);
  return (
    <>
      <div {...getRootProps()}>
        <input name="file" {...getInputProps()} />
        {isDragActive ? (
          <p>Drop the files here ...</p>
        ) : (
          <p>Drag 'n' drop some files here, or click to select files</p>
        )}
      </div>

      <ul>
        {files.map((file) => (
          <>
            <li key={file.id}>{file.name}</li>
            <img src={file.preview} alt="preview" width={100} />
          </>
        ))}
      </ul>
    </>
  );
}

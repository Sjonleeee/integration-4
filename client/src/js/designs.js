import { graphQLRequest } from "./utils/graphql";

export const getSubmissions = async () => {
  const { data } = await graphQLRequest(
    `query MyQuery {
  designsEntries {
    ... on designs_default_Entry {
      id
      title
      story
      tshirtUrl
      designAuthor
      likeAmount
      dateCreated
    }
  }
}
    `
  );
  console.log(data.designsEntries);
  return data.designsEntries;
};

export const getSubmission = async (id) => {
  const { data } = await graphQLRequest(
    `query MyQuery {
  designsEntries(id: "${id}") {
    ... on designs_default_Entry {
      id
      title
      story
      tshirtUrl
      designAuthor
      likeAmount
      dateCreated
    }
  }
}
    `
  );
  console.log(data.designsEntries);
  return data.designsEntries;
};

export const uploadImage = async (file) => {
  console.log(file);
  const { data } = await graphQLRequest(
    `
mutation SaveImage($document: FileInput, $title: String) {
    save_designUploads_Asset(_file: $document, title: $title) {
      id
      filename
      title
    }
  }
`,
    { document: file, title: file.filename }
  );
  console.log(data);
  return data.save_designs_default_Entry;
};

export const getImage = async () => {
  const { data } = await graphQLRequest(
    `query MyQuery {
  assets(limit: 1) {
    ... on designUploads_Asset {
      id
      filename
      title
      url
    }
  }
}

    `
  );
  console.log(data.assets);
  return data.assets[0];
};

export const submitDesign = async (updates, document) => {
  const { data } = await graphQLRequest(
    `
mutation SaveEntry($title: String, $story: String, $designAuthor: String, $document: String) {
      save_designs_default_Entry(
        authorId: "1"
        slug: "-"
        designAuthor: $designAuthor
        title: $title
        story: $story
        tshirtUrl: $document
      ) {
        id
        designAuthor
        title
        story 
        tshirtUrl 
      }
    }

`,
    { document: document, ...updates }
  );
  console.log(data);
  return data.save_designs_default_Entry;
};

export const addLike = async (id, likeAmount) => {
  const { data } = await graphQLRequest(
    `
       mutation MyMutation($likeAmount: Number) {
  save_designs_default_Entry(id: "${id}", likeAmount: $likeAmount) {
    ... on designs_default_Entry {
      likeAmount
    }
  }
}
    `,
    { likeAmount: likeAmount }
  );
  console.log(data);
  return data.likeDesign;
};

export const submitRequest = async (updates) => {
  const { data } = await graphQLRequest(
    `
    mutation MyMutation($title: String, $companyMail: String, $companyTelephone: String, $companyAdres: String, $companyPostcode: String, $companyCountry: String, $requestAmount: String, $requestDate: String, $requestDuration: String) {
  save_workshopRequests_default_Entry(
    authorId:"1"
    slug:"-"
    companyAdres: $companyAdres
    companyCountry: $companyCountry
    companyMail: $companyMail
    title: $title
    companyPostcode: $companyPostcode
    companyTelephone: $companyTelephone
    requestAmount: $requestAmount
    requestDate: $requestDate
    requestDuration: $requestDuration
  ) {
    id
    title
    companyAdres
    companyCountry
    companyMail
    companyPostcode
    companyTelephone
    requestAmount
    requestDate
    requestDuration
  }
}
`,
    { ...updates }
  );
  console.log(data);
  return data.save_workshopRequests_default_Entry;
};

export const getWorkshops = async () => {
  const { data } = await graphQLRequest(
    `query MyQuery {
  workshopsEntries {
    ... on workshops_default_Entry {
      id
      workshopAttendees
      workshopDate
      workshopInfo
      workshopPlace
      title
    }
  }
}

    `
  );
  console.log(data);
  return data.workshopsEntries;
};

export const joinWorkshop = async (id, workshopAttendees) => {
  const { data } = await graphQLRequest(
    `
       mutation MyMutation($workshopAttendees: Number) {
  save_workshops_default_Entry(id: "${id}", workshopAttendees: $workshopAttendees) {
    ... on workshops_default_Entry {
      workshopAttendees
    }
  }
}
    `,
    { workshopAttendees: workshopAttendees }
  );
  console.log(data);
  return data;
};

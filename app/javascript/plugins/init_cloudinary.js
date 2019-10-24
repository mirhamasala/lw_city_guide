import cloudinary from "cloudinary-core";

const initCloudinary = () => {
  const cl = cloudinary.Cloudinary.new({cloud_name: "mirhamasala"});
  cl.responsive();
}

export { initCloudinary };

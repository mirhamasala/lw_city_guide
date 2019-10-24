import cloudinary from "cloudinary-core";

const initCloudinary = () => {
  const cl = cloudinary.Cloudinary.new({cloud_name: process.env.CLOUDINARY_CLOUD_NAME });
  cl.responsive();
}

export { initCloudinary };

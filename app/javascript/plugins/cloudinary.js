import cloudinary from "cloudinary-core";

class Cloudinary {
  constructor() {
    const cl = cloudinary.Cloudinary.new({
      cloud_name: process.env.CLOUDINARY_CLOUD_NAME,
    });
    cl.responsive();
  }
}

export default Cloudinary;

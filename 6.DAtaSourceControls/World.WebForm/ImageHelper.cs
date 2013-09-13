using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Reflection;

namespace World.WebForm
{
    public static class ImageHelper
    {
        public static byte[] ResizeImage(int width, int height, byte[] image)
        {
            var originalImage = new Bitmap(new MemoryStream(image));
            var resiazedImage = new Bitmap(originalImage, width, height);
            
            var stream = new MemoryStream();
            resiazedImage.Save(stream, ImageFormat.Png);
            return stream.GetBuffer();
        }
    }
}
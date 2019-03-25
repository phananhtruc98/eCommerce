using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using sd = System.Drawing;
using System.Drawing.Imaging;
using System.Drawing.Drawing2D;
using System.Drawing;
using System.Web.UI.HtmlControls;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Utilities
{
    public class FileHelper
    {
        public FileHelper() { }

        public string DeleteFile(string filePath)
        {
            string msg = "";
            try
            {
                if (File.Exists(filePath))
                    File.Delete(filePath);
                else
                    msg = "File không tồn tại.";
                return msg;
            }
            catch (Exception ex)
            {
                return msg + ex;
            }
        }
        public bool checkUploadImg(string fileName, float size)
        {
            bool bl;
            string fileExt = Path.GetExtension(fileName).ToLower();
            if (fileExt == ".gif" || fileExt == ".jpg" || fileExt == ".png" || fileExt == ".jpeg" || fileExt == ".bmp" && size <= 204800)
            {
                bl = true;
                return bl;
            }
            else
            {
                bl = false;
                return bl;
            }
        }

        //get Current Page Name
        /// <summary>
        /// Request.Url.AbsolutePath
        /// </summary>
        /// <param name="sPath"></param>
        /// <returns></returns>
        public string GetCurrentPageName(string sPath)
        {
            FileInfo oInfo = new FileInfo(sPath);
            string sRet = oInfo.Name;
            return sRet;
        }
        //EXPORT EXCEL FILE
        public void ExportGridView(string fileName, string filePath, DataGrid gv)
        {
            gv.EnableViewState = false;
            StringWriter tw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(tw);
            gv.RenderControl(hw);
            string htmlInfo = tw.ToString().Trim();

            string xlsFileName = fileName + ".xls";
            string filePathName = filePath + xlsFileName;
            if (File.Exists(filePathName))
                File.Delete(filePathName);
            FileStream Fs = new FileStream(filePathName, FileMode.Create);
            BinaryWriter BWriter = new BinaryWriter(Fs, Encoding.GetEncoding("UTF-8"));

            BWriter.Write(htmlInfo);
            BWriter.Close();
            Fs.Close();
        }
        //Resize the Width image
        public void ResizeImageWidth(string imgPath, string saveTo, int resizeWidth)//, int Width, int Height, int X, int Y)
        {
            try
            {
                using (sd.Image originalImage = sd.Image.FromFile(imgPath))
                {
                    int originalWidth = int.Parse(originalImage.Width.ToString());
                    int originalHeight = int.Parse(originalImage.Height.ToString());
                    /*
                     * chia theo tỉ lể tìm ra chiều cao mới
                     * int originalImage_W ----------->resizeWidth
                     * int originalImage_H -----------> ???New_Height
                     */
                    int newHeight = (originalHeight * resizeWidth) / originalWidth;
                    using (sd.Bitmap bmp = new sd.Bitmap(resizeWidth, newHeight))//(Width, Height))
                    {
                        bmp.SetResolution(originalImage.HorizontalResolution, originalImage.VerticalResolution);
                        using (sd.Graphics graphic = sd.Graphics.FromImage(bmp))
                        {
                            graphic.SmoothingMode = SmoothingMode.AntiAlias;
                            graphic.InterpolationMode = InterpolationMode.HighQualityBicubic;
                            graphic.PixelOffsetMode = PixelOffsetMode.HighQuality;
                            graphic.CompositingQuality = CompositingQuality.HighQuality;
                            graphic.DrawImage(originalImage, new sd.Rectangle(0, 0, resizeWidth, newHeight));//, X, Y, Width, Height, sd.GraphicsUnit.Pixel);
                            MemoryStream msBuffer = new MemoryStream();
                            bmp.Save(msBuffer, originalImage.RawFormat);
                            byte[] bufferImage = msBuffer.GetBuffer();
                            msBuffer.Dispose();
                            using (MemoryStream msWrite = new MemoryStream(bufferImage, 0, bufferImage.Length))
                            {
                                msWrite.Write(bufferImage, 0, bufferImage.Length);
                                using (sd.Image imageResized = sd.Image.FromStream(msWrite, true))
                                {
                                    //string saveTo = Server.MapPath("~/Images/imgCrop/") + "small" + ImageName;
                                    imageResized.Save(saveTo, imageResized.RawFormat);
                                }
                                msWrite.Dispose();
                            }
                            graphic.Dispose();
                        }
                        bmp.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        //Resize the Height image
        public void ResizeImageHeight(string imgPath, string saveTo, int resizeHeight)//, int Width, int Height, int X, int Y)
        {
            try
            {
                using (sd.Image originalImage = sd.Image.FromFile(imgPath))
                {

                    int originalWidth = int.Parse(originalImage.Width.ToString());
                    int originalHeight = int.Parse(originalImage.Height.ToString());
                    /*
                     * chia theo tỉ lể tìm ra chiều cao mới
                     * int originalImage_H -----------> resizeHeight
                     * int originalImage_W ----------->???NewWidth
                     
                     */
                    int newWidth = (originalWidth * resizeHeight) / originalHeight;
                    using (sd.Bitmap bmp = new sd.Bitmap(newWidth, resizeHeight))//(Width, Height))
                    {
                        bmp.SetResolution(originalImage.HorizontalResolution, originalImage.VerticalResolution);
                        using (sd.Graphics graphic = sd.Graphics.FromImage(bmp))
                        {
                            graphic.SmoothingMode = SmoothingMode.AntiAlias;
                            graphic.InterpolationMode = InterpolationMode.HighQualityBicubic;
                            graphic.PixelOffsetMode = PixelOffsetMode.HighQuality;
                            graphic.CompositingQuality = CompositingQuality.HighQuality;
                            graphic.DrawImage(originalImage, new sd.Rectangle(0, 0, newWidth, resizeHeight));//, X, Y, Width, Height, sd.GraphicsUnit.Pixel);
                            MemoryStream msBuffer = new MemoryStream();
                            bmp.Save(msBuffer, originalImage.RawFormat);
                            byte[] bufferImage = msBuffer.GetBuffer();
                            msBuffer.Dispose();
                            using (MemoryStream msWrite = new MemoryStream(bufferImage, 0, bufferImage.Length))
                            {
                                msWrite.Write(bufferImage, 0, bufferImage.Length);
                                using (sd.Image imageResized = sd.Image.FromStream(msWrite, true))
                                {
                                    //string saveTo = Server.MapPath("~/Images/imgCrop/") + "small" + ImageName;
                                    imageResized.Save(saveTo, imageResized.RawFormat);
                                }
                                msWrite.Dispose();
                            }
                            graphic.Dispose();
                        }
                        bmp.Dispose();
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        //Resize the Height and Width image
        public byte[] ResizeImageWidthHeight(string imgPath, int resizeWidth, int resizeHeight)//, int Width, int Height, int X, int Y)
        {
            try
            {
                using (sd.Image originalImage = sd.Image.FromFile(imgPath))
                {
                    //int h = int.Parse(originalImage.Height.ToString()) / resize;
                    //int w = int.Parse(originalImage.Width.ToString()) / resize;
                    using (sd.Bitmap bmp = new sd.Bitmap(resizeWidth, resizeHeight))//(Width, Height))
                    {
                        bmp.SetResolution(originalImage.HorizontalResolution, originalImage.VerticalResolution);
                        using (sd.Graphics graphic = sd.Graphics.FromImage(bmp))
                        {
                            graphic.SmoothingMode = SmoothingMode.AntiAlias;
                            graphic.InterpolationMode = InterpolationMode.HighQualityBicubic;
                            graphic.PixelOffsetMode = PixelOffsetMode.HighQuality;
                            graphic.DrawImage(originalImage, new sd.Rectangle(0, 0, resizeWidth, resizeHeight));//, X, Y, Width, Height, sd.GraphicsUnit.Pixel);
                            MemoryStream ms = new MemoryStream();
                            bmp.Save(ms, originalImage.RawFormat);
                            return ms.GetBuffer();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        //CAPCHA Drawing
        public Bitmap TransformImage(Bitmap bmp, Random rnd)
        {
            int width = bmp.Width;
            int height = bmp.Height;
            double distort = rnd.Next(5, 15) * (rnd.Next(10) == 1 ? 1 : -1);

            // Copy the image so that we're always using the original for source color
            using (Bitmap copy = (Bitmap)bmp.Clone())
            {
                for (int y = 0; y < height; y++)
                {
                    for (int x = 0; x < width; x++)
                    {
                        // Adds a simple wave
                        int newX = (int)(x + (distort * Math.Sin(Math.PI * y / 84.0)));
                        int newY = (int)(y + (distort * Math.Cos(Math.PI * x / 44.0)));
                        if (newX < 0 || newX >= width) newX = 0;
                        if (newY < 0 || newY >= height) newY = 0;
                        bmp.SetPixel(x, y, copy.GetPixel(newX, newY));
                    }
                }
            }

            return bmp;
        }

        public Brush GetBrush(Random rnd)
        {
            Brush brush = Brushes.Black;
            int ir = rnd.Next(9);
            switch (ir)
            {
                case 0:
                    brush = Brushes.DarkCyan;
                    break;
                case 1:
                    brush = Brushes.DarkGreen;
                    break;
                case 2:
                    brush = Brushes.Crimson;
                    break;
                case 3:
                    brush = Brushes.DarkViolet;
                    break;
                case 4:
                    brush = Brushes.DarkOliveGreen;
                    break;
                case 5:
                    brush = Brushes.DarkOrchid;
                    break;
                case 6:
                    brush = Brushes.DarkTurquoise;
                    break;
            }
            return brush;
        }

        public Font GetFont(Random rnd)
        {
            float sz = 15 + rnd.Next(4);
            Font f = new Font("Arial", sz);
            int i = rnd.Next(4);
            switch (i)
            {
                case 0: f = new Font("Tahoma", sz, FontStyle.Bold); break;
                case 1: f = new Font("Verdana", sz, FontStyle.Bold); break;
                case 2: f = new Font("Times New Roman", sz, FontStyle.Bold); break;
            }
            return f;
        }

        public void Drawing(Graphics gr, string s, PointF p, Random rnd)
        {
            float x = p.X;
            float y = p.Y;
            char[] c = s.ToCharArray();
            for (int i = 0; i < c.Length; i++)
            {
                string ch = c[i].ToString();
                Brush brush = GetBrush(rnd);
                Font font = GetFont(rnd);
                SizeF sf = gr.MeasureString(ch, font);
                gr.SmoothingMode = SmoothingMode.AntiAlias;
                gr.InterpolationMode = InterpolationMode.HighQualityBicubic;
                gr.PixelOffsetMode = PixelOffsetMode.HighQuality;
                gr.CompositingQuality = CompositingQuality.HighQuality;
                gr.DrawString(ch, font, brush, new PointF(x, y + (rnd.Next(7) - 3)));
                x = x + sf.Width / 2;
            }
        }

        public Pen GetPen(Random rnd)
        {
            Pen p = Pens.Black;
            int i = rnd.Next(4);
            switch (i)
            {
                case 0: p = Pens.Crimson; break;
                case 1: p = Pens.DarkCyan; break;
                case 2: p = Pens.DarkOliveGreen; break;
            }
            return p;
        }
        public void DrawImageToWithHeight(string pathAvatars, string fileName, Stream fileStream, int width, int height)
        {
            try
            {
                int thumbWidth = width;
                int thumbHeight = height;

                System.Drawing.Image oImg = System.Drawing.Image.FromStream(fileStream);
                System.Drawing.Image oThumbNail = new Bitmap(thumbWidth, thumbHeight, oImg.PixelFormat);

                Graphics oGraphic = Graphics.FromImage(oThumbNail);
                oGraphic.CompositingQuality = CompositingQuality.HighQuality;
                oGraphic.SmoothingMode = SmoothingMode.HighQuality;
                oGraphic.InterpolationMode = InterpolationMode.HighQualityBicubic;

                Rectangle oRectangle = new Rectangle(0, 0, thumbWidth, thumbHeight);
                oGraphic.DrawImage(oImg, oRectangle);

                oThumbNail.Save(pathAvatars + fileName, ImageFormat.Png);
                oImg.Dispose();
            }
            catch (Exception ex)
            {
                Logger.Log.error("DrawImageToWithHeight error:" + ex.Message);
            }
        }
    }
}

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace wa_ContableGaf
{
    public class Global : System.Web.HttpApplication
    {
        public static BackgroundWorker worker = new BackgroundWorker();
        public static int ID = 0;
        public static string reloj;
        public static bool stopWorker = false;
        protected void Application_Start(object sender, EventArgs e)
        {
            worker.DoWork += new DoWorkEventHandler(DoWork);
            worker.WorkerReportsProgress = true;
            worker.WorkerSupportsCancellation = true;
            worker.RunWorkerCompleted += new RunWorkerCompletedEventHandler(WorkerCompleted);
            // Calling the DoWork Method Asynchronously
            worker.RunWorkerAsync();
        }
        protected void Application_End(object sender, EventArgs e)
        {
            if (worker != null)
                worker.CancelAsync();
        }

        private static void DoWork(object sender, DoWorkEventArgs e)
        {
            reloj = DateTime.Now.ToLongTimeString();
        }

        private static void WorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
        {
            ID = 0;
            BackgroundWorker worker = sender as BackgroundWorker;
            if (worker != null)
            {
              
                if (!stopWorker)
                {
                    worker.RunWorkerAsync();
                }
                else
                {
                    while (stopWorker)
                    {
                        Thread.Sleep(6000);
                    }
                    worker.RunWorkerAsync();
                }
            }
        }
    }
}
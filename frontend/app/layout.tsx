import type { Metadata } from "next";
import { Geist, Geist_Mono } from "next/font/google";
import "../app/globals.css";

import Navbar from "@/components/layout/Navbar";
import { Toaster } from "react-hot-toast";
import ClientLayoutWrapper from "@/components/layout/ClientLayoutWapper";
import Providers from "./providers";


const geistSans = Geist({
  variable: "--font-geist-sans",
  subsets: ["latin"],
});

const geistMono = Geist_Mono({
  variable: "--font-geist-mono",
  subsets: ["latin"],
});

export const metadata: Metadata = {
  title: "ExpenseAI",
  description: "Manage your expenses easily",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en" className={`${geistSans.variable} ${geistMono.variable}`}>
      <body className="bg-base-200 text-base-content antialiased">
        <ClientLayoutWrapper>
          {/* NAVBAR */}
          <div className="flex items-center gap-2 border-b bg-base-100 px-4 py-3">
            <Navbar />
          </div>
          <main className="p-6 flex-1">
            <Providers>{children}</Providers>
          </main>
        </ClientLayoutWrapper>
      </body>
    </html>
  );
}

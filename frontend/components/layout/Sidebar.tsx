"use client";

import Link from "next/link";
import {
  LayoutDashboard,
  Upload,
  FileText,
  Shield,
} from "lucide-react";

export default function Sidebar() {
  return (
    <nav className="space-y-3">
      <Link className="flex items-center gap-2 hover:text-blue-600" href="/">
        <LayoutDashboard size={16} /> Dashboard
      </Link>

      <Link className="flex items-center gap-2 hover:text-blue-600" href="/upload">
        <Upload size={16} /> Upload
      </Link>

      <Link className="flex items-center gap-2 hover:text-blue-600" href="/claims">
        <FileText size={16} /> Claims
      </Link>

      <Link className="flex items-center gap-2 hover:text-blue-600" href="/admin">
        <Shield size={16} /> Admin
      </Link>
    </nav>
  );
}
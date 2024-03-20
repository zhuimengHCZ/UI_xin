export interface UserModel {
  userId: string;
  userName: string;
  password: string;
  phone: string;
  email: string;
  avatar?: string;
  birthday: string;
  sex: string;
  role?: string;
  sign?: string;
  region?: string;
  disabled?: number;
  permission?: number;
  createDate?: string;
  updateDate?: string;
}
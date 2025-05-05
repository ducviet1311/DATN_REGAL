import { useEffect } from 'react';
import { useLocation } from 'react-router-dom';
import { ToastContainer } from 'react-toastify';
import { Routes, Route, BrowserRouter as Router, Navigate } from 'react-router-dom';
import { publicRoutes } from './router/index';
import DefaultLayout from './layout/defaultLayout/defaultLayout';
import LoginPage from './page/login';

function ScrollToTop() {
    const { pathname } = useLocation();

    useEffect(() => {
        // Cuộn lên đầu trang mỗi khi pathname thay đổi
        window.scrollTo(0, 0);
    }, [pathname]);

    return null;
}

function App() {
    return (
        <Router>
            <div className="App">
                <ScrollToTop /> {/* Thêm component ScrollToTop */}
                <Routes>
                    {publicRoutes.map((route, index) => {
                        const Layout = route.layout || DefaultLayout;
                        const Page = route.component;
                        const Authen = route.authen;

                        if (Authen) {
                            const token = localStorage.getItem('token');
                            if (!token) {
                                return (
                                    <Route
                                        key={index}
                                        path={route.path}
                                        element={<Navigate to="/login" replace />}
                                    />
                                );
                            }
                        }

                        return (
                            <Route
                                key={index}
                                path={route.path}
                                element={
                                    <Layout>
                                        <Page />
                                    </Layout>
                                }
                            />
                        );
                    })}
                    <Route path="/login" element={<LoginPage />} />
                </Routes>
            </div>
            <ToastContainer />
        </Router>
    );
}

export default App;
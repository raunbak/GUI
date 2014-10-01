#include "filesavedialog.h"

#include <QDebug>
#include <QQuickWindow>

FileSaveDialog::FileSaveDialog(QQuickItem *parent)
    : QQuickItem(parent)
    , m_dlgHelper(init_helper())
    , m_modality(Qt::WindowModal)
    , m_options(QSharedPointer<QFileDialogOptions>(new QFileDialogOptions()))
{
    if (!m_dlgHelper)
    {
        qFatal("m_dlgHelper is NULL in constructor FileSaveDialog::FileSaveDialog()");
    }

    connect(m_dlgHelper, &QPlatformFileDialogHelper::accept,
            this, &FileSaveDialog::accept);
    connect(m_dlgHelper, &QPlatformFileDialogHelper::reject,
            this, &FileSaveDialog::reject);
}

FileSaveDialog::~FileSaveDialog()
{
    if (m_dlgHelper)
        m_dlgHelper->hide();
    delete m_dlgHelper;
}

QUrl FileSaveDialog::fileUrl() const
{
    return fileUrl_;
}

void FileSaveDialog::setFileUrl(QUrl fileUrl)
{
    if (fileUrl_ != fileUrl)
    {
        fileUrl_ = fileUrl;
        emit fileUrlChanged();
    }
}

QString FileSaveDialog::filename() const
{
    return filename_;
}

void FileSaveDialog::setFilename(QString filename)
{
    if (filename_ != filename)
    {
        filename_ = filename;
        emit filenameChanged();
    }
}

QString FileSaveDialog::title() const
{
    return title_;
}

void FileSaveDialog::setTitle(QString title)
{
    if (title_ != title)
    {
        title_ = title;
        emit titleChanged();
    }
}

QPlatformFileDialogHelper* FileSaveDialog::init_helper()
{
    m_dlgHelper = static_cast<QPlatformFileDialogHelper*>(QGuiApplicationPrivate::platformTheme()->createPlatformDialogHelper(QPlatformTheme::FileDialog));
    if (!m_dlgHelper)
        return NULL;

    return m_dlgHelper;
}

void FileSaveDialog::open()
{
    QQuickItem *parent = this->parentItem();
    Q_ASSERT(parent);

    QQuickWindow *window = parent->window();
    Q_ASSERT(window);

    m_parentWindow = window;

    m_options->setFileMode(QFileDialogOptions::AnyFile);
    m_options->setAcceptMode(QFileDialogOptions::AcceptSave);
    m_options->setWindowTitle(title());

    /*
     * Mac:
     * Set filename incl. directory via setInitiallySelectedFiles()
     *
     * Windows:
     * Set filename via setInitiallySelectedFiles() and let Windows choose the directory.
     * Default directory: C:\\Users\XYZ\Downloads
     *
     * Gnome:
     * Set directory via QPlatformFileDialogHelper::setDirectory() and leave
     * filename empty, since QGtk2FileDialogHelper can not set non-existing filenames.
     *
     */
#ifdef Q_OS_OSX
    QString initialSelection = QFileInfo(QDir::homePath(), filename()).absoluteFilePath();
    qDebug() << "Initial file:" << initialSelection;
    m_options->setInitiallySelectedFiles(QList<QUrl>() << QUrl::fromLocalFile(initialSelection));
#endif
#ifdef Q_OS_WIN
    qDebug() << "Initial filename:" << filename();
    m_options->setInitiallySelectedFiles(QList<QUrl>() << QUrl::fromLocalFile(filename()));
#endif
#ifdef Q_OS_LINUX
    qDebug() << "Initial directory:" << QDir::homePath();
    m_dlgHelper->setDirectory(QUrl::fromLocalFile(QDir::homePath()));
#endif

    m_dlgHelper->setOptions(m_options);
    m_dlgHelper->setFilter(); // applyOptions();

    Qt::WindowFlags flags = Qt::Dialog;
    if (!title().isEmpty()) flags |= Qt::WindowTitleHint;

    m_visible = m_dlgHelper->show(flags, m_modality, m_parentWindow);
}

void FileSaveDialog::close()
{
    m_dlgHelper->hide();
    m_visible = false;
}

void FileSaveDialog::accept()
{
    m_dlgHelper->hide();

    QList<QUrl> selectedUrls = m_dlgHelper->selectedFiles();
    if (!selectedUrls.empty())
    {
        setFileUrl(selectedUrls.at(0));
    }

    emit accepted();
}

void FileSaveDialog::reject()
{
    m_dlgHelper->hide();
    emit rejected();
}

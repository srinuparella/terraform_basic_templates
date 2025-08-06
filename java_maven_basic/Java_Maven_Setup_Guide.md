# ☕ Java + Maven Application Setup & Deployment (Ubuntu)

## ✅ Step 1: Install Java (OpenJDK 17)

```bash
sudo apt update
sudo apt install openjdk-17-jdk -y
```

**Verify Installation:**

```bash
java --version
```

---

## ✅ Step 2: Install Maven

### 🔹 Download Maven
Replace `<maven_version_file>` with the correct version link (e.g., from [Maven Downloads](https://maven.apache.org/download.cgi)):

```bash
wget <maven_version_file>
sudo tar xf <maven_version_file> -C /opt
```

Example:

```bash
wget https://dlcdn.apache.org/maven/maven-3/3.9.11/binaries/apache-maven-3.9.11-bin.tar.gz
sudo tar xf apache-maven-3.9.11-bin.tar.gz -C /opt
```

---

## ✅ Step 3: Configure Environment Variables

Edit `~/.bashrc` and add the following lines at the bottom:

```bash
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64/bin
export M3_HOME=/opt/apache-maven-3.9.11
export MAVEN_HOME=/opt/apache-maven-3.9.11
export PATH=${M3_HOME}/bin:${PATH}
```

**Apply Changes:**

```bash
source ~/.bashrc
```

**Fix permission if error:**

```bash
sudo chmod +x ~/.bashrc
```

---

## ✅ Step 4: Verify Maven Installation

```bash
mvn --version
```

---

## ✅ Step 5: Clone & Build Maven Project

```bash
git clone <your_repo_url>
cd <repo_folder>
mvn package
```

After successful build, a `.jar` file will be created in the `target/` directory.

---

## ✅ Step 6: Run the Application

```bash
java -jar <your-app>.jar
```

Open your browser and access:

```
http://<your-public-ip>:8080
```

---

## 🎉 Result

Your Java application is now:
- Built using Maven ✅  
- Packaged into a JAR ✅  
- Running and accessible via port **8080** ✅

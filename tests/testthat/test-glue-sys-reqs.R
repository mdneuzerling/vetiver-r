test_that("multiplication works", {
    skip_on_cran()
    plumber_sys_reqs_ubuntu <- glue_sys_reqs(
        "plumber",
        distribution = "ubuntu",
        release = "20.04"
    )

    expect_identical(
        plumber_sys_reqs_ubuntu,
        glue::glue(
            "RUN apt-get update -qq && apt-get install -y --no-install-recommends \\\n",
            "  libcurl4-openssl-dev \\\n",
            "  libicu-dev \\\n",
            "  libsodium-dev \\\n",
            "  make",
            "\n",
            .trim = FALSE
        )
    )
})

test_that("multiplication works", {
    skip_on_cran()
    plumber_sys_reqs_centos <- glue_sys_reqs(
        "plumber",
        distribution = "centos",
        release = "7"
    )

    expect_identical(
        plumber_sys_reqs_centos,
        glue::glue(
            "RUN yum update -y && yum install -y \\\n",
            "  libcurl-devel \\\n",
            "  libicu-devel \\\n",
            "  libsodium-devel \\\n",
            "  make && \\\n",
            "  yum clean all",
            "\n",
            .trim = FALSE
        )
    )
})
